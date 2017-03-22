<?php
/**
 * Created by PhpStorm.
 * User: 温柔一刀
 * Date: 2017/2/17
 * Time: 14:46
 * 云服务端控制器
 */
namespace Home\Controller;

class ServerController extends HomeController{

    public function index()
    {
        session('userurl',$_SERVER['REQUEST_URI']);//记录登录前的页面地址
        //套餐云产品
        $package_list = D('PackageHost')->order('level asc')->select();
        /*不要机房了
        if(!empty($package_list)){
            foreach($package_list as $key=>$value){
                $package_list[$key]['computer_room'] = json_decode($value['computer_room'],true);
            }
        }
        */


        //弹性云主机
        $model = M('elastic_host');
        $basic = $model->find(1);//入门型
        $standard = $model->find(2);//标准型
        $business = $model->find(3);//商务型
        $comfortable = $model->find(4);//舒适型
        $enterprise = $model->find(5);//企业型
        $luxury = $model->find(6);//豪华型

        //操作系统
        $windows = M('elastic_osconfig')->where('os_type=1')->select();//windows操作系统
        $linux = M('elastic_osconfig')->where('os_type=2')->select();//linux操作系统

        //服务标准
        $service = M('elastic_service')->select();

        //线路
        $line = M('elastic_line')->select();
        //基本配置
        $elastic_config = M('elastic_config')->find(1);

        //cpu范围
        /*
        $max_cpu_num = $elastic_config['max_cpu_num'];
        $level = ceil($max_cpu_num / 2);
        if($level>1){
            for($i=1;$i<=$level;$i++){
                $cpu[] = $i*2;
            }
        }
        print_r($cpu);
        */

        $this->assign('elastic_config',$elastic_config);
        $this->assign('line',$line);
        $this->assign('service',$service);
        $this->assign('linux',$linux);
        $this->assign('windows',$windows);
        $this->assign('basic',$basic);
        $this->assign('standard',$standard);
        $this->assign('business',$business);
        $this->assign('comfortable',$comfortable);
        $this->assign('enterprise',$enterprise);
        $this->assign('luxury',$luxury);
        $this->assign('package_list',$package_list);
        $this->display();
    }
    
    //计算价格
    public function ajaxCalculatePrice()
    {
        $data = I('post.');
        $cpu = $this->getCpuValue($data['cpu']);//cpu核数
        $memory = $this->getMemoryValue($data['ram']);//内存大小
        $disk = $data['data'];//硬盘大小
        $bandwidth = $data['flux'];//带宽大小
        $line_id = $data['room'];//线路id
        $service_id = $data['servicetype'];//服务id
        $buytime = $data['renewTime'];//购买时间 月
        $buycount = $data['buycount'];//购买数量
        $os_id = $data['CHOICE_OS'];//操作系统id
        if(!$os_id){
            $return = array("status"=>0,"msg"=>'请选择操作系统');
            echo json_encode($return);exit;
        }

        //基本配置
        /*$elastic_config = S('elastic_config');
        if(empty($elastic_config)){
            $elastic_config = M('elastic_config')->find(1);
            S("elastic_config",$elastic_config,60);//缓存60秒
        }*/
        $elastic_config = M('elastic_config')->find(1);
        //线路详情
        $linearr = S("linearr");
        if(empty($linearr)){
            $all = M('elastic_line')->select();
            $linearr = convert_arr_key($all,'id');
            S("linearr",$linearr,60);//缓存60秒
        }
        $lineinfo = $linearr[$line_id];//线路详情

        //服务详情
        $servicearr = S("servicearr");
        if(empty($servicearr)){
            $service = M('elastic_service')->select();
            $servicearr = convert_arr_key($service,'id');
            S("servicearr",$servicearr,60);//缓存60秒
        }
        $serviceinfo = $servicearr[$service_id];//服务详情

        //操作系统详情
        $osarr = S("osarr");
        if(empty($osarr)){
            $allos = M('elastic_osconfig')->select();
            $osarr = convert_arr_key($allos,'id');
            S("osarr",$osarr,60);//缓存60秒
        }
        $osinfo = $osarr[$os_id];//操作系统详情

        //统计价格总和 = (cpu+内存+硬盘+带宽+操作系统+线路+服务标准)*购买月份*数量
        $cpuprice = $elastic_config['cpu_price']*$cpu;//cpu价格 = cpu单价*cpu核数
        $memoryprice = $elastic_config['memory_price'] * $memory;//cpu价格 = cpu单价*cpu核数
        $diskprice = $elastic_config['disk_price'] * $disk;//硬盘价格
        $bandwidthprice = $elastic_config['bandwidth_price'] * $bandwidth;//带宽价格
        $osprice = $osinfo['price'];//操作系统价格
        $lineprice = $lineinfo['price'];//线路价格
        $serviceprice = $serviceinfo['price'];//服务标准价格
        $total = ($cpuprice + $memoryprice + $diskprice + $bandwidthprice + $osprice + $lineprice + $serviceprice) *$buytime *$buycount;
        $return = array("status"=>1,"total"=>$total,"msg"=>'');
        echo json_encode($return);exit;

    }

    //根据输入的index值还原CPU的值
    private function getCpuValue($index){
        if(!$index){
            return false;
        }
        switch($index){
            case 1:
                $value = 1;
                break;
            case 2:
                $value = 2;
                break;
            case 3:
                $value = 4;
                break;
            case 4:
                $value = 8;
                break;
            case 5:
                $value = 12;
                break;
            case 6:
                $value = 16;
                break;
            default:
                $value = 16;
        }
        return $value;
    }

    //根据输入的index还原内存值
    private function getMemoryValue($index){
        if(!$index){
            return false;
        }
        switch($index){
            case 1:
                $value = 0.5;
                break;
            case 2:
                $value = 1;
                break;
            case 3:
                $value = 2;
                break;
            case 4:
                $value = 3;
                break;
            case 5:
                $value = 4;
                break;
            case 6:
                $value = 6;
                break;
            case 7:
                $value = 8;
                break;
            case 8:
                $value = 12;
                break;
            case 9:
                $value = 16;
                break;
            case 10:
                $value = 32;
                break;
            case 11:
                $value = 64;
                break;
            case 12:
                $value = 128;
                break;
            default:
                $value = 0.5;
        }
        return $value;
    }

    //检测用户是否登录
    public function ajaxCheckLogin()
    {
        $user = session('user_auth');
        if(empty($user)){
            echo 0;
        }else{
            echo $user['id'];
        }
    }

    /*
     * 购买表单
     */
    public function buyHost()
    {
        /* 用户登录检测 */
        $user = session('user_auth');
        if(empty($user)){
            $this->error("用户未登录！");
        }

        $data = I('post.');
        $agreement = $data['agreement'];//同意协议

        $cpu = $this->getCpuValue($data['cpu']);//cpu核数
        $memory = $this->getMemoryValue($data['ram']);//内存大小
        $disk = $data['data'];//硬盘大小
        $bandwidth = $data['flux'];//带宽大小
        $line_id = $data['room'];//线路id
        $service_id = $data['servicetype'];//服务id
        $buytime = $data['renewTime'];//购买时间 月
        $buycount = $data['buycount'];//购买数量
        $os_id = $data['CHOICE_OS'];//操作系统id
        if(!$agreement){
            $this->error("请阅读并勾选《云服务器租用协议》");
            exit;
        }
        //基本配置
        /*$elastic_config = S('elastic_config');
        if(empty($elastic_config)){
            $elastic_config = M('elastic_config')->find(1);
            S("elastic_config",$elastic_config,60);//缓存60秒
        }*/
        $elastic_config = M('elastic_config')->find(1);
        //线路详情
        $linearr = S("linearr");
        if(empty($linearr)){
            $all = M('elastic_line')->select();
            $linearr = convert_arr_key($all,'id');
            S("linearr",$linearr,60);//缓存60秒
        }
        $lineinfo = $linearr[$line_id];//线路详情

        //服务详情
        $servicearr = S("servicearr");
        if(empty($servicearr)){
            $service = M('elastic_service')->select();
            $servicearr = convert_arr_key($service,'id');
            S("servicearr",$servicearr,60);//缓存60秒
        }
        $serviceinfo = $servicearr[$service_id];//服务详情

        //操作系统详情
        $osarr = S("osarr");
        if(empty($osarr)){
            $allos = M('elastic_osconfig')->select();
            $osarr = convert_arr_key($allos,'id');
            S("osarr",$osarr,60);//缓存60秒
        }
        $osinfo = $osarr[$os_id];//操作系统详情

        //统计价格总和 = (cpu+内存+硬盘+带宽+操作系统+线路+服务标准)*购买月份*数量
        $cpuprice = $elastic_config['cpu_price']*$cpu;//cpu价格 = cpu单价*cpu核数
        $memoryprice = $elastic_config['memory_price'] * $memory;//内存价格 = 内存单价*数量
        $diskprice = $elastic_config['disk_price'] * $disk;//硬盘价格
        $bandwidthprice = $elastic_config['bandwidth_price'] * $bandwidth;//带宽价格
        $osprice = $osinfo['price'];//操作系统价格
        $lineprice = $lineinfo['price'];//线路价格
        $serviceprice = $serviceinfo['price'];//服务标准价格
        $buytime_total = ($cpuprice + $memoryprice + $diskprice + $bandwidthprice + $osprice + $lineprice + $serviceprice) *$buytime ;//购买时长总价格
        $subtotal = $buytime_total * $buycount;//总价格
        //加入购物车
        $buy_config = array(
            'cpu' => $cpu,//cpu核数量
            'memory' => $memory,//内存大小
            'disk' => $disk,//硬盘大小
            'bandwidth' => $bandwidth,//带宽大小
            'line_id' => $line_id,//线路id
            'service_id' => $service_id,//服务id
            'buytime' => $buytime,//购买时长 月
            'buycount' => $buycount,//购买数量
            'os_id' => $os_id,//系统id
            'line_name' => $lineinfo['name'],//线路名称
            'service_name' => $serviceinfo['name'],//服务名称
            'os_name' => $osinfo['name'],//操作系统名称
        );

        $model = D("Cart");
        $data = array();
        $data['uid'] = $user['id'];
        $data['product_id'] = 0;//新一代产品id
        $data['name'] = "弹性云主机";
        $data['keywords'] = '无';
        $data['number'] = $buycount;
        $data['price'] = $buytime_total;//域名单价未知
        $data['month'] = $buytime;//购买时限
        $data['base_total'] = $subtotal;
        $data['added_price'] = 0.00;

        $project['name'] = "弹性云主机";//方案名称
        $project['os'] = $osinfo['name'];//操作系统

        $data['project'] = json_encode($project);//方案信息
        $data['parameters'] = json_encode($buy_config);//产品参数信息
        $data['type'] = 4;//产品类型 1=域名 2=虚拟机3=企业邮箱4=云服务器5=云建站
        $data['domain_info'] = '';//域名注册信息
        $data['subtotal'] = $data['base_total'] + $data['added_price'];//全部总价
        $data['price_id'] = 0;
        $data['buy_config'] = json_encode($buy_config);//用户购买的配置信息
        $res = $model->addCart($data);//加入购物车
        if($res){
            $this->success('加入购物车成功', U('Cart/index'));
        }

    }
    
    /*
     * 购买云套餐主机
     */
    public function buyPackageHost()
    {
        /* 用户登录检测 */
        $user = session('user_auth');
        if(empty($user)){
            $return = array("status"=>2,"msg"=>"用户未登录");
            echo json_encode($return);exit;
        }

        $data = I('post.');

        //加入购物车
        $buy_config = array(
            'cpu' => $data['CPU'],//cpu
            'memory' => $data['Memory'],//内存大小
            'disk' => $data['HardDisk'],//硬盘大小
            'hostname' => $data['Hostname'],//主机名称
            'buytime' => $data['month'],//购买时长 月
            'host_id' => $data['productid'],//套餐云id
            'price' => $data['price'],//总价格
            'bandwidth' => $data['bandwidth'],//带宽
            'ip' => $data['ip'],
        );

        $model = D("Cart");
        $data = array();
        $data['uid'] = $user['id'];
        $data['product_id'] = 0;//新一代产品id
        $data['name'] = "套餐云主机-".$buy_config['hostname'];
        $data['keywords'] = '无';
        $data['number'] = 1;
        $data['price'] = $buy_config['price'];//域名单价未知
        $data['month'] = $buy_config['buytime'];//购买时限
        $data['base_total'] = $buy_config['price'];
        $data['added_price'] = 0.00;

        $project['name'] = "套餐云主机-".$buy_config['hostname'];//方案名称

        $data['project'] = json_encode($project);//方案信息
        $data['parameters'] = json_encode($buy_config);//产品参数信息
        $data['type'] = 6;//产品类型 1=域名 2=虚拟机3=企业邮箱4=弹性云主机5=云建站 6=套餐云主机
        $data['domain_info'] = '';//域名注册信息
        $data['subtotal'] = $data['price'] + $data['added_price'];//全部总价
        $data['price_id'] = 0;
        $data['buy_config'] = json_encode($buy_config);//用户购买的配置信息
        $res = $model->addCart($data);//加入购物车
        if($res){
            $return = array("status"=>1,"url"=>U('Cart/index'),"msg"=>"加入购物车成功");
            echo json_encode($return);exit;
        }

        print_r($data);
    }
    
}
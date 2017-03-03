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
        if(!empty($package_list)){
            foreach($package_list as $key=>$value){
                $package_list[$key]['computer_room'] = json_decode($value['computer_room'],true);
            }
        }

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
}
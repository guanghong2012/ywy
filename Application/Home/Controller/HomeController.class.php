<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Home\Controller;
use Org\Schedule\Queue;
use Think\Controller;

/**
 * 前台公共控制器
 * 为防止多分组Controller名称冲突，公共Controller名称统一使用分组名称
 */
class HomeController extends Controller {

	/* 空操作，用于输出404页面 */
	public function _empty(){
		$this->redirect('Index/index');
	}


    protected function _initialize(){
        /* 读取站点配置 */
        $config = api('Config/lists');
        C($config); //添加配置
        $userinfo = session('user_auth');
        if(!empty($userinfo)){
            $user_login = 1;
            $user_name = $userinfo['username'];

            if(S($userinfo['id'].'_carNum')){
                $carNum = S($userinfo['id'].'_carNum');//读取缓存数据
            }else{
                $carNum = D("Cart")->getCartNumByUid($userinfo['id']);
                S($userinfo['id'].'_carNum',$carNum,3);//缓存5秒
            }

            if(S($userinfo['id'].'_userAccount')){
                $user_account = S($userinfo['id'].'_userAccount');//读取缓存数据
            }else{
                $user_account = D('Cuser')->where('id='.$userinfo['id'])->getField('account');
                S($userinfo['id'].'_userAccount',$user_account,3);
            }

            $this->assign('user_name',$user_name);
            $this->assign('user_account',$user_account);
        }else{
            $carNum = 0;
            $user_login = 0;

        }
        //公司联系我们公共配置

        $public_contact = S("PUBLIC_CONFIGS");
        if(!$public_contact){
            $public_contact = D('document')->detail(10);
            S('PUBLIC_CONFIGS',$public_contact,5);//缓存5秒
        }

        $this->assign('public_contact',$public_contact);//购物车数量
        $this->assign('carNum',$carNum);//购物车数量
        $this->assign('user_login',$user_login);
        if(!C('WEB_SITE_CLOSE')){
            $this->error('站点已经关闭，请稍后访问~');
        }
    }

	/* 用户登录检测 */
	protected function is_login(){
		/* 用户登录检测 */
        $user = session('user_auth');
        if(empty($user)){
            $this->error('您还没有登录，请先登录！', U('Cuser/login'));
        }else{
            return $user['id'];
        }
	}

    /*
     * 对订单中需要接口处理的产品分别加入队列处理
     */
    protected function addToQueue($order_id)
    {
        $queue = new Queue();
        if(empty($order_id)){
            return false;
        }
        //判断订单支付状态 0=未支付 1=已支付
        $order = D('Order')->detail($order_id);
        if(!$order['status']){
            return false;
        }
        //取出订单产品
        $map = array();
        $map['order_id'] = $order_id;
        $map['type'] = array("in",array(1,2,3));//产品类型 1=域名 2=虚拟机3=企业邮箱4=弹性云主机5=云建站模板 6=套餐云主机
        $goods = M('OrderGoods')->where($map)->select();
        if(empty($goods)){
            return;
        }else{
            foreach($goods as $key=>$value){
                $buy_config = json_decode($value['buy_config'],true);
                if(!empty($value['domain_info'])){
                    $domain_info = json_decode($value['domain_info'],true);
                }
                switch($value['type']){
                    case 1:
                        $schedule_data = array(
                            'domain' => $buy_config['domain'],
                            'year' => $buy_config['year'],
                            'tld' => $buy_config['tld'],
                            'lang' => $buy_config['lang'],
                            'encoding' => $buy_config['encoding'],

                            //注册人信息
                            'r_manager' => $domain_info['r_manager'],//法人代表姓名
                            'r_industry' => $domain_info['r_industry'],//行业类型 现在统一为  S18

                            'r_organization' => $domain_info['r_organization'],
                            'r_organization1' => $domain_info['r_organization1'],
                            'r_name' => $domain_info['r_name'],
                            'r_name1' => $domain_info['r_name1'],
                            'r_country' => $domain_info['r_country'],
                            'r_province' => $domain_info['r_province'],
                            'r_province1' => $domain_info['r_province1'],
                            'r_city' => $domain_info['r_city'],
                            'r_city1' => $domain_info['r_city1'],
                            'r_postcode' => $domain_info['r_postcode'],
                            'r_email' => $domain_info['r_email'],
                            'r_street' => $domain_info['r_street'],
                            'r_street1' => $domain_info['r_street1'],
                            'r_phone' => $domain_info['r_phone'],
                            'r_fax' => $domain_info['r_fax'],

                            //管理联系人
                            'a_manager' => $domain_info['r_manager'],//法人代表姓名
                            'a_industry' => $domain_info['r_industry'],//行业类型 现在统一为  S18

                            'a_organization' => $domain_info['r_organization'],
                            'a_organization1' => $domain_info['r_organization1'],
                            'a_name' => $domain_info['r_name'],
                            'a_name1' => $domain_info['r_name1'],
                            'a_country' => $domain_info['r_country'],
                            'a_province' => $domain_info['r_province'],
                            'a_province1' => $domain_info['r_province1'],
                            'a_city' => $domain_info['r_city'],
                            'a_city1' => $domain_info['r_city1'],
                            'a_postcode' => $domain_info['r_postcode'],
                            'a_email' => $domain_info['r_email'],
                            'a_street' => $domain_info['r_street'],
                            'a_street1' => $domain_info['r_street1'],
                            'a_phone' => $domain_info['r_phone'],
                            'a_fax' => $domain_info['r_fax'],

                            //续费联系人
                            'b_manager' => $domain_info['r_manager'],//法人代表姓名
                            'b_industry' => $domain_info['r_industry'],//行业类型 现在统一为  S18

                            'b_organization' => $domain_info['r_organization'],
                            'b_organization1' => $domain_info['r_organization1'],
                            'b_name' => $domain_info['r_name'],
                            'b_name1' => $domain_info['r_name1'],
                            'b_country' => $domain_info['r_country'],
                            'b_province' => $domain_info['r_province'],
                            'b_province1' => $domain_info['r_province1'],
                            'b_city' => $domain_info['r_city'],
                            'b_city1' => $domain_info['r_city1'],
                            'b_postcode' => $domain_info['r_postcode'],
                            'b_email' => $domain_info['r_email'],
                            'b_street' => $domain_info['r_street'],
                            'b_street1' => $domain_info['r_street1'],
                            'b_phone' => $domain_info['r_phone'],
                            'b_fax' => $domain_info['r_fax'],

                            //技术联系人
                            't_manager' => $domain_info['r_manager'],//法人代表姓名
                            't_industry' => $domain_info['r_industry'],//行业类型 现在统一为  S18

                            't_organization' => $domain_info['r_organization'],
                            't_organization1' => $domain_info['r_organization1'],
                            't_name' => $domain_info['r_name'],
                            't_name1' => $domain_info['r_name1'],
                            't_country' => $domain_info['r_country'],
                            't_province' => $domain_info['r_province'],
                            't_province1' => $domain_info['r_province1'],
                            't_city' => $domain_info['r_city'],
                            't_city1' => $domain_info['r_city1'],
                            't_postcode' => $domain_info['r_postcode'],
                            't_email' => $domain_info['r_email'],
                            't_street' => $domain_info['r_street'],
                            't_street1' => $domain_info['r_street1'],
                            't_phone' => $domain_info['r_phone'],
                            't_fax' => $domain_info['r_fax'],

                            'goods_id' => $value['id']//订单产品id
                        );
                        $queue::add($type='domainRegister',$name='域名注册-'.$buy_config['domain'],$schedule_data,$schedule_time=time(),$value['id']);//加入队列
                        break;
                    case 2:
                        $schedule_data = array(
                            'domain' => $buy_config['domain'],
                            'product_id' => $buy_config['product_id'],
                            'timeperiod' => $buy_config['timeperiod'],
                            'os_type' => $buy_config['os_type'],
                            'goods_id' => $value['id']//订单产品id
                        );
                        $queue::add($type='buyHost',$name='虚拟主机注册',$schedule_data,$schedule_time=time(),$value['id']);
                        break;
                    case 3:
                        $schedule_data = array(
                            'domain' => $buy_config['domain'],
                            'quota' => $buy_config['quota'],
                            'timeperiod' => $buy_config['timeperiod'],
                            'number' => $buy_config['number'],
                            'goods_id' => $value['id']//订单产品id
                        );
                        $queue::add($type='buyMail',$name='全球邮购买',$schedule_data,$schedule_time=time(),$value['id']);
                        break;

                }

            }
        }
    }

    /*
     * 对续费订单产品加入队列并立即执行
     */
    protected function addToQueueRenew($order_id){
        $queue = new Queue();
        if(empty($order_id)){
            return false;
        }
        //判断订单支付状态 0=未支付 1=已支付
        $order = M('renew_order')->find($order_id);
        if(!$order['status']){
            return false;
        }
        //取出订单产品
        $map = array();
        $map['order_id'] = $order_id;
        $goods = M('renew_order_goods')->where($map)->find();
        if(empty($goods)){
            return;
        }else{
            $buy_config = json_decode($goods['buy_config'],true);//接口配置项
            switch($goods['type']){
                //domain:域名 vitrual:虚拟机 mail:企业邮局 template:网站模板 host:弹性云主机 packagehost:套餐云主机
                case 'domain':
                    $schedule_data = array(
                        'domain' => $buy_config['domain'],//续费站点的域名
                        'year' => $buy_config['year'],//续费的时限(年)
                        'tld' => $buy_config['tld'],//域名后缀
                        'lang' => $buy_config['lang'],//域名语言
                        'encoding' => $buy_config['encoding'],//域名编码
                        'cur_expiry_time' => $buy_config['cur_expiry_time'],//当前主机的过期时间
                        'goods_id' => $goods['id']//订单产品id
                    );
                    $queue::add($type='renewDomain',$name='域名续费',$schedule_data,$schedule_time=0,$goods['id']);//加入计划任务并且立即执行
                    break;
                case 'vitrual':
                    $schedule_data = array(
                        'domain' => $buy_config['domain'],//续费站点的域名
                        'order_id' => $buy_config['order_id'],//注册时候的订单ID
                        'Timeperiod' => $buy_config['Timeperiod'],//续费的时限(月)
                        'cur_expiry_time' => $buy_config['cur_expiry_time'],//当前主机的过期时间
                        'goods_id' => $goods['id']//订单产品id
                    );
                    $queue::add($type='renewVitrual',$name='虚拟主机续费',$schedule_data,$schedule_time=0,$goods['id']);//加入计划任务并且立即执行
                    break;
                case 'mail':
                    $schedule_data = array(
                        'mail_id' => $buy_config['mail_id'],//DIY邮局ID
                        'domain' => $buy_config['domain'],//DIY邮局域名
                        'timeperiod' => $buy_config['timeperiod'],//续费年限
                        'cur_expiry_time' => $buy_config['cur_expiry_time'],//当前域名的过期时间
                        'goods_id' => $goods['id']//订单产品id
                    );
                    $queue::add($type='renewMail',$name='邮局续费',$schedule_data,$schedule_time=0,$goods['id']);//加入计划任务并且立即执行
                    break;
                case 'template':
                    M('renew_order_goods')->where($map)->setField('product_status',1);
                    //网页模板直接更新到期时间
                    $original_time = M('user_template')->where('id='.$goods['user_goods_id'])->getField('expiry_time');
                    $new_expiry_time = intval($original_time) + 3600*24*30*12;
                    M('user_template')->where('id='.$goods['user_goods_id'])->setField('expiry_time',$new_expiry_time);

                    break;
                case 'host':
                    //弹性云主机后台手动操作续费操作
                    break;
                case 'packagehost':
                    //套餐云主机后台手动操作续费操作
                    break;
            }


        }


    }

    /*
     * 订单支付宝支付处理
     */
    protected function doOrderAlipay($order_id,$paylog_id,$goods_name='亿维云产品购买'){
        if(!$order_id){
            return false;
        }
        $paytype = 'alipay';
        $order_id = (int)$order_id;//订单id
        $paylog_id = (int)$paylog_id;//支付记录id
        $order = D('Order')->find($order_id);//订单详情

        //$total = $order['total'];//支付金额
        $total = 0.01;//测试过程设置为0.01 支付金额

        $pay = new \Think\Pay($paytype, C('payment.' . $paytype));
        $order_no = $pay->createOrderNo();
        $vo = new \Think\Pay\PayVo();
        $vo->setBody($goods_name)
            ->setFee($total) //支付金额
            ->setOrderNo($order_no)
            ->setTitle($goods_name)
            ->setCallback("Home/Cart/alipayOrderDone") //支付完成后的后续操作接口
            ->setUrl(U("Home/Cart/OrderOk")) //支付完成后的跳转地址
            ->setParam(array('order_id' => $order_id,'paylog_id'=>$paylog_id));
        echo $pay->buildRequestForm($vo);


    }

    /*
     * 续费支付宝支付处理
     *
     */
    protected function doRenewAlipay($order_id,$paylog_id,$goods_name='亿维云产品续费'){
        if(!$order_id){
            return false;
        }
        $paytype = 'alipay';
        $order_id = (int)$order_id;//订单id
        $paylog_id = (int)$paylog_id;//支付记录id
        $order = M('renew_order')->find($order_id);//续费订单详情

        //$total = $order['total'];//支付金额
        $total = 0.01;//测试过程设置为0.01 支付金额

        $pay = new \Think\Pay($paytype, C('payment.' . $paytype));
        $order_no = $pay->createOrderNo();
        $vo = new \Think\Pay\PayVo();
        $vo->setBody($goods_name)
            ->setFee($total) //支付金额
            ->setOrderNo($order_no)
            ->setTitle($goods_name)
            ->setCallback("Home/Cart/alipayRenewDone") //支付完成后的后续操作接口
            ->setUrl(U("Home/Cart/OrderOk")) //支付完成后的跳转地址
            ->setParam(array('order_id' => $order_id,'paylog_id'=>$paylog_id));
        echo $pay->buildRequestForm($vo);
    }

    /*
     * 文件写入
     */
    public function log_result($file,$txt)
    {
        $fp =  fopen($file,'ab+');
        fwrite($fp,'-----------'.date('Y-m-d H:i:s').'-----------------');
        fwrite($fp,$txt);
        fwrite($fp,"\r\n\r\n\r\n");
        fclose($fp);
    }

    //根据域名后缀查询单价 并返回10年的价格数组
    protected function getDomainPrice($tld)
    {
        if(empty($tld)){
            return false;
        }
        $map['tld'] = $tld;
        $price = M('document_domain')->where($map)->getField("price");//1年价格
        $arr[0] = array('year'=>1,'price'=>$price);
        $arr[1] = array('year'=>2,'price'=>$price*2);
        $arr[2] = array('year'=>3,'price'=>$price*3);
        $arr[3] = array('year'=>4,'price'=>$price*4);
        $arr[4] = array('year'=>5,'price'=>$price*5);
        $arr[5] = array('year'=>6,'price'=>$price*6);
        $arr[6] = array('year'=>7,'price'=>$price*7);
        $arr[7] = array('year'=>8,'price'=>$price*8);
        $arr[8] = array('year'=>9,'price'=>$price*9);
        $arr[9] = array('year'=>10,'price'=>$price*10);

        return $arr;
    }

    /*
     * 获取一个域名单价
     */
    protected function getSingleDomainPrice($tld){
        if(empty($tld)){
            return false;
        }
        $map['tld'] = $tld;
        $price = M('document_domain')->where($map)->getField("price");//1年价格
        return $price;
    }


}

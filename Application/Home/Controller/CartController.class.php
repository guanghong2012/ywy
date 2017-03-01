<?php
/**
 * Created by PhpStorm.
 * User: 温柔一刀
 * Date: 2017/2/22
 * Time: 15:40
 * 购物车控制器
 */
namespace Home\Controller;

class CartController extends HomeController{
    public function _initialize()
    {
        parent::_initialize();
        $this->is_login();
        $this->model = D("Cart");
    }

    /*
     * 购物车列表
     */
    public function index()
    {
        $user = session('user_auth');
        $uid = $user['id'];

        //获取用户的购物车列表
        $list = $this->model->getCartByUid($uid);
        foreach($list as &$value){
            if(!empty($value['domain_info'])){
                $value['domain_info'] = json_decode($value['domain_info'],true);//域名信息

            }
            if(!empty($value['parameters'])){
                $value['parameters'] = json_decode($value['parameters'],true);//产品参数信息
            }
            $value['project'] = json_decode($value['project'],true);//方案信息
            $value['year'] = $value['month']/12;
            if(2==$value['type']){
                //虚拟主机
                $price_info = M('CpPrice')->where('id='.$value['price_id'])->find();
                switch($price_info['type_id']){
                    case 1:
                        $lineType = '国内线路';
                        break;
                    case 2:
                        $lineType = '香港加速';
                        break;
                    case 3:
                        $lineType = '香港优质';
                        break;
                    case 4:
                        $lineType = '独立ip';
                        break;
                    case 5:
                        $lineType = '美国线路';
                        break;
                    default:
                        $lineType = '国内线路';
                }
                $value['lineType'] = $lineType;
            }

        }
        //print_r($list);
        $total = $this->model->getToal('',$uid);//购物车总价

        $this->assign('total',$total);
        $this->assign('list',$list);
        $this->display();
    }

    /*
     *从购物车删除
     */
    public function DeleteCart($id)
    {
        if(IS_AJAX){
            if(!$id){
                $return = array("status"=>0,"msg"=>"缺少id");
                echo json_encode($return);exit();
            }
            $res = $this->model->removeCart($id);
            if($res){
                $return = array("status"=>1,"url"=>U('Cart/index'),"msg"=>"删除成功！");

            }else{
                $return = array("status"=>0,"msg"=>"删除出错！");

            }
            echo json_encode($return);exit();
        }
    }

    /*
     * 选择支付方式
     */
    public function selectPayment()
    {
        $user = session('user_auth');
        $uid = $user['id'];

        //获取用户的购物车列表
        $list = $this->model->getCartByUid($uid);
        if(empty($list)){
            $this->error("购物车为空！");
        }
        foreach($list as &$value){
            if(!empty($value['domain_info'])){
                $value['domain_info'] = json_decode($value['domain_info'],true);//域名信息

            }
            if(!empty($value['parameters'])){
                $value['parameters'] = json_decode($value['parameters'],true);//产品参数信息
            }
            $value['year'] = $value['month']/12;
            $value['project'] = json_decode($value['project'],true);//方案信息
            if(2==$value['type']){
                //虚拟主机
                $price_info = M('CpPrice')->where('id='.$value['price_id'])->find();
                switch($price_info['type_id']){
                    case 1:
                        $lineType = '国内线路';
                        break;
                    case 2:
                        $lineType = '香港加速';
                        break;
                    case 3:
                        $lineType = '香港优质';
                        break;
                    case 4:
                        $lineType = '独立ip';
                        break;
                    case 5:
                        $lineType = '美国线路';
                        break;
                    default:
                        $lineType = '国内线路';
                }
                $value['lineType'] = $lineType;
            }
        }
        $total = $this->model->getToal('',$uid);//购物车总价

        $this->assign('total',$total);
        $this->assign('list',$list);
        $this->display();
    }

    /*
     * 确认支付页面
     */
    public function orderDone()
    {
        $user = session('user_auth');
        $uid = $user['id'];
        //获取用户的购物车列表
        $list = $this->model->getCartByUid($uid);
        if(empty($list)){
            $this->error("购物车为空！");
        }

        $payment = I('post.payment');
        !$payment && $this->error("请重新提交表单");
        $total = $this->model->getToal('',$uid);//购物车总价
        $user_account = D('Cuser')->where('id='.$uid)->getField('account');

        $this->assign('account',$user_account);
        $this->assign('total',$total);
        $this->assign('payment',$payment);
        $this->display();
    }

    /*
     * 验证余额生成订单
     */
    public function createOrder()
    {
        $payment = intval(I('get.payment'));
        if(!$payment){
            $this->redirect('Cart/selectPayment',2,'请选择支付方式');
        }
        $user = session('user_auth');
        $uid = $user['id'];
        //获取用户的购物车列表
        $list = $this->model->getCartByUid($uid);
        if(empty($list)){
            $this->redirect('Index/index',2,'购物车为空！');
        }
        $total = $this->model->getToal('',$uid);//购物车总价
        $user_account = D('Cuser')->where('id='.$uid)->getField('account');//用户余额
        //如果是余额支付 判断用户余额是否充足
        if(3 == $payment){
            if($total>$user_account){
                redirect('Home/Cart/selectPayment',2,'余额不足');
            }
        }
        //遍历购物车 生成订单
        $order = array(
            'uid' => $uid,
            'ordersn' => time(),
            'payment' => $payment,//支付方式 1=微信支付 2=支付宝支付 3=余额支付
            'status' => 0,//支付状态 0=未支付 1=已支付
            'total' => $total,
            'username' => $user['username'],
            'mobile' => $user['mobile'],
            'create_time' => time()
        );
        $order_id = D('Order')->addOrder($order);
        if($order_id){
            $i = 0;
            $cartnum = count($list);
            //生成订单产品
            foreach($list as $key=>$value){
                $goods = array(
                    'uid' => $uid,
                    'username' => $user['username'],
                    'mobile' => $user['mobile'],
                    'product_name' => $value['name'],//产品名称
                    'product_id' => $value['product_id'],//新一代产品id
                    'month' => $value['month'],//购买月份
                    'base_total' => $value['base_total'],//产品基本总价
                    'added_price' => $value['added_price'],//增值总价
                    'type' => $value['type'],//产品类型 1=域名 2=虚拟机3=企业邮箱4=云服务器5=云建站模板
                    'subtotal' => $value['subtotal'],//总金额
                    'payment' => $payment,
                    'project' => $value['project'],//方案信息
                    'parameters' => $value['parameters'],//产品详细参数
                    'domain_info' => $value['domain_info'],//域名注册人信息
                    'price_id' => $value['price_id'],//虚拟机价格id
                    'order_id' => $order_id,
                    'buy_config' => $value['buy_config']//用户购买配置信息
                );
                $res = M('OrderGoods')->add($goods);
                $res && $i++;
            }
            if($i == $cartnum){
                //清空用户购物车
                $this->model->clearCartByUid($uid);
                //去支付
                //生成支付记录
                $order_sn = D('Order')->where('id='.$order_id)->getField('ordersn');

                $paylog = array(
                    'ordersn' => $order_sn,
                    'serialsn'=> createFlowNum(),
                    'money' => $total,
                    'status' => 0,
                    'payment' => $payment,//支付方式 1=微信支付 2=支付宝支付 3=余额支付
                    'create_time' => time()
                );
                $logid = M('Paylog')->add($paylog);//支付记录id
                //余额支付
                if(3==$payment){

                    //扣减用户金额
                    $res = D('UserAccountLog')->reduceMoney($uid,$total,'支付订单'.$order_sn.'扣减');
                    if($res){
                        M('Paylog')->where('id='.$logid)->setField('status',1);//设置已支付
                        //更新订单支付状态
                        $up = array('status'=>1,'paytime'=>time());
                        $is_pay = D('Order')->where('id='.$order_id)->setField($up);
                        if($is_pay){
                            //这里进行通过接口购买产品的操作 将订单产品加入队列处理

                            enableOrderTemplate($order_id);//对订单中模板类型产品进行开通
                            $this->redirect('Cuser/index');
                        }
                    }
                }
                //微信支付
                if(1==$payment){

                }
                //支付宝支付
                if(2==$payment){

                }

            }
        }



    }



}
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
        if(!in_array(ACTION_NAME,array('qrcodePayNotify','alipayOrderDone','alipayRenewDone','OrderOk','renewQrcodePayNotify'))){
            $this->is_login();
        }
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
            //$value['year'] = $value['month']/12;
            $value['year'] = formatYear($value['month']);
            //产品类型 1=域名 2=虚拟机3=企业邮箱4=弹性云主机5=云建站模板 6=套餐云主机
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
            $user = session('user_auth');
            $uid = $user['id'];
            if(!$id){
                $return = array("status"=>0,"msg"=>"缺少id");
                echo json_encode($return);exit();
            }
            $res = $this->model->removeCart($id);
            if($res){
                $carNum = D("Cart")->getCartNumByUid($uid);
                S($uid.'_carNum',$carNum,3);//缓存5秒
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
        $datas = I('post.');
        $ids = $datas['cartid'];
        if(empty($ids)){
            $this->error("请选择要支付的产品！");
        }
        $user = session('user_auth');
        $uid = $user['id'];

        //获取用户的购物车列表
        //$list = $this->model->getCartByUid($uid);
        $list = $this->model->getListByIds($ids);

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
            //$value['year'] = $value['month']/12;
            $value['year'] = formatYear($value['month']);
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
        $total = $this->model->getToal($ids,$uid);//购物车总价

        $this->assign('total',$total);
        $this->assign('list',$list);
        $this->display();
    }

    /*
     * 确认支付页面
     */
    public function orderDone()
    {
        $datas = I('post.');
        $ids = $datas['cartid'];
        if(empty($ids)){
            $this->error("请选择要支付的产品！");
        }
        $user = session('user_auth');
        $uid = $user['id'];
        //获取用户的购物车列表
        //$list = $this->model->getCartByUid($uid);
        $list = $this->model->getListByIds($ids);
        if(empty($list)){
            $this->error("购物车为空！");
        }

        $payment = I('post.payment');
        !$payment && $this->error("请重新提交表单");
        $total = $this->model->getToal($ids,$uid);//购物车总价
        $user_account = D('Cuser')->where('id='.$uid)->getField('account');

        $this->assign('list',$list);
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
        $payment = intval(I('post.payment'));//支付方式
        $datas = I('post.');
        $ids = $datas['cartid'];
        if(empty($ids)){
            $this->error("请选择要支付的产品！");
        }
        if(!$payment){
            $this->redirect('Cart/index',2,'请选择支付方式');
        }
        $user = session('user_auth');
        $uid = $user['id'];
        //获取用户的购物车列表
        //$list = $this->model->getCartByUid($uid);
        $list = $this->model->getListByIds($ids);
        if(empty($list)){
            $this->redirect('Index/index',2,'购物车为空！');
        }
        $total = $this->model->getToal($ids,$uid);//购物车总价
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
                    'type' => $value['type'],//产品类型 1=域名 2=虚拟机3=企业邮箱4=弹性云主机5=云建站模板 6=套餐云主机
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
                //$this->model->clearCartByUid($uid);
                $this->model->deleteCartByIds($ids);
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
                            $this->addToQueue($order_id);

                            enableOrderTemplate($order_id);//对订单中模板类型产品进行开通
                            $this->redirect('Cuser/index');
                        }
                    }
                }
                //微信支付
                if(1==$payment){
                    $project_name = $list[0]['name'];//支付标题
                    //$this->doWxpay($order_id,$project_name);//调用微信支付
                    go_to(4,U('Cart/doWxpay',array('order_id'=>$order_id,'goods_name'=>$project_name)));
                }
                //支付宝支付
                if(2==$payment){
                    $project_name = $list[0]['name'];//支付标题
                    $this->doOrderAlipay($order_id,$logid,$project_name);//调用支付宝支付
                }

            }
        }

    }

    /*
     * 普通订单微信支付处理
     */
    public function doWxpay($order_id,$goods_name='亿维云产品购买')
    {
        //引入WxPayPubHelper
        vendor('Weixinpay.WxPayPubHelper');
        //$notify_url = U("Home/Public/qrcodePayNotify", array('apitype' => 'wxpay', 'method' => 'notify'), false, true);//微信支付异步回调处理地址
        $notify_url = 'http://win2.qbt8.com/ywyw/index.php/Home/Cart/qrcodePayNotify.html';//微信支付异步回调地址 地址不能带任何参数，就是不能有 ?x=a&b=c 这些
        $order_id = (int)$order_id;//订单id
        if(!$order_id){
            return false;
        }

        $order = D('Order')->find($order_id);//订单详情
        if(!$order){
            $this->error("订单不存在！");
        }
        if($order['status']==1){
            $this->error("该订单已支付！");
        }
        $trade_no = $order['ordersn'];//订单号

        //$total = $order['total'];//支付金额
        $total = 1;//测试过程设置为0.01 支付金额

        //使用统一支付接口
        $unifiedOrder = new \UnifiedOrder_pub();

        //设置统一支付接口参数
        //设置必填参数
        //$unifiedOrder->setParameter("body","贡献一分钱");//商品描述
        $unifiedOrder->setParameter("body","$goods_name");//商品描述
        //自定义订单号，此处仅作举例
        //$timeStamp = time();
        //$out_trade_no = C('WxPayConf_pub.APPID')."$timeStamp";
        $unifiedOrder->setParameter("out_trade_no","$trade_no");//商户订单号
        $unifiedOrder->setParameter("total_fee",$total);//总金额
        $unifiedOrder->setParameter("notify_url", "$notify_url");//通知地址
        //$unifiedOrder->setParameter("notify_url", C('WxPayConf_pub.NOTIFY_URL'));//通知地址
        $unifiedOrder->setParameter("trade_type","NATIVE");//交易类型

        //获取统一支付接口结果
        $unifiedOrderResult = $unifiedOrder->getResult();
        //商户根据实际情况设置相应的处理流程
        if ($unifiedOrderResult["return_code"] == "FAIL")
        {
            //商户自行增加处理流程
            echo "通信出错：".$unifiedOrderResult['return_msg']."<br>";
        }
        elseif($unifiedOrderResult["result_code"] == "FAIL")
        {
            //商户自行增加处理流程
            echo "错误代码：".$unifiedOrderResult['err_code']."<br>";
            echo "错误代码描述：".$unifiedOrderResult['err_code_des']."<br>";
        }
        elseif($unifiedOrderResult["code_url"] != NULL)
        {
            //从统一支付接口获取到code_url
            $code_url = $unifiedOrderResult["code_url"];
            //商户自行增加处理流程
            //......
        }
        $this->assign('out_trade_no',$trade_no);
        $this->assign('code_url',$code_url);
        $this->assign('unifiedOrderResult',$unifiedOrderResult);

        $this->display('Cart/qrcode');

    }

    /*
     * 微信扫码支付 异步回调处理
     */
    public function qrcodePayNotify()
    {
        //file_put_contents('testwxpay.txt',"微信支付成功了",FILE_APPEND);//写文件记录是否异步访问了本控制器
        //引入WxPayPubHelper
        vendor('Weixinpay.WxPayPubHelper');
        //使用通用通知接口
        $notify = new \Notify_pub();

        //存储微信的回调
        $xml = $GLOBALS['HTTP_RAW_POST_DATA'];
        $notify->saveData($xml);

        //验证签名，并回应微信。
        //对后台通知交互时，如果微信收到商户的应答不是成功或超时，微信认为通知失败，
        //微信会通过一定的策略（如30分钟共8次）定期重新发起通知，
        //尽可能提高通知的成功率，但微信不保证通知最终能成功。
        if($notify->checkSign() == FALSE){
            $notify->setReturnParameter("return_code","FAIL");//返回状态码
            $notify->setReturnParameter("return_msg","签名失败");//返回信息
        }else{
            $notify->setReturnParameter("return_code","SUCCESS");//设置返回码
        }
        $returnXml = $notify->returnXml();
        echo $returnXml;

        //==商户根据实际情况设置相应的处理流程，此处仅作举例=======

        //以log文件形式记录回调信息
        //         $log_ = new Log_();
        //$up_path = dirname(dirname(dirname(dirname(__FILE__))));
        //$file_path = str_replace("\\", "/", $up_path);

        //$log_name= $file_path."/Public/notify_url.log";
        $log_name= "wxpay_notify.log";//log文件路径

        $this->log_result($log_name,"【接收到的notify通知】:\n".$xml."\n");

        if($notify->checkSign() == TRUE)
        {
            if ($notify->data["return_code"] == "FAIL") {
                //此处应该更新一下订单状态，商户自行增删操作
                $this->log_result($log_name,"【通信出错】:\n".$xml."\n");
            }
            elseif($notify->data["result_code"] == "FAIL"){
                //此处应该更新一下订单状态，商户自行增删操作
                $this->log_result($log_name,"【业务出错】:\n".$xml."\n");
            }
            else{
                //此处应该更新一下订单状态，商户自行增删操作
                $this->log_result($log_name,"【支付成功】:\n".$xml."\n");

                $out_trade_no = $notify->data["out_trade_no"];//返回来的 原网站订单号
                $map['ordersn'] = $out_trade_no;
                $order = D("Order")->where($map)->find();
                M('Paylog')->where($map)->setField('status',1);//更新支付记录 设置已支付
                //更新订单支付状态
                $up = array('status'=>1,'paytime'=>time());
                $is_pay = D('Order')->where($map)->setField($up);
                if($is_pay){
                    //这里进行通过接口购买产品的操作 将订单产品加入队列处理
                    $this->addToQueue($order['id']);

                    enableOrderTemplate($order['id']);//对订单中模板类型产品进行开通
                }

            }

            //商户自行增加处理流程,
            //例如：更新订单状态
            //例如：数据库操作
            //例如：推送支付完成信息

        }
    }
    
    /*
     * 续费订单 微信支付
     */
    public function renewWxpay($order_id,$goods_name='亿维云产品续费')
    {
        //引入WxPayPubHelper
        vendor('Weixinpay.WxPayPubHelper');
        //$notify_url = U("Home/Public/qrcodePayNotify", array('apitype' => 'wxpay', 'method' => 'notify'), false, true);//微信支付异步回调处理地址
        $notify_url = 'http://win2.qbt8.com/ywyw/index.php/Home/Cart/renewQrcodePayNotify.html';//微信支付异步回调地址 地址不能带任何参数，就是不能有 ?x=a&b=c 这些
        $order_id = (int)$order_id;//订单id
        if(!$order_id){
            return false;
        }

        $order = M('renew_order')->find($order_id);//续费订单详情
        if(!$order){
            $this->error("订单不存在！");
        }
        if($order['status']==1){
            $this->error("该订单已支付！");
        }
        $trade_no = $order['order_sn'];//订单号

        //$total = $order['total'];//支付金额
        $total = 1;//测试过程设置为0.01 支付金额

        //使用统一支付接口
        $unifiedOrder = new \UnifiedOrder_pub();

        //设置统一支付接口参数
        //设置必填参数
        //$unifiedOrder->setParameter("body","贡献一分钱");//商品描述
        $unifiedOrder->setParameter("body","$goods_name");//商品描述
        //自定义订单号，此处仅作举例
        //$timeStamp = time();
        //$out_trade_no = C('WxPayConf_pub.APPID')."$timeStamp";
        $unifiedOrder->setParameter("out_trade_no","$trade_no");//商户订单号
        $unifiedOrder->setParameter("total_fee",$total);//总金额
        $unifiedOrder->setParameter("notify_url", "$notify_url");//通知地址
        //$unifiedOrder->setParameter("notify_url", C('WxPayConf_pub.NOTIFY_URL'));//通知地址
        $unifiedOrder->setParameter("trade_type","NATIVE");//交易类型

        //获取统一支付接口结果
        $unifiedOrderResult = $unifiedOrder->getResult();
        //商户根据实际情况设置相应的处理流程
        if ($unifiedOrderResult["return_code"] == "FAIL")
        {
            //商户自行增加处理流程
            echo "通信出错：".$unifiedOrderResult['return_msg']."<br>";
        }
        elseif($unifiedOrderResult["result_code"] == "FAIL")
        {
            //商户自行增加处理流程
            echo "错误代码：".$unifiedOrderResult['err_code']."<br>";
            echo "错误代码描述：".$unifiedOrderResult['err_code_des']."<br>";
        }
        elseif($unifiedOrderResult["code_url"] != NULL)
        {
            //从统一支付接口获取到code_url
            $code_url = $unifiedOrderResult["code_url"];
            //商户自行增加处理流程
            //......
        }
        $this->assign('out_trade_no',$trade_no);
        $this->assign('code_url',$code_url);
        $this->assign('unifiedOrderResult',$unifiedOrderResult);

        $this->display('Cart/qrcode');
    }

    /*
     * 续费订单 微信扫码支付 异步回调处理
     */
    public function renewQrcodePayNotify()
    {
        //file_put_contents('testwxpay.txt',"微信支付成功了",FILE_APPEND);//写文件记录是否异步访问了本控制器
        //引入WxPayPubHelper
        vendor('Weixinpay.WxPayPubHelper');
        //使用通用通知接口
        $notify = new \Notify_pub();

        //存储微信的回调
        $xml = $GLOBALS['HTTP_RAW_POST_DATA'];
        $notify->saveData($xml);

        //验证签名，并回应微信。
        //对后台通知交互时，如果微信收到商户的应答不是成功或超时，微信认为通知失败，
        //微信会通过一定的策略（如30分钟共8次）定期重新发起通知，
        //尽可能提高通知的成功率，但微信不保证通知最终能成功。
        if($notify->checkSign() == FALSE){
            $notify->setReturnParameter("return_code","FAIL");//返回状态码
            $notify->setReturnParameter("return_msg","签名失败");//返回信息
        }else{
            $notify->setReturnParameter("return_code","SUCCESS");//设置返回码
        }
        $returnXml = $notify->returnXml();
        echo $returnXml;

        //==商户根据实际情况设置相应的处理流程，此处仅作举例=======

        //以log文件形式记录回调信息
        //         $log_ = new Log_();
        //$up_path = dirname(dirname(dirname(dirname(__FILE__))));
        //$file_path = str_replace("\\", "/", $up_path);

        //$log_name= $file_path."/Public/notify_url.log";
        $log_name= "wxpay_notify.log";//log文件路径

        $this->log_result($log_name,"【接收到的notify通知】:\n".$xml."\n");

        if($notify->checkSign() == TRUE)
        {
            if ($notify->data["return_code"] == "FAIL") {
                //此处应该更新一下订单状态，商户自行增删操作
                $this->log_result($log_name,"【通信出错】:\n".$xml."\n");
            }
            elseif($notify->data["result_code"] == "FAIL"){
                //此处应该更新一下订单状态，商户自行增删操作
                $this->log_result($log_name,"【业务出错】:\n".$xml."\n");
            }
            else{
                //此处应该更新一下订单状态，商户自行增删操作
                $this->log_result($log_name,"【支付成功】:\n".$xml."\n");

                $out_trade_no = $notify->data["out_trade_no"];//返回来的 原网站订单号

                $map['order_sn'] = $out_trade_no;
                $order = M('renew_order')->where($map)->find();//订单详情

                $up['status'] = 1;
                $up['pay_time'] = time();
                M('renew_order')->where('id='.$order['id'])->save($up);//更新订单状态
                //更新支付记录支付状态
                $where['ordersn'] = $out_trade_no;
                M('Paylog')->where($where)->setField('status',1);//设置已支付
                //这里进行通过接口购买产品的操作 将订单产品加入队列处理
                $this->addToQueueRenew($order['id']);

            }

            //商户自行增加处理流程,
            //例如：更新订单状态
            //例如：数据库操作
            //例如：推送支付完成信息

        }
    }

    /*
     * 订单支付宝支付异步回调处理
     * 更新订单状态 将订单产品加入任务队列等
     */
    public function alipayOrderDone($money, $param)
    {
        if (session("pay_verify") == true) {
            session("pay_verify", null);
            //处理goods1业务订单、改名good1业务订单状态
            //M("Goods1Order")->where(array('order_id' => $param['order_id']))->setInc('haspay', $money);
            //将充值订单更新
            $order = D('Order')->find($param['order_id']);//订单详情
            if($order){
                $up['status'] = 1;
                $up['paytime'] = time();
                $res = D('Order')->where('id='.$order['id'])->save($up);//更新订单状态
                //更新支付记录支付状态
                M('Paylog')->where('id='.$param['paylog_id'])->setField('status',1);//设置已支付
                //这里进行通过接口购买产品的操作 将订单产品加入队列处理
                $this->addToQueue($order['id']);

                enableOrderTemplate($order['id']);//对订单中模板类型产品进行开通

                if($res){
                    return true;
                }
            }
        } else {
            E("Access Denied");
        }
    }
    
    /*
     * 续费订单 支付宝回调处理
     * 更新订单状态
     */
    public function alipayRenewDone($money, $param)
    {
        if (session("pay_verify") == true) {
            session("pay_verify", null);
            //处理goods1业务订单、改名good1业务订单状态
            //M("Goods1Order")->where(array('order_id' => $param['order_id']))->setInc('haspay', $money);

            $order = M('renew_order')->find($param['order_id']);//订单详情
            if($order){
                $up['status'] = 1;
                $up['pay_time'] = time();
                $res = M('renew_order')->where('id='.$order['id'])->save($up);//更新订单状态
                //更新支付记录支付状态
                M('Paylog')->where('id='.$param['paylog_id'])->setField('status',1);//设置已支付
                //这里进行通过接口购买产品的操作 将订单产品加入队列处理
                $this->addToQueueRenew($order['id']);

                if($res){
                    return true;
                }
            }
        } else {
            E("Access Denied");
        }
    }
    
    /*
     * 订单支付成功
     */
    public function OrderOk()
    {

        $this->display();
    }

    /*
     * 虚拟主机续费
     */
    public function renewVitrual($id)
    {
        $id = (int)$id;
        !$id && $this->error("非法访问");
        $user_vitrual = M('user_vitrual')->where('id='.$id)->find();
        //print_r($user_vitrual);
        $order_goods = M('order_goods')->where('id='.$user_vitrual['web_ordergoods_id'])->find();
        if(!$order_goods){
            $this->error("订单产品不存在");
        }
        $price = M('CpPrice')->where('id='.$order_goods['price_id'])->find();
        if(!$price){
            $this->error("产品价格信息维护中");
        }

        $this->assign('user_vitrual',$user_vitrual);
        $this->assign('price',$price);
        $this->display();
    }
    /*
     * 虚拟机续费确认购买
     */
    public function renewVitrualSelectPayment()
    {
        if(IS_POST){
            $data = I('post.');
            $price_id = (int)$data['price_id'];
            $year = (int)$data['year'];
            $vitrual_id = (int)$data['vitrual_id'];
            $user_vitrual = M('user_vitrual')->where('id='.$vitrual_id)->find();

            $price_info = M('CpPrice')->where('id='.$price_id)->find();
            $price_field = priceMap($year);

            //续费数据保存到session
            $renewVitrual = array(
                'name'=>$user_vitrual['name'],
                'vitrual_id' => $vitrual_id,//站内用户虚拟机id
                'domain' => $user_vitrual['domain'],
                'order_id' => $user_vitrual['order_id'],
                'Timeperiod' => $year*12,//续费的时限(月)
                'cur_expiry_time' => date('YYYYmmddHHiiss',strtotime($user_vitrual['expire_time'])),//当前域名的过期时间 格式为YYYYmmddHHiiss,比如20110908070605, 代表2011年9月8日7时6分5秒
                'price_id' => $price_id,
                'total' => $price_info[$price_field],//价格
                'uid' => $user_vitrual['uid'],
                'year' => $year
            );
        }

        session('renewVitrual',$renewVitrual);
        $this->assign('renewVitrual',$renewVitrual);
        $this->display();
    }
    /*
     * 虚拟机续费 支付
     */
    public function renewVitrualPay()
    {
        $user = session('user_auth');
        $uid = $user['id'];
        $payment = (int)I('payment');
        if(!$payment){
            $this->error("请选择支付方式");
        }
        //创建订单
        $renewVitrual = session('renewVitrual');
        if(empty($renewVitrual)){
            $this->error("没有要续费的虚拟机");
        }
        $renew_order = array(
            'order_sn' => time(),
            'payment' =>$payment,//支付方式 1=微信支付 2=支付宝支付 3=余额支付
            'status' => 0,//支付状态 0=未支付 1=已支付
            'total' => $renewVitrual['total'],//订单总额
            'uid' => $uid,
            'username' => $user['username'],
            'mobile' => $user['mobile'],
            'create_time' => time()

        );
        $order_id = M('renew_order')->add($renew_order);
        if($order_id){
            //清空session
            session('renewVitrual',null);
            //生成订单产品
            $renew_order_goods = array(
                'uid' => $uid,
                'type' => 'vitrual',//domain:域名 vitrual:虚拟机 mail:企业邮局 template:网站模板 host:弹性云主机 packagehost:套餐云主机
                'order_id' => $order_id,
                'product_name' => $renewVitrual['name'],
                'total' => $renewVitrual['total'],
                'month' => $renewVitrual['Timeperiod'],//续费月份
                'product_status' => 0,//0=未续费 1=已续费
                'price_id' => $renewVitrual['price_id'],//虚拟机价格id
                'buy_config' => json_encode($renewVitrual),
                'user_goods_id' => $renewVitrual['vitrual_id'],
            );
            $goods_id = M('renew_order_goods')->add($renew_order_goods);
            if($goods_id){
                //生成支付记录
                $order_sn = M('renew_order')->where('id='.$order_id)->getField('order_sn');
                $paylog = array(
                    'ordersn' => $order_sn,
                    'serialsn'=> createFlowNum(),//流水号
                    'money' => $renewVitrual['total'],
                    'status' => 0,
                    'payment' => $payment,//支付方式 1=微信支付 2=支付宝支付 3=余额支付
                    'create_time' => time()
                );
                $logid = M('Paylog')->add($paylog);//支付记录id

                //余额支付
                if(3==$payment){

                    //扣减用户金额
                    $res = D('UserAccountLog')->reduceMoney($uid,$renewVitrual['total'],'支付续费订单'.$order_sn.'扣减');
                    if($res){
                        M('Paylog')->where('id='.$logid)->setField('status',1);//设置已支付
                        //更新订单支付状态
                        $up = array('status'=>1,'pay_time'=>time());
                        $is_pay = D('renew_order')->where('id='.$order_id)->setField($up);
                        if($is_pay){
                            //这里进行通过接口购买产品的操作 将订单产品加入队列处理
                            $this->addToQueueRenew($order_id);

                            $this->redirect('Cuser/index');
                        }
                    }
                }
                //微信支付
                if(1==$payment){
                    $project_name = $renew_order_goods['product_name'];//支付标题
                    $this->renewWxpay($order_id,$project_name);//调用微信支付
                }
                //支付宝支付
                if(2==$payment){
                    $project_name = $renew_order_goods['product_name'];//支付标题
                    $this->doRenewAlipay($order_id,$logid,$project_name);//调用支付宝支付
                }


            }else{
                $this->error('发生未知错误！','Home/Index/index',3);
            }

        }

    }
    
    /*
     * 邮局续费
     */
    public function renewMail($id)
    {
        $id = (int)$id;
        !$id && $this->error("非法访问");
        $user_mail = M('user_mail')->where('id='.$id)->find();

        $mail = M('mail')->find();

        $total = $mail['price'] + $user_mail['number']*$mail['extra_price'];

        $this->assign('user_mail',$user_mail);
        $this->assign('mail',$mail);
        $this->assign('total',$total);
        $this->display();
    }
    /*
     * 邮局续费选择支付方式
     */
    public function renewMailSelectPayment()
    {
        $mail_id = (int)I('get.mail_id');
        !$mail_id && $this->error("非法访问");

        $user_mail = M('user_mail')->where('id='.$mail_id)->find();
        $mail = M('mail')->find();

        $total = $mail['price'] + $user_mail['number']*$mail['extra_price'];

        $this->assign('user_mail',$user_mail);
        $this->assign('mail',$mail);
        $this->assign('total',$total);
        $this->display();
    }
    /*
     * 邮局续费 支付
     */
    public function renewMailDone()
    {
        $user = session('user_auth');
        $uid = $user['id'];
        $payment = (int)I('payment');
        $mail_id = (int)I('post.mail_id');
        !$mail_id && $this->error("非法访问");
        if(!$payment){
            $this->error("请选择支付方式");
        }

        $user_mail = M('user_mail')->where('id='.$mail_id)->find();
        $mail = M('mail')->find();

        $total = $mail['price'] + $user_mail['number']*$mail['extra_price'];
        //创建订单
        $renew_order = array(
            'order_sn' => time(),
            'payment' =>$payment,//支付方式 1=微信支付 2=支付宝支付 3=余额支付
            'status' => 0,//支付状态 0=未支付 1=已支付
            'total' => $total,//订单总额
            'uid' => $uid,
            'username' => $user['username'],
            'mobile' => $user['mobile'],
            'create_time' => time()

        );
        $order_id = M('renew_order')->add($renew_order);
        if($order_id){
            //生成订单产品
            $buy_config = array(
                'mail_id' => $user_mail['mail_id'],//DIY邮局ID
                'domain' => $user_mail['domain'],//DIY邮局域名
                'timeperiod' => 1,//续费年限
                'cur_expiry_time' => date('YYYYmmddHHiiss',strtotime($user_mail['expiry_time'])),//当前域名的过期时间
            );
            $renew_order_goods = array(
                'uid' => $uid,
                'type' => 'mail',//domain:域名 vitrual:虚拟机 mail:企业邮局 template:网站模板 host:弹性云主机 packagehost:套餐云主机
                'order_id' => $order_id,
                'product_name' => $user_mail['name'],
                'total' => $total,
                'month' => 12,//续费月份
                'product_status' => 0,//0=未续费 1=已续费
                'price_id' => 0,//虚拟机价格id
                'buy_config' => json_encode($buy_config),
                'user_goods_id' => $user_mail['id'],
            );
            $goods_id = M('renew_order_goods')->add($renew_order_goods);

            if($goods_id){
                //生成支付记录
                $order_sn = M('renew_order')->where('id='.$order_id)->getField('order_sn');
                $paylog = array(
                    'ordersn' => $order_sn,
                    'serialsn'=> createFlowNum(),//流水号
                    'money' => $total,
                    'status' => 0,
                    'payment' => $payment,//支付方式 1=微信支付 2=支付宝支付 3=余额支付
                    'create_time' => time()
                );
                $logid = M('Paylog')->add($paylog);//支付记录id

                //余额支付
                if(3==$payment){

                    //扣减用户金额
                    $res = D('UserAccountLog')->reduceMoney($uid,$total,'支付续费订单'.$order_sn.'扣减');
                    if($res){
                        M('Paylog')->where('id='.$logid)->setField('status',1);//设置已支付
                        //更新订单支付状态
                        $up = array('status'=>1,'pay_time'=>time());
                        $is_pay = M('renew_order')->where('id='.$order_id)->setField($up);
                        if($is_pay){
                            //这里进行通过接口购买产品的操作 将订单产品加入队列处理
                            $this->addToQueueRenew($order_id);

                            $this->redirect('Cuser/index');
                        }
                    }
                }
                //微信支付
                if(1==$payment){
                    $project_name = $renew_order_goods['product_name'];//支付标题
                    $this->renewWxpay($order_id,$project_name);//调用微信支付
                }
                //支付宝支付
                if(2==$payment){
                    $project_name = $renew_order_goods['product_name'];//支付标题
                    $this->doRenewAlipay($order_id,$logid,$project_name);//调用支付宝支付
                }


            }else{
                $this->error('发生未知错误！','Home/Index/index',3);
            }


        }

    }

    /*
     * 网站模板续费
     */
    public function renewTemplate($id)
    {
        $id = (int)$id;
        !$id && $this->error("非法访问");
        $user_template = M('user_template')->where('id='.$id)->find();
        $map['template_id'] = $user_template['template_id'];
        $template = M('station_template')->where($map)->find();

        $this->assign('template',$template);
        $this->assign('user_template',$user_template);
        $this->display();
    }
    /*
     * 网站模板 支付
     */
    public function renewTemplateDone()
    {
        $user = session('user_auth');
        $uid = $user['id'];
        $payment = (int)I('payment');

        $user_template_id = (int)I('post.user_template_id');
        !$user_template_id && $this->error("非法访问");

        $user_template = M('user_template')->where('id='.$user_template_id)->find();
        $map['id'] = $user_template['tid'];
        $template = M('station_template')->where($map)->find();//模板信息

        $total = $template['price'];
        //创建订单
        $renew_order = array(
            'order_sn' => time(),
            'payment' =>$payment,//支付方式 1=微信支付 2=支付宝支付 3=余额支付
            'status' => 0,//支付状态 0=未支付 1=已支付
            'total' => $total,//订单总额
            'uid' => $uid,
            'username' => $user['username'],
            'mobile' => $user['mobile'],
            'create_time' => time()

        );
        $order_id = M('renew_order')->add($renew_order);
        if($order_id){
            //生成订单产品
            $buy_config = array(
                'name' => $user_template['name'],//模板名称
                'template_id' => $template['template_id'],//模板id
                'year' => 1,//续费年限
                'cur_expiry_time' => $user_template['expiry_time'],//当前模板的过期时间
            );
            $renew_order_goods = array(
                'uid' => $uid,
                'type' => 'template',//domain:域名 vitrual:虚拟机 mail:企业邮局 template:网站模板 host:弹性云主机 packagehost:套餐云主机
                'order_id' => $order_id,
                'product_name' => $user_template['name'],
                'total' => $total,
                'month' => 12,//续费月份
                'product_status' => 0,//0=未续费 1=已续费
                'price_id' => 0,//虚拟机价格id
                'buy_config' => json_encode($buy_config),
                'user_goods_id' => $user_template['id'],
            );
            $goods_id = M('renew_order_goods')->add($renew_order_goods);

            if($goods_id){
                //生成支付记录
                $order_sn = M('renew_order')->where('id='.$order_id)->getField('order_sn');
                $paylog = array(
                    'ordersn' => $order_sn,
                    'serialsn'=> createFlowNum(),//流水号
                    'money' => $total,
                    'status' => 0,
                    'payment' => $payment,//支付方式 1=微信支付 2=支付宝支付 3=余额支付
                    'create_time' => time()
                );
                $logid = M('Paylog')->add($paylog);//支付记录id

                //余额支付
                if(3==$payment){

                    //扣减用户金额
                    $res = D('UserAccountLog')->reduceMoney($uid,$total,'支付续费订单'.$order_sn.'扣减');
                    if($res){
                        M('Paylog')->where('id='.$logid)->setField('status',1);//设置已支付
                        //更新订单支付状态
                        $up = array('status'=>1,'pay_time'=>time());
                        $is_pay = M('renew_order')->where('id='.$order_id)->setField($up);
                        if($is_pay){
                            //这里进行通过接口购买产品的操作 将订单产品加入队列处理
                            $this->addToQueueRenew($order_id);

                            $this->success('续费成功！',U('Cuser/userTemplate'));
                        }
                    }
                }
                //微信支付
                if(1==$payment){
                    $project_name = $renew_order_goods['product_name'];//支付标题
                    $this->renewWxpay($order_id,$project_name);//调用微信支付
                }
                //支付宝支付
                if(2==$payment){
                    $project_name = $renew_order_goods['product_name'];//支付标题
                    $this->doRenewAlipay($order_id,$logid,$project_name);//调用支付宝支付
                }


            }else{
                $this->error('发生未知错误！','Home/Index/index',3);
            }


        }


    }
    
    /*
     * 弹性云主机续费
     */
    public function renewHost($id)
    {
        $id = (int)$id;
        !$id && $this->error("非法访问");
        $user_host = M('user_host')->find($id);
        //计算价格
        $elastic_config = M('elastic_config')->find(1);//基本配置
        $lineinfo = M('elastic_line')->where('id='.$user_host['line_id'])->find();//线路配置
        $serviceinfo = M('elastic_service')->where('id='.$user_host['service_id'])->find();//服务配置
        $osinfo = M('elastic_osconfig')->where('id='.$user_host['os_id'])->find();//操作系统配置

        //统计价格总和 = (cpu+内存+硬盘+带宽+操作系统+线路+服务标准)*购买月份*数量
        $cpuprice = $elastic_config['cpu_price']*intval($user_host['cpu']);//cpu价格 = cpu单价*cpu核数
        $memoryprice = $elastic_config['memory_price'] * intval($user_host['memory']);//内存价格 = 内存单价*数量
        $diskprice = $elastic_config['disk_price'] * intval($user_host['disk']);//硬盘价格
        $bandwidthprice = $elastic_config['bandwidth_price'] * intval($user_host['bandwidth']);//带宽价格
        $osprice = $osinfo['price'];//操作系统价格
        $lineprice = $lineinfo['price'];//线路价格
        $serviceprice = $serviceinfo['price'];//服务标准价格
        $total = ($cpuprice + $memoryprice + $diskprice + $bandwidthprice + $osprice + $lineprice + $serviceprice) *1;

        $three_total = $total*3;
        $six_total = $total *6;
        $year_total = $total *12;
        $twoyear_total = $total *24;
        $threeyear_total = $total *36;
        $fiveyear_total = $total *60;

        $this->assign('fiveyear_total',$fiveyear_total);
        $this->assign('threeyear_total',$threeyear_total);
        $this->assign('twoyear_total',$twoyear_total);
        $this->assign('year_total',$year_total);
        $this->assign('six_total',$six_total);
        $this->assign('three_total',$three_total);
        $this->assign('total',$total);
        $this->assign('user_host',$user_host);
        $this->display();
    }
    /*
     * 弹性云主机续费 选择支付方式
     */
    public function renewHostSelectPayment()
    {
        $user_host_id = (int)I('post.user_host_id');
        $month = (int)I('post.month');
        if(!$user_host_id){
            $this->error("请选择要续费的产品！");
        }
        if(!$month){
            $this->error("请选择续费年限！");
        }
        $user_host = M('user_host')->find($user_host_id);
        //计算价格
        $elastic_config = M('elastic_config')->find(1);//基本配置
        $lineinfo = M('elastic_line')->where('id='.$user_host['line_id'])->find();//线路配置
        $serviceinfo = M('elastic_service')->where('id='.$user_host['service_id'])->find();//服务配置
        $osinfo = M('elastic_osconfig')->where('id='.$user_host['os_id'])->find();//操作系统配置

        //统计价格总和 = (cpu+内存+硬盘+带宽+操作系统+线路+服务标准)*购买月份*数量
        $cpuprice = $elastic_config['cpu_price']*intval($user_host['cpu']);//cpu价格 = cpu单价*cpu核数
        $memoryprice = $elastic_config['memory_price'] * intval($user_host['memory']);//内存价格 = 内存单价*数量
        $diskprice = $elastic_config['disk_price'] * intval($user_host['disk']);//硬盘价格
        $bandwidthprice = $elastic_config['bandwidth_price'] * intval($user_host['bandwidth']);//带宽价格
        $osprice = $osinfo['price'];//操作系统价格
        $lineprice = $lineinfo['price'];//线路价格
        $serviceprice = $serviceinfo['price'];//服务标准价格
        $total = ($cpuprice + $memoryprice + $diskprice + $bandwidthprice + $osprice + $lineprice + $serviceprice) *$month;

        //保存配置到session
        $renewhost = array(
            'user_host_id' => $user_host_id,
            'month' => $month,
            'total' => $total,

        );
        session('renewhost',$renewhost);

        $this->assign('month',$month);
        $this->assign('total',$total);
        $this->assign('user_host',$user_host);
        $this->display();
    }
    /*
     * 弹性云主机续费 支付
     */
    public function renewHostDone()
    {
        $renewhost = session('renewhost');
        if(empty($renewhost)){
            $this->error("请选择续费的产品！",U('Cuser/userHost'));
        }
        //生成订单
        $user = session('user_auth');
        $uid = $user['id'];
        $payment = (int)I('payment');
        $user_host = M('user_host')->find($renewhost['user_host_id']);

        //创建订单
        $renew_order = array(
            'order_sn' => time(),
            'payment' =>$payment,//支付方式 1=微信支付 2=支付宝支付 3=余额支付
            'status' => 0,//支付状态 0=未支付 1=已支付
            'total' => $renewhost['total'],//订单总额
            'uid' => $uid,
            'username' => $user['username'],
            'mobile' => $user['mobile'],
            'create_time' => time()

        );
        $order_id = M('renew_order')->add($renew_order);
        if($order_id){
            //清空 session
            session('renewhost',null);
            //生成订单产品
            $buy_config = array(
                'name' => $user_host['name'],//弹性云主机名称
                'user_host_id' => $renewhost['user_host_id'],//用户弹性云主机id
                'month' => $renewhost['month'],//续费时限 月
                'total' => $renewhost['total'],//总金额
                'cur_expiry_time' => $user_host['expiry_time'],//当前过期时间

            );
            $renew_order_goods = array(
                'uid' => $uid,
                'type' => 'host',//domain:域名 vitrual:虚拟机 mail:企业邮局 template:网站模板 host:弹性云主机 packagehost:套餐云主机
                'order_id' => $order_id,
                'product_name' => $user_host['name'],
                'total' => $renewhost['total'],
                'month' => $renewhost['month'],//续费月份
                'product_status' => 0,//0=未续费 1=已续费
                'price_id' => 0,//虚拟机价格id
                'buy_config' => json_encode($buy_config),
                'user_goods_id' => $renewhost['user_host_id'],
            );
            $goods_id = M('renew_order_goods')->add($renew_order_goods);

            if($goods_id){
                //生成支付记录
                $order_sn = M('renew_order')->where('id='.$order_id)->getField('order_sn');
                $paylog = array(
                    'ordersn' => $order_sn,
                    'serialsn'=> createFlowNum(),//流水号
                    'money' => $renewhost['total'],
                    'status' => 0,
                    'payment' => $payment,//支付方式 1=微信支付 2=支付宝支付 3=余额支付
                    'create_time' => time()
                );
                $logid = M('Paylog')->add($paylog);//支付记录id

                //余额支付
                if(3==$payment){
                    //扣减用户金额
                    $res = D('UserAccountLog')->reduceMoney($uid,$renewhost['total'],'支付续费订单'.$order_sn.'扣减');
                    if($res){
                        M('Paylog')->where('id='.$logid)->setField('status',1);//设置已支付
                        //更新订单支付状态
                        $up = array('status'=>1,'pay_time'=>time());
                        $is_pay = M('renew_order')->where('id='.$order_id)->setField($up);
                        if($is_pay){
                            //这里进行通过接口购买产品的操作 将订单产品加入队列处理
                            $this->addToQueueRenew($order_id);

                            $this->success('续费申请提交成功！',U('Cuser/userHost'));
                        }
                    }
                }
                //微信支付
                if(1==$payment){
                    $project_name = $renew_order_goods['product_name'];//支付标题
                    $this->renewWxpay($order_id,$project_name);//调用微信支付
                }
                //支付宝支付
                if(2==$payment){
                    $project_name = $renew_order_goods['product_name'];//支付标题
                    $this->doRenewAlipay($order_id,$logid,$project_name);//调用支付宝支付
                }


            }else{
                $this->error('发生未知错误！',U('Index/index'),3);
            }

        }


    }

    /*
     * 套餐云主机续费
     */
    public function renewPackagehost($id)
    {
        $id = (int)$id;
        !$id && $this->error("非法访问");
        $user_packagehost = M('user_packagehost')->find($id);
        $packagehost = M('package_host')->where('id='.$user_packagehost['product_id'])->find();//站内套餐云主机

        $this->assign('packagehost',$packagehost);
        $this->assign('user_packagehost',$user_packagehost);
        $this->display();
    }
    /*
     * 套餐云主机续费 选择支付方式
     */
    public function renewPhSelectPayment()
    {
        $user_packagehost_id = (int)I('post.user_packagehost_id');
        $month = (int)I('post.month');
        if(!$user_packagehost_id){
            $this->error("请选择要续费的产品！");
        }
        if(!$month){
            $this->error("请选择续费年限！");
        }
        $user_packagehost = M('user_packagehost')->find($user_packagehost_id);
        $packagehost = M('package_host')->where('id='.$user_packagehost['product_id'])->find();//站内套餐云主机

        if(3==$month){
            $total = $packagehost['quarter_price'];//1季度价格
        }
        if(6==$month){
            $total = $packagehost['half_year_price'];//半年价格
        }
        if(12==$month){
            $total = $packagehost['year_price'];//1年价格
        }

        //保存配置到session
        $renewPackageHost = array(
            'user_packagehost_id' => $user_packagehost_id,
            'month' => $month,
            'total' => $total,

        );
        session('renewPackageHost',$renewPackageHost);

        $this->assign('month',$month);
        $this->assign('total',$total);
        $this->assign('packagehost',$packagehost);
        $this->assign('user_packagehost',$user_packagehost);
        $this->display();
    }

    /*
     * 套餐云主机 续费 支付
     */
    public function renewPhDone()
    {
        $renewPackageHost = session('renewPackageHost');
        if(empty($renewPackageHost)){
            $this->error("请选择续费的产品！",U('Cuser/userPackagehost'));
        }
        //生成订单
        $user = session('user_auth');
        $uid = $user['id'];
        $payment = (int)I('payment');
        $user_packagehost = M('user_packagehost')->find($renewPackageHost['user_packagehost_id']);

        //创建订单
        $renew_order = array(
            'order_sn' => time(),
            'payment' =>$payment,//支付方式 1=微信支付 2=支付宝支付 3=余额支付
            'status' => 0,//支付状态 0=未支付 1=已支付
            'total' => $renewPackageHost['total'],//订单总额
            'uid' => $uid,
            'username' => $user['username'],
            'mobile' => $user['mobile'],
            'create_time' => time()

        );
        $order_id = M('renew_order')->add($renew_order);
        if($order_id){
            //清空 session
            session('renewPackageHost',null);
            //生成订单产品
            $buy_config = array(
                'name' => $user_packagehost['name'],//套餐云主机名称
                'user_host_id' => $renewPackageHost['user_packagehost_id'],//用户套餐云主机id
                'month' => $renewPackageHost['month'],//续费时限 月
                'total' => $renewPackageHost['total'],//总金额
                'cur_expiry_time' => $user_packagehost['expiry_time'],//当前过期时间

            );
            $renew_order_goods = array(
                'uid' => $uid,
                'type' => 'packagehost',//domain:域名 vitrual:虚拟机 mail:企业邮局 template:网站模板 host:弹性云主机 packagehost:套餐云主机
                'order_id' => $order_id,
                'product_name' => $user_packagehost['name'],
                'total' => $renewPackageHost['total'],
                'month' => $renewPackageHost['month'],//续费月份
                'product_status' => 0,//0=未续费 1=已续费
                'price_id' => 0,//虚拟机价格id
                'buy_config' => json_encode($buy_config),
                'user_goods_id' => $renewPackageHost['user_packagehost_id'],
            );
            $goods_id = M('renew_order_goods')->add($renew_order_goods);
            if($goods_id){
                //生成支付记录
                $order_sn = M('renew_order')->where('id='.$order_id)->getField('order_sn');
                $paylog = array(
                    'ordersn' => $order_sn,
                    'serialsn'=> createFlowNum(),//流水号
                    'money' => $renewPackageHost['total'],
                    'status' => 0,
                    'payment' => $payment,//支付方式 1=微信支付 2=支付宝支付 3=余额支付
                    'create_time' => time()
                );
                $logid = M('Paylog')->add($paylog);//支付记录id

                //余额支付
                if(3==$payment){
                    //扣减用户金额
                    $res = D('UserAccountLog')->reduceMoney($uid,$renewPackageHost['total'],'支付续费订单'.$order_sn.'扣减');
                    if($res){
                        M('Paylog')->where('id='.$logid)->setField('status',1);//设置已支付
                        //更新订单支付状态
                        $up = array('status'=>1,'pay_time'=>time());
                        $is_pay = M('renew_order')->where('id='.$order_id)->setField($up);
                        if($is_pay){
                            //这里进行通过接口购买产品的操作 将订单产品加入队列处理
                            $this->addToQueueRenew($order_id);

                            $this->success('续费申请提交成功！',U('Cuser/userPackagehost'));
                        }
                    }
                }
                //微信支付
                if(1==$payment){
                    $project_name = $renew_order_goods['product_name'];//支付标题
                    $this->renewWxpay($order_id,$project_name);//调用微信支付
                }
                //支付宝支付
                if(2==$payment){
                    $project_name = $renew_order_goods['product_name'];//支付标题
                    $this->doRenewAlipay($order_id,$logid,$project_name);//调用支付宝支付
                }


            }else{
                $this->error('发生未知错误！',U('Index/index'),3);
            }

        }

    }

    /*
     * 续费域名
     */
    public function renewDomain($id)
    {
        $id = (int)$id;
        !$id && $this->error("非法访问");
        $user_domain = M('user_domain')->find($id);

        $prices = $this->getDomainPrice($user_domain['tld']);//根据域名后缀查询价格

        $this->assign('prices',$prices);
        $this->assign('user_domain',$user_domain);
        $this->display();
    }

    /*
     * 续费域名 选择支付方式
     */
    public function renewDomainSelectPayment()
    {
        $domain_id = (int)I('domain_id');//用户域名产品id
        $year = (int)I('year');//续费年限
        if(empty($domain_id)){
            $this->error("请选择要续费的产品");
        }
        if(empty($year)){
            $this->error("请选择续费年限");
        }
        $user_domain = M('user_domain')->find($domain_id);
        //续费价格 根据域名后缀确定的单价
        $single_price = $this->getSingleDomainPrice($user_domain['tld']);
        $total = $single_price*$year;//总价格

        //保存配置到session
        $renewDomain = array(
            'user_domain_id' => $domain_id,
            'year' => $year,
            'total' => $total,

        );
        session('renewDomain',$renewDomain);

        $this->assign('year',$year);
        $this->assign('total',$total);
        $this->assign('user_domain',$user_domain);
        $this->display();

    }
    
    /*
     * 域名续费 支付
     */
    public function renewDomainDone()
    {
        $renewDomain = session('renewDomain');
        if(empty($renewDomain)){
            $this->error("请选择续费的产品！",U('Cuser/userDomain'));
        }
        //生成订单
        $user = session('user_auth');
        $uid = $user['id'];
        $payment = (int)I('payment');
        $user_domain = M('user_domain')->find($renewDomain['user_domain_id']);//用户域名产品

        //创建订单
        $renew_order = array(
            'order_sn' => time(),
            'payment' =>$payment,//支付方式 1=微信支付 2=支付宝支付 3=余额支付
            'status' => 0,//支付状态 0=未支付 1=已支付
            'total' => $renewDomain['total'],//订单总额
            'uid' => $uid,
            'username' => $user['username'],
            'mobile' => $user['mobile'],
            'create_time' => time()

        );
        $order_id = M('renew_order')->add($renew_order);
        if($order_id){
            //清空 session
            session('renewDomain',null);
            //生成订单产品
            $buy_config = array(
                'domain' => $user_domain['domain'],//域名
                'user_domain_id' => $renewDomain['user_domain_id'],//用户域名产品id
                'year' => $renewDomain['year'],//续费时限 年
                'tld' => $user_domain['tld'],//域名后缀
                'lang' => $user_domain['lang'],//域名语言
                'encoding' => $user_domain['encoding'],//域名编码
                'total' => $renewDomain['total'],//总金额
                'cur_expiry_time' => $user_domain['expiry_time'],//当前过期时间

            );
            $renew_order_goods = array(
                'uid' => $uid,
                'type' => 'domain',//domain:域名 vitrual:虚拟机 mail:企业邮局 template:网站模板 host:弹性云主机 packagehost:套餐云主机
                'order_id' => $order_id,
                'product_name' => $user_domain['domain'],
                'total' => $renewDomain['total'],
                'month' => $renewDomain['year']*12,//续费月份
                'product_status' => 0,//0=未续费 1=已续费
                'price_id' => 0,//虚拟机价格id
                'buy_config' => json_encode($buy_config),
                'user_goods_id' => $renewDomain['user_domain_id'],
            );
            $goods_id = M('renew_order_goods')->add($renew_order_goods);

            if($goods_id){
                //生成支付记录
                $order_sn = M('renew_order')->where('id='.$order_id)->getField('order_sn');
                $paylog = array(
                    'ordersn' => $order_sn,
                    'serialsn'=> createFlowNum(),//流水号
                    'money' => $renewDomain['total'],
                    'status' => 0,
                    'payment' => $payment,//支付方式 1=微信支付 2=支付宝支付 3=余额支付
                    'create_time' => time()
                );
                $logid = M('Paylog')->add($paylog);//支付记录id

                //余额支付
                if(3==$payment){
                    //扣减用户金额
                    $res = D('UserAccountLog')->reduceMoney($uid,$renewDomain['total'],'支付续费订单'.$order_sn.'扣减');
                    if($res){
                        M('Paylog')->where('id='.$logid)->setField('status',1);//设置已支付
                        //更新订单支付状态
                        $up = array('status'=>1,'pay_time'=>time());
                        $is_pay = M('renew_order')->where('id='.$order_id)->setField($up);
                        if($is_pay){
                            //这里进行通过接口购买产品的操作 将订单产品加入队列处理
                            $this->addToQueueRenew($order_id);

                            $this->success('续费申请提交成功！',U('Cuser/userDomain'));
                        }
                    }
                }
                //微信支付
                if(1==$payment){
                    $project_name = $renew_order_goods['product_name'];//支付标题
                    $this->renewWxpay($order_id,$project_name);//调用微信支付
                }
                //支付宝支付
                if(2==$payment){
                    $project_name = $renew_order_goods['product_name'];//支付标题
                    $this->doRenewAlipay($order_id,$logid,$project_name);//调用支付宝支付
                }

            }


        }
        
    }
    
    /*
     * 根据购物车id统计总价
     */
    public function getCartTotalByIds()
    {
        if(IS_AJAX){
            $user = session('user_auth');
            $uid = $user['id'];
            $ids = I("post.ids");
            $ids = substr($ids,0,strlen($ids)-1);
            $total = $this->model->getToal($ids,$uid);
            $total = number_format($total,2);
            echo json_encode($total);
        }
    }
    

}
<?php

namespace Home\Controller;

use Think\Controller;

class PublicController extends Controller {

    /**
     * 支付宝结果返回 异步通知
     */
    public function notify() {
        $apitype = I('get.apitype');

        $pay = new \Think\Pay($apitype, C('payment.' . $apitype));
        if (IS_POST && !empty($_POST)) {
            $notify = $_POST;
        } elseif (IS_GET && !empty($_GET)) {
            $notify = $_GET;
            unset($notify['method']);
            unset($notify['apitype']);
        } else {
            exit('Access Denied');
        }
        //验证
        if ($pay->verifyNotify($notify)) {
            //获取订单信息
            $info = $pay->getInfo();

            if ($info['status']) {
                $payinfo = M("Pay")->field(true)->where(array('out_trade_no' => $info['out_trade_no']))->find();
                //file_put_contents('alipay_log.txt',$info['out_trade_no']."\r\n",FILE_APPEND);//写文件记录是否异步访问了本控制器
                if ($payinfo['status'] == 0 && $payinfo['callback']) {
                    session("pay_verify", true);
                    $check = R($payinfo['callback'], array('money' => $payinfo['money'], 'param' => unserialize($payinfo['param'])));//这里调用回调函数 就是支付成功之后执行的操作 所以这个方法需要一个返回值 
                    if ($check !== false) {
						//将支付记录更新为已支付状态 
                        M("Pay")->where(array('out_trade_no' => $info['out_trade_no']))->setField(array('update_time' => time(), 'status' => 1));
                    }
                }
                if (I('get.method') == "return") {
                    redirect($payinfo['url']);
                } else {
                    $pay->notifySuccess();
                }
            } else {
                $this->error("支付失败！");
            }
        } else {
            E("Access Denied");
        }
    }



    //使用微信订单查询接口 查询订单
    public function checkWxOrderStatus(){
        //引入WxPayPubHelper
        vendor('Weixinpay.WxPayPubHelper');
        //使用订单查询接口
        $out_trade_no = I("out_trade_no");
        $orderQuery = new \OrderQuery_pub();
        $orderQuery->setParameter("out_trade_no","$out_trade_no");//商户订单号
        //获取订单查询结果
        $orderQueryResult = $orderQuery->getResult();
        if($orderQueryResult["return_code"] == "FAIL"){
            $msg = 0;//通信出错
        }else if($orderQueryResult["result_code"] == "FAIL"){
            //echo "错误代码：".$orderQueryResult['err_code']."<br>";
            //echo "错误代码描述：".$orderQueryResult['err_code_des']."<br>";
            $msg = 0;//支付错误
        }else{
            /*
            echo "交易状态：".$orderQueryResult['trade_state']."<br>";
            echo "设备号：".$orderQueryResult['device_info']."<br>";
            echo "用户标识：".$orderQueryResult['openid']."<br>";
            echo "是否关注公众账号：".$orderQueryResult['is_subscribe']."<br>";
            echo "交易类型：".$orderQueryResult['trade_type']."<br>";
            echo "付款银行：".$orderQueryResult['bank_type']."<br>";
            echo "总金额：".$orderQueryResult['total_fee']."<br>";
            echo "现金券金额：".$orderQueryResult['coupon_fee']."<br>";
            echo "货币种类：".$orderQueryResult['fee_type']."<br>";
            echo "微信支付订单号：".$orderQueryResult['transaction_id']."<br>";
            echo "商户订单号：".$orderQueryResult['out_trade_no']."<br>";
            echo "商家数据包：".$orderQueryResult['attach']."<br>";
            echo "支付完成时间：".$orderQueryResult['time_end']."<br>";
            */
            // $map['order_sn'] = $out_trade_no;
            //$parent_id = M('ParentOrder')->where($map)->getField('id');//统一支付订单id
            //M('ParentOrder')->where($map)->setField('is_pay',1);//将统一支付订单设为已支付状态
            //M('Order')->where('parent_id='.$parent_id)->setField('is_pay',1);//将所有从订单支付状态设为已支付
            //$msg = 1;
            if($orderQueryResult['trade_state'] =='SUCCESS'){
               // $map['order_sn'] = $out_trade_no;
               // $parent_id = M('ParentOrder')->where($map)->getField('id');//统一支付订单id
              //  M('ParentOrder')->where($map)->setField('is_pay',1);//将统一支付订单设为已支付状态
               // M('Order')->where('parent_id='.$parent_id)->setField('is_pay',1);//将所有从订单支付状态设为已支付
                $msg = 1;
            }else{
                $msg = 0;
            }

        }

        echo json_encode($msg);

    }





}

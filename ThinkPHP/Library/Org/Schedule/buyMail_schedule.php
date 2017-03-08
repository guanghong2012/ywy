<?php
/**
 * Created by PhpStorm.
 * User: 温柔一刀
 * Date: 2017/3/6
 * Time: 16:49
 * 购买全球邮
 */
require_once(LIB_PATH.'Org/Schedule/schedule.php');
class buyMail_schedule implements schedule {

    /**
     * $data 格式
     * array("dest"=>xxxxx,"content"=>xxxxxx);
     * 接口返回：{"code":"200","message":"成功","data":{"master_id":2728088,"order_id":2728088,"account_bill_id":1670491,"cash_balance":1904.7901,"bonus_balance":8858,"cash_trans_total":76045.2099,"bonus_trans_total":69220,"transaction_id":3067712,"u_affected_rows":1,"cash_recharge_total":77950,"bonus_recharge_total":78078,"bonus_recharge_id":512263,"instance_id":168756,"mail_id":168756,"keyname":"aicar168.com","expiry_time":"2018-03-07 10:18:56","module":"Order","method":"placeOrder","echo_info":""}}
     */
    public function exec($data){
        //购买全球邮
        $Api = new \Common\Api\CloundApi();

        $return = $Api->buyMail($data);
        $return = json_decode($return,true);

        $result['status'] = intval($return['code']);//200=成功
        $result['attemp'] = 0;
        $result['info'] = json_encode($return['data']);//接口返回信息
        if($return['code']==200 && !empty($return['data'])){
            $this->enableMail($data['goods_id'],$return['data']);
        }
        return $result;

    }

    //开通邮局
    public function enableMail($order_goods_id,$returndata)
    {
        $order_goods_id = (int)$order_goods_id;
        if(!$order_goods_id){
            return false;
        }
        $goods = M('order_goods')->where('id='.$order_goods_id)->find();
        $buy_config = json_decode($goods['buy_config'],true);
        //生成用户邮局
        $data = array(
            'uid' => $goods['uid'],
            'domain' => $buy_config['domain'],
            'name' => $goods['product_name'],
            'usernum' => $buy_config['usernum'],//基本邮箱用户数量
            'space' => $buy_config['space'],//每个用户邮箱容量(G)
            'create_time' => date('Y-m-d H:i:s',time()),//创建时间
            'expiry_time' => $returndata['expiry_time'],//邮局过期时间

            'number' => $buy_config['number'],//额外的邮箱个数限制
            'timeperiod' => $buy_config['timeperiod'],//12个月
            'quota' => $buy_config['quota'],//额外的邮局空间(G)
            'order_id' => $returndata['order_id'],//接口返回订单id
            'mail_id' => $returndata['mail_id'],//邮局ID
            'master_id' => $returndata['master_id'],


        );
        $res = M('user_mail')->add($data);
        if($res){
            //开通成功 更改订单产品状态
            M('order_goods')->where('id='.$order_goods_id)->setField('product_status',1);
        }

    }

}
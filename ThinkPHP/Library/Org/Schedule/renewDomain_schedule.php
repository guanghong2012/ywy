<?php
/**
 * Created by PhpStorm.
 * User: 温柔一刀
 * Date: 2017/3/18
 * Time: 18:36
 * 域名续费
 */
require_once(LIB_PATH.'Org/Schedule/schedule.php');
class renewDomain_schedule implements schedule {
    public function exec($data){
        set_time_limit(0);
        //续费域名
        $Api = new \Common\Api\CloundApi();

        $return = $Api->renewDomain($data);
        $return = json_decode($return,true);

        $result['status'] = intval($return['code']);//200=成功
        $result['attemp'] = 0;
        $result['info'] = json_encode($return['data']);//接口返回信息
        if($return['code']==200 && !empty($return['data'])){
            $this->updateDomain($data['goods_id'],$return['data']);
        }
        return $result;

    }

    //更新用户域名产品到期时间
    public function updateDomain($order_goods_id,$returndata)
    {
        $order_goods_id = (int)$order_goods_id;
        if(!$order_goods_id){
            return false;
        }
        $goods = M('renew_order_goods')->where('id='.$order_goods_id)->find();
        $buy_config = json_decode($goods['buy_config'],true);
        M('renew_order_goods')->where('id='.$order_goods_id)->setField('product_status',1);//设置续费状态
        //返回参数未知 ...
        //更新到期时间
        $origin_expire_time = M('user_domain')->where('id='.$goods['user_goods_id'])->getField('expiry_time');
        $new_expire_time = strtotime($origin_expire_time) + $buy_config['year']*12*3600*24*30;//新的到期时间
        $expire_time = $returndata['expiry_time'] ? $returndata['expiry_time'] : date('Y-m-d H:i:s',$new_expire_time);
        M('user_domain')->where('id='.$goods['user_goods_id'])->setField('expiry_time',$expire_time);

    }

}
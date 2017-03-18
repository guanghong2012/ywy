<?php
/**
 * Created by PhpStorm.
 * User: 温柔一刀
 * Date: 2017/3/6
 * Time: 15:24
 */
require_once(LIB_PATH.'Org/Schedule/schedule.php');
class domainRegister_schedule implements schedule {

    /**
     * $data 格式
     * array("dest"=>xxxxx,"content"=>xxxxxx);
     */
    public function exec($data){
        set_time_limit(0);
        //域名注册
        $Api = new \Common\Api\CloundApi();
        $return = $Api->domainRegister($data);
        $return = json_decode($return,true);

        $result['status'] = intval($return['code']);
        $result['attemp'] = 0;
        $result['info'] = json_encode($return['data']);//接口返回信息
        if($return['code']==200 && !empty($return['data'])){
            $this->enableDomain($data['goods_id'],$return['data']);
        }
        return $result;

    }
    
    //开通用户域名
    public function enableDomain($order_goods_id,$returndata)
    {
        $order_goods_id = (int)$order_goods_id;
        if(!$order_goods_id){
            return false;
        }
        $goods = M('order_goods')->where('id='.$order_goods_id)->find();
        $buy_config = json_decode($goods['buy_config'],true);

        //通过接口查看新一代域名详情
        $Api = new \Common\Api\CloundApi();
        $request_data = array(
            'domain' => $buy_config['domain']
        );
        $return = $Api->domainDetail($request_data);
        $return = json_decode($return,true);//接口返回数据

        if($return){
            $admin_user = $return['data']['punycode'];//控制面板管理员登录名
            $admin_pass = $return['data']['passwd'];//控制面板管理员登录密码
        }

        //生成用户虚拟机产品
        $data = array(
            'uid' => $goods['uid'],
            'domain' => $buy_config['domain'],
            'tld' => $buy_config['tld'],
            'year' => $buy_config['year'],//注册年数
            'lang' => $buy_config['lang'],//域名语言
            'encoding' => $buy_config['encoding'],//域名编码
            'create_time' => date("Y-m-d H:i:s",time()),//创建时间
            'expiry_time' => $returndata['expiry_time'],//邮局过期时间
            'orderSn' => time(),//编号

            'order_id' => $returndata['order_id'],//接口返回订单id
            'admin_user' => $admin_user,//控制面板管理员登录名
            'admin_pass' => $admin_pass,//控制面板管理员登录密码
        );
        $res = M('user_domain')->add($data);
        if($res){
            //开通成功 更改订单产品状态
            M('order_goods')->where('id='.$order_goods_id)->setField('product_status',1);
        }
    }
    
    
}
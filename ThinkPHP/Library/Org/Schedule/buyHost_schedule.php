<?php
/**
 * Created by PhpStorm.
 * User: 温柔一刀
 * Date: 2017/3/6
 * Time: 16:49
 * 购买虚拟主机
 */
require_once(LIB_PATH.'Org/Schedule/schedule.php');
class buyHost_schedule implements schedule {

    /**
     * $data 格式
     * array("dest"=>xxxxx,"content"=>xxxxxx);
     * {"code":"200","message":"成功","data":{"host_id":"956054","order_id":2720282,"state":"0","closed_by":"0","free_days":null,"create_time":"2017-02-21 15:28:13","site_id":637441,"expiry_time":"2018-03-21 15:28:13","errordocuments":null,"directoryindex":"","site_comment":null,"close_code":null,"os_type":"CENTOS6","product_name":"H10066377","login":"H10066377","password":"F77Xa7v2","ftp_state":"0","ftp_closed_by":"0","ftp_user":"webmaster@H10066377","ftp_pass":"ls559Mi4","site_ip":"124.172.147.4","web_state":"0","web_closed_by":"0","web_ip":"124.172.146.2","web_port":80,"web_servername":"H10066377","_limit_Bandwidth":"250","_limit_Traffic":"20000","_usage_Traffic":"0","_limit_MaxConnections":"150","_limit_Quota":"200","_usage_Quota":"0","_limit_Asp":0,"_limit_AspDotNet":0,"_limit_Jsp":0,"_limit_Servlet":0,"_limit_Php":1,"0":0,"web_serveraliases":"aicar168.com www.aicar168.com a637441.sn4513.gzonet.net","_limit_WebSite":1,"_limit_FTPAccount":1,"_limit_MySQLDBSpace":"30","_usage_MySQLDBSpace":"0","_usage_MySQLDB":1,"_limit_MySQLDB":1,"mysql_id":"159814","mysql_ip":"124.172.147.3","module":"Order","method":"placeOrder","echo_info":""}}
     */
    public function exec($data){
        set_time_limit(0);
        //购买虚拟主机
        $Api = new \Common\Api\CloundApi();

        $return = $Api->buyHost($data);
        $return = json_decode($return,true);

        $result['status'] = intval($return['code']);//200=成功
        $result['attemp'] = 0;
        $result['info'] = json_encode($return['data']);//接口返回信息
        if($return['code']==200 && !empty($return['data'])){
            $this->enableHost($data['goods_id'],$return['data']);
        }
        return $result;

    }
    
    //开通虚拟机
    public function enableHost($order_goods_id,$returndata)
    {
        $order_goods_id = (int)$order_goods_id;
        if(!$order_goods_id){
            return false;
        }
        $goods = M('order_goods')->where('id='.$order_goods_id)->find();
        $buy_config = json_decode($goods['buy_config'],true);
        //生成用户虚拟机产品
        $data = array(
            'domain' => $buy_config['domain'],
            'name' => $goods['product_name'],
            'product_id' => $buy_config['product_id'],
            'timeperiod' => $buy_config['timeperiod'],//购买月数
            'os_type' => $returndata['os_type'],//操作系统
            'create_time' => $returndata['create_time'],//创建时间
            'expire_time' => $returndata['expiry_time'],//到期时间
            'web_orderid' => $goods['order_id'],//站内订单id
            'uid' => $goods['uid'],//用户id
            'host_id' => $returndata['host_id'],//接口主机id
            'order_id' => $returndata['order_id'],//接口订单id
            'site_id' => $returndata['site_id'],//接口站点ID
            'product_name' => $returndata['product_name'],//新一代产品名称
            'login' => $returndata['login'],//登录名
            'password' => $returndata['password'],//登录密码
            'ftp_user' => $returndata['ftp_user'],//FTP用户名
            'ftp_pass' => $returndata['ftp_pass'],//FTP密码
            'site_ip' => $returndata['site_ip'],//虚拟机IP地址
            'web_ip' => $returndata['web_ip'],//WEB主机IP
            'web_servername' => $returndata['web_servername'],//WEB主机servername
        );
        $res = M('user_vitrual')->add($data);
        if($res){
            //开通成功 更改订单产品状态
            M('order_goods')->where('id='.$order_goods_id)->setField('product_status',1);
        }

    }
    
}
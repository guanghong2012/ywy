<?php
/**
 * Created by PhpStorm.
 * User: 温柔一刀
 * Date: 2017/3/6
 * Time: 15:48
 * 检测域名是否被注册接口实现
 */
require_once(LIB_PATH.'Org/Schedule/schedule.php');
class checkDomain_schedule implements schedule {

    /**
     * $data 格式
     * array("dest"=>xxxxx,"content"=>xxxxxx);
     */
    public function exec($data){
        //检测域名是否被注册
        $Api = new \Common\Api\CloundApi();
        $domain = $data['domain'];
        $tld = $data['tld'];
        $lang = $data['lang'];
        $encoding = $data['encoding'];

        $return = $Api->checkDomain($domain,$tld,$lang,$encoding);
        $return = json_decode($return,true);
        if($return['data']['available']==1){
            $info = '可以注册';
        }elseif($return['data']['available']==0){
            $info = '不可注册';
        }elseif($return['data']['available']===false){
            $info = '查询失败';
        }

        $result['status'] = intval($return['code']);//200=成功
        $result['attemp'] = 0;
        $result['info'] = $info;
        return $result;

    }
}
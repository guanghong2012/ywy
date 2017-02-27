<?php
/**
 * Created by PhpStorm.
 * User: 温柔一刀
 * Date: 2017/2/20
 * Time: 16:34
 * 新一代云接口
 */

namespace Common\Api;


class CloundApi
{
    private $c_agentid;//API代理ID
    private $c_email;//API代理登陆邮箱
    private $c_vtime;//提交时间
    private $secret_phrase;//代理验证密钥
    private $out_format;//输出信息格式
    private $c_validatestr;//
    //private $c_action;//行为参数
    private $url;//接口地址
    private $result = '';

    public function __construct()
    {
        $this->c_agentid = '21154';
        $this->c_email = 'info@qbt8.com';
        $this->c_vtime = date("YYYYmmddHHiiss",time());
        $this->secret_phrase = '50655e32e1fbcc669d80d5a39bb7af68';
        $this->out_format = 'json';
        $this->c_validatestr = 'md5string';
        $this->url = 'http://www.gzidc.com/api.php';

    }

    /*
     *请求接口获取数据
     * $action 行为参数
     * $data 接口需要传递的参数
     */
    public function getResult($action='',$data=array())
    {
        if(empty($action)){
            $this->result = array("code"=>200,"message"=>'行为参数不能为空');
            return $this->result;
        }
        //接口需要的基本参数
        $this->baseData = array(
            'c_agentid' => $this->c_agentid,
            'c_email' => $this->c_email,
            'c_vtime' => $this->c_vtime,
            'secret_phrase' => $this->secret_phrase,
            'out_format' => $this->out_format,
            'c_validatestr' => $this->c_validatestr,
            'c_action' => $action
        );

        if(!empty($data)){
            $this->data = array_merge($this->baseData,$data);
        }else{
            $this->data = $this->baseData;
        }
        $res = request_post($this->url,$this->data);
        //return $this->result = json_decode($res,true);
        return $res;//直接返回json格式的数据
    }
    
    /*
     * 查询域名是否已注册
     * return Array ( [code] => 200 [message] => 成功 [data] => Array ( [available] => 0 [module] => Domain [method] => Whois [echo_info] => ) )
     * available=0 0代表已被注册, 1代表可以注册，返回空则查询失败
     */
    public function checkDomain($domain='',$tld='',$lang='ENG',$encoding='UTF-8')
    {
        if(empty($domain)){
            $this->result = array("code"=>100,"域名不能为空");
            return $this->result;
        }
        if(empty($tld)){
            $this->result = array("code"=>100,"域名后缀不能为空");
            return $this->result;
        }
        $data = array(
            'domain' => $domain,
            'tld' => $tld,
            'lang' => $lang,
            'encoding' => $encoding
        );
        $this->result = $this->getResult($action='Domain.Whois',$data);

        return $this->result;
    }

    /*
     * 查看产品详情
     */
    public function productDetail($product_id)
    {
        $product_id = intval($product_id);
        if(!$product_id){
            $this->result = array("code"=>100,"产品id不正确");
            return $this->result;
        }
        $data['product_id'] = $product_id;
        $this->result = $this->getResult($action='Product.Detail',$data);

        return $this->result;
    }



}
<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Home\Controller;
use Common\Api\CloundApi;
use Org\Schedule\Queue;
use OT\DataDictionary;

/**
 * 前台首页控制器
 * 主要获取首页聚合数据
 */
class IndexController extends HomeController {

	//系统首页
    public function index(){
        //亿维云网优势
        $advantages = D('Document')->where('category_id=58 and status=1')->field('id,title,description,cover_id')->order('level desc')->select();

        //热门动态6条
        $document = D('Document');
        $hot_news = $document->where('category_id=53 and status=1')->order('level desc')->field('id,title,create_time')->select();
        //产品动态6条
        $product_news = $document->where('category_id=59 and status=1')->order('level desc')->field('id,title,create_time')->select();
        //媒体报告6条
        $media_news = $document->where('category_id=57 and status=1')->order('level desc')->field('id,title,create_time')->select();

        //解决方案及客户案例
        $all_solution = D('cases')->field('id,title,description,images')->order('level desc')->select();
        if(!empty($all_solution)){
            foreach($all_solution as $key=>$value){
                $cases = D('CasesDemo')->where('case_id='.$value['id'])->order('level desc')->limit(5)->select();
                $all_solution[$key]['cases'] = $cases;
            }
        }

        //套餐云产品
        $package_list = D('PackageHost')->order('level asc')->select();
        //企业邮箱
        $mail = M('mail')->find(1);

        $this->assign('mail',$mail);
        $this->assign('package_list',$package_list);
        $this->assign('all_solution',$all_solution);
        $this->assign('advantages',$advantages);
        $this->assign('hot_news',$hot_news);
        $this->assign('product_news',$product_news);
        $this->assign('media_news',$media_news);
        $this->display();
    }
    
    //测试队列
    public function test()
    {
        $queue = new Queue();

        /*/测试域名查询
        $schedule_data = array(
            'domain' => 'baga168.com',
            'tld' => '.com',
            'lang' => 'ENG',
            'encoding' => 'ASCII'
        );
        $queue::add($type='checkDomain',$name='域名查询',$schedule_data,$schedule_time=0);
        */

        /*测试虚拟机注册
        $schedule_data = array(
            'domain' => 'baga168.com',
            'product_id' => '488',
            'timeperiod' => '12',
            'os_type' => '1',
            'goods_id' => 4//订单产品id
        );
        //$queue::add($type='buyHost',$name='虚拟主机注册',$schedule_data,$schedule_time=time());
        $list = $queue::getQueueTask();
        $data = $list[0];
        $res = $queue::executeQueue($data);
        print_r($res);
        */


        //测试全球邮
        /*
        $ordergoods = M('order_goods')->where('id=11')->find();
        $buy_config = json_decode($ordergoods['buy_config'],true);
        $schedule_data = array(
            'domain' => $buy_config['domain'],
            'quota' => $buy_config['quota'],
            'timeperiod' => $buy_config['timeperiod'],
            'number' => $buy_config['number'],
            'goods_id' => 11//订单产品id
        );
        //$queue::add($type='buyMail',$name='全球邮购买',$schedule_data,$schedule_time=time());
        $list = $queue::getQueueTask();
        $data = $list[0];
        $res = $queue::executeQueue($data);
        print_r($res);
        */

        //测试域名注册
        /*
        $ordergoods = M('order_goods')->where('id=5')->find();
        $buy_config = json_decode($ordergoods['buy_config'],true);
        $domain_info = json_decode($ordergoods['domain_info'],true);//注册人填写信息
        $schedule_data = array(
            'domain' => $buy_config['domain'],
            'year' => $buy_config['year'],
            'tld' => $buy_config['tld'],
            'lang' => $buy_config['lang'],
            'encoding' => $buy_config['encoding'],

            //注册人信息
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

            'goods_id' => 5//订单产品id
        );
        //$queue::add($type='domainRegister',$name='域名注册',$schedule_data,$schedule_time=time());
        $list = $queue::getQueueTask();
        $data = $list[0];
        $res = $queue::executeQueue($data);
        print_r($res);
        */
    }

    /*
     * 公共详情页
     */
    public function detail()
    {
        $id = (int)I('id');
        !$id && $this->error("非法访问");
        /* 获取详细信息 */
        $Document = D('Document');
        $info = $Document->detail($id);
        if(!$info){
            $this->error($Document->getError());
        }
        $this->assign('info', $info);
        $this->display();
    }

    public function send()
    {
        send_mail("develop11@qbt8.com","测试一下","<h1>我是测试</h1>这是php点点通（<font color=red>www.phpddt.com</font>）对phpmailer的测试内容");
    }

}
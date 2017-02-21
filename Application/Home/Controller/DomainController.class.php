<?php
/**
 * Created by PhpStorm.
 * User: 温柔一刀
 * Date: 2017/2/17
 * Time: 14:32
 * 域名注册控制器
 */
namespace Home\Controller;

use Common\Api\CloundApi;

class DomainController extends HomeController{

    public function index()
    {
        //亿维云网优势
        $advantages = D('Document')->where('category_id=58 and status=1')->field('id,title,description,cover_id')->order('level desc')->select();

        //热门动态6条
        $document = D('Document');
        $hot_news = $document->where('category_id=53 and status=1')->order('level desc')->field('id,title,create_time')->select();
        //产品动态6条
        $product_news = $document->where('category_id=59 and status=1')->order('level desc')->field('id,title,create_time')->select();
        //媒体报告6条
        $media_news = $document->where('category_id=57 and status=1')->order('level desc')->field('id,title,create_time')->select();

        $this->assign('advantages',$advantages);
        $this->assign('hot_news',$hot_news);
        $this->assign('product_news',$product_news);
        $this->assign('media_news',$media_news);
        $this->display();
    }
    
    /*
     * 域名查询结果
     */
    public function checkDomainResult()
    {
        if(IS_POST){
            $domain = I('post.domain');
            $tld = I('post.tld');
            $lang = I('post.lang') ? I('post.lang') : 'ENG';
            if(empty($domain)){
                $return = array("status"=>0,"msg"=>"请输入要查询的域名！");
                echo json_encode($return);
                exit();
            }
            //调用接口查询域名是否被注册
            $Api = new CloundApi();
            if(is_array($tld)){
                $result = array();
                foreach($tld as $k=>$v){
                    $result[$k]['id'] = $k;
                    $result[$k]['domain'] = $domain.$v;
                    $result[$k]['ltd'] = $v;
                    $rs = $Api->checkDomain($domain.$v,$v,$lang);
                    $result[$k]['result'] = json_decode($rs,true);
                }
                //print_r($tld);
            }else{
                $rs = $Api->checkDomain($domain.$tld,$tld,$lang);
                $result[0]['id'] = 0;
                $result[0]['domain'] = $domain.$tld;
                $result[0]['ltd'] = $tld;
                $result[0]['result'] = json_decode($rs,true);

            }

            if(!empty($result)){
                //将查询结果存进session
                session('check_domain',$result);
            }

            $return = array("status"=>1,"url"=>U('Domain/checkDomainResult'),"msg"=>"查询成功！");
            echo json_encode($return);
            exit();
        }else{
            $list = session('check_domain');

            print_r($list);
            $this->assign('list',$list);
            $this->display();
        }

    }

    /*
     * 确定购买域名 将选中的域名加入需要购买的数组
     */
    public function addDomainToBuy()
    {
        //print_r($_POST);
        $domains = I('post.domain');
        $years = I('post.year');
        $list = session('check_domain');
        if(empty($domains)){
            $return = array("status"=>0,"msg"=>"请选择域名");
            echo json_encode($return);
            exit();
        }else{
            foreach($domains as $key=>$val){
                $domainToBuy[] = array(
                    'year' => $years[$key][0],
                    'domain' => $val[0],
                    'ltd' => $list[$key]['ltd'],
                );
            }
            session('domainToBuy',$domainToBuy);
            $return = array("status"=>1,"url"=>U('Domain/buyDomainInfo'),"msg"=>"添加成功");
            echo json_encode($return);
            exit();
        }


    }

    /*
     * 填写域名购买信息
     */
    public function buyDomainInfo()
    {

        //$this->assign();
        $this->display();
    }

    
}
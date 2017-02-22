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
        /* 用户登录检测 */
        $user = session('user_auth');
        if(empty($user)){
            $return = array("status"=>2,"url"=>U('Cuser/login'),"msg"=>"请登录");
            echo json_encode($return);
            exit();
        }
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
                    'month' => $years[$key][0]*12,//用月份保存
                    'domain' => $val[0],
                    'ltd' => $list[$key]['ltd'],
                    'info'=> 0,
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
        if(IS_POST){
            $data = I('post.');
            $k = $data['k'];
            $islast = $data['islast'];
            unset($data['k']);
            unset($data['islast']);
            $domainToBuy = session('domainToBuy');
            $domainToBuy[$k]['info'] = $data;
            session('domainToBuy',$domainToBuy);
            //echo "<pre>";
            //print_r($_POST);
            //print_r(session('domainToBuy'));
            if($islast!=1){
                $return = array("status"=>1,"url"=>U('Domain/buyDomainInfo'),"msg"=>"信息填写成功！");
                echo json_encode($return);
                exit();
            }else{
                //填写完最后一个域名信息
                $return = array("status"=>2,"url"=>U('Domain/addDomainsToCart'),"msg"=>"跳转购物车！");
                echo json_encode($return);
                exit();
            }
        }else{
            $domainToBuy = session('domainToBuy');
            $i = 0;
            $islast = 0;
            foreach($domainToBuy as $key=>$val){
                if(empty($val['info'])){
                    $k = $key;
                    break;
                }else{
                    $i++;
                }
            }
            if(count($domainToBuy)-1 == $i){
                $islast = 1;
            }
            echo $k;
            echo '#'.$islast;

            $this->assign("islast",$islast);
            $this->assign("k",$k);
            $this->assign("domainToBuy",$domainToBuy);
            $this->display();
        }

    }
    
    /*
     * 域名购买 加入购物车
     */
    public function addDomainsToCart()
    {
        /* 用户登录检测 */
        $user = session('user_auth');

        if(empty($user)){
            $this->error("用户未登录",U('Cuser/login'));
        }
        $domainToBuy = session('domainToBuy');

        if(!empty($domainToBuy)){
            $model = D("Cart");
            $j = 0;
            //加入购物车
            foreach($domainToBuy as $key=>$value){
                $data = array();
                $data['uid'] = $user['id'];
                $data['name'] = $value['ltd']."域名";
                $data['keywords'] = $value['domain'];
                $data['number'] = 1;
                $data['price'] = 1.00;//域名单价未知
                $data['month'] = $value['month'];
                $data['base_total'] = $data['number'] * $data['price'];
                $data['added_price	'] = 0.00;

                $project['name'] = $value['ltd'].'_ENG';

                $data['project	'] = json_encode($project);//方案信息
                $data['parameters	'] = '';//参数信息
                $data['type'] = 1;//产品类型 1=域名
                $data['domain_info'] = json_encode($value['info']);//域名注册信息

                $res = $model->addCart($data);
                $res && $j++;
            }
            if($j>0){
                session('domainToBuy',null);
                $this->redirect('Cart/index');
            }

        }
        print_r($domainToBuy);
    }



    
}
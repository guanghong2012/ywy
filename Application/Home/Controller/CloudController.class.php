<?php
/**
 * Created by PhpStorm.
 * User: 温柔一刀
 * Date: 2017/2/24
 * Time: 16:46
 */
namespace Home\Controller;

use Common\Api\CloundApi;

class CloudController extends HomeController{
    
    public function index()
    {
        $cloud_cate = D('CloudCategory')->order('level asc')->select();

        $this->assign('cloud_cate',$cloud_cate);
        $this->display();
    }
    
    //列表页
    public function productList($cate_id)
    {
        $cate_id = intval($cate_id);
        !$cate_id && $this->error("非法访问！");
        $map = array();
        $map['type_id'] = $cate_id;
        $category = D('CloudCategory')->detail($cate_id);
        $list = D('CloudProduct')->where($map)->order('level asc')->select();
        if(!empty($list)){
            foreach($list as &$value){
                $price = M('cp_price')->where('pid='.$value['id'])->order('type_id asc')->select();
                $value['price_info'] = $price;
            }
        }

        $this->assign('list',$list);
        $this->assign('category',$category);
        $this->display();
    }
    
    /*
     * 详情页
     */
    public function productDetail($id)
    {
        $id = intval($id);
        !$id && $this->error("非法访问！");
        $info = D('CloudProduct')->detail($id);

        //价格信息
        if($info){
            $price = M('CpPrice')->where('pid='.$id)->select();
            $type = D('CloudCategory')->detail($info['type_id']);
        }
        $this->assign('type',$type);
        $this->assign('price',$price);
        $this->assign('info',$info);
        $this->display();
    }
    
    /*
     * 虚拟机购买
     */
    public function productBuy()
    {
        if(IS_AJAX){
            $id = I('id');
            $price_id = I('price_id');
            if(intval($id)>0 && intval($price_id)>0){
                $url = U('Cloud/configToBuy',array('id'=>$id,'price_id'=>$price_id));
                $return = array('status'=>1,'url'=>$url,'msg'=>'');

            }else{
                $return = array('status'=>0,'url'=>'','msg'=>'参数错误！');
            }
            echo json_encode($return);exit;
        }


    }

    /*
     * 虚拟机购买选择配置
     */
    public function configToBuy()
    {
        $id = intval(I('get.id'));
        $price_id = intval(I('get.price_id'));
        if(!$id || !$price_id){
            $this->error('非法访问！');
        }
        $model = D('CloudProduct');
        $info = $model->detail($id);
        if(!$info){
            $this->error('产品不存在！');
        }
        $category = D('CloudCategory')->where('id='.$info['type_id'])->find();
        $price = M('CpPrice')->where('id='.$price_id)->find();
        if($price){
            $price['os_type'] = explode(',',$price['os_type']);
        }else{
            $this->error('产品价格信息维护中！');
        }
        session('userurl',$_SERVER['REQUEST_URI']);//记录登录前的页面地址
        $this->assign('info',$info);
        $this->assign('price',$price);
        $this->assign('category',$category);
        $this->display();
    }
    
    /*
     * 虚拟机加入购物车
     */
    public function addToCart()
    {
        if(IS_AJAX){
            /* 用户登录检测 */
            $user = session('user_auth');
            if(empty($user)){
                $status = 2;
                $msg = '用户未登录！';
                $return = array('status'=>$status,'url'=>U('Cuser/login'),'msg'=>$msg);
                echo json_encode($return);exit;
            }
            $id = intval(I('post.id'));
            $price_id = intval(I('post.price_id'));
            $product_id = intval(I('post.product_id'));
            $domain = I('post.domain');
            $os_type = intval(I('post.os_type'));
            $year = intval(I('post.year'));
            //调用接口查询产品信息
            $Api = new CloundApi();
            $parameters = $Api->productDetail($product_id);
            $product_parameters = json_decode($parameters,true);
            if($product_parameters['code'] != 200){
                $status = 0;
                $msg = '系统繁忙，请稍后重试！';
                $return = array('status'=>$status,'msg'=>$msg);
                echo json_encode($return);exit;
            }
            if(!$id){
                $status = 0;
                $msg = '产品id不存在！';
                $return = array('status'=>$status,'msg'=>$msg);
                echo json_encode($return);exit;
            }
            if(!$price_id){
                $status = 0;
                $msg = '产品价格不存在！';
                $return = array('status'=>$status,'msg'=>$msg);
                echo json_encode($return);exit;
            }
            if(empty($domain)){
                $status = 0;
                $msg = '请填写绑定域名！';
                $return = array('status'=>$status,'msg'=>$msg);
                echo json_encode($return);exit;
            }
            if(substr($domain,0,2) == 'www' || substr($domain,0,2) =='WWW'){
                $status = 0;
                $msg = '请不要加\'www\'前缀, 我们在建站时会自动为您绑定www子域名！';
                $return = array('status'=>$status,'msg'=>$msg);
                echo json_encode($return);exit;
            }
            if(empty($os_type)){
                $status = 0;
                $msg = '请选择主机类型！';
                $return = array('status'=>$status,'msg'=>$msg);
                echo json_encode($return);exit;
            }

            //添加到购物车
            //$product = D('CloudProduct')->detail($id);
            $price_info = M('CpPrice')->where('id='.$price_id)->find();
            $price_field = priceMap($year);

            switch($product_parameters['data']['os']){
                case 1:
                    $os = 'CENTOS6';
                    break;
                case 2:
                    $os = 'windows';
                    break;
                case 0:
                    $os = 'CENTOS6或windows';
                    break;
                default:
                    $os = 'CENTOS6';
            }
            $model = D("Cart");
            $data = array();
            $data['uid'] = $user['id'];
            $data['product_id'] = $product_id;//新一代产品id
            $data['name'] = $product_parameters['data']['name'];
            $data['keywords'] = '无';
            $data['number'] = 1;
            $data['price'] = $price_info[$price_field];//域名单价未知
            $data['month'] = $year * 12;//购买时限
            $data['base_total'] = $data['number'] * $data['price'];
            $data['added_price'] = 0.00;

            $project['name'] = $product_parameters['data']['name'];//方案名称
            $project['os'] = $os;//操作系统

            $data['project'] = json_encode($project);//方案信息
            $data['parameters'] = json_encode($product_parameters['data']);//产品参数信息
            $data['type'] = 2;//产品类型 1=域名 2=虚拟机3=企业邮箱4=云服务器5=云建站
            $data['domain_info'] = '';//域名注册信息
            $data['subtotal'] = $data['base_total'] + $data['added_price'];//全部总价
            $data['price_id'] = $price_id;
            $res = $model->addCart($data);//加入购物车
            if($res){
                $return = array('status'=>1,'url'=>U('Cart/index'),'msg'=>'加入购物车成功');
                echo json_encode($return);exit;
            }
        }else{
            $this->error("非法访问！");
        }

    }


}
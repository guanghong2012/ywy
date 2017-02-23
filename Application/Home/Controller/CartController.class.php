<?php
/**
 * Created by PhpStorm.
 * User: 温柔一刀
 * Date: 2017/2/22
 * Time: 15:40
 * 购物车控制器
 */
namespace Home\Controller;

class CartController extends HomeController{
    public function _initialize()
    {
        parent::_initialize();
        $this->is_login();
        $this->model = D("Cart");
    }

    /*
     * 购物车列表
     */
    public function index()
    {
        $user = session('user_auth');
        $uid = $user['id'];

        //获取用户的购物车列表
        $list = $this->model->getCartByUid($uid);
        foreach($list as &$value){
            if(!empty($value['domain_info'])){
                $value['domain_info'] = json_decode($value['domain_info'],true);//域名信息
                $value['project'] = json_decode($value['project'],true);//方案信息
            }
            $value['year'] = $value['month']/12;

        }
        $total = $this->model->getToal('',$uid);//购物车总价

        $this->assign('total',$total);
        $this->assign('list',$list);
        $this->display();
    }

    /*
     *从购物车删除
     */
    public function DeleteCart($id)
    {
        if(IS_AJAX){
            if(!$id){
                $return = array("status"=>0,"msg"=>"缺少id");
                echo json_encode($return);exit();
            }
            $res = $this->model->removeCart($id);
            if($res){
                $return = array("status"=>1,"url"=>U('Cart/index'),"msg"=>"删除成功！");

            }else{
                $return = array("status"=>0,"msg"=>"删除出错！");

            }
            echo json_encode($return);exit();
        }
    }

    /*
     * 选择支付方式
     */
    public function selectPayment()
    {
        $user = session('user_auth');
        $uid = $user['id'];

        //获取用户的购物车列表
        $list = $this->model->getCartByUid($uid);
        if(empty($list)){
            $this->error("购物车为空！");
        }
        foreach($list as &$value){
            if(!empty($value['domain_info'])){
                $value['domain_info'] = json_decode($value['domain_info'],true);//域名信息
                $value['project'] = json_decode($value['project'],true);//方案信息
            }
            $value['year'] = $value['month']/12;

        }
        $total = $this->model->getToal('',$uid);//购物车总价

        $this->assign('total',$total);
        $this->assign('list',$list);
        $this->display();
    }


}
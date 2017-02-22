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

    public function index()
    {
        $user = session('user_auth');
        $uid = $user['id'];

        $list = $this->model->getCartByUid($uid);
        foreach($list as &$value){
            if(!empty($value['domain_info'])){
                $value['domain_info'] = json_decode($value['domain_info'],true);
            }
            $value['year'] = $value['month']/12;
        }
        $total = $this->model->getToal('',$uid);

        $this->assign('total',$total);
        $this->assign('list',$list);
        $this->display();
    }
}
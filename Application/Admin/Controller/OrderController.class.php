<?php
/**
 * Created by PhpStorm.
 * User: 温柔一刀
 * Date: 2017/3/8
 * Time: 16:26
 */
namespace Admin\Controller;

class OrderController extends AdminController{
    public function _initialize()
    {
        parent::_initialize();
        $this->usermodel = D('Cuser');
    }
    //订单列表
    public function index()
    {
        $map = array();
        $keywords = I('keywords');
        if(!empty($keywords)){
            $map['ordersn|username']=   array($keywords,array('like','%'.$keywords.'%'),'_multi'=>true);
        }

        $list   = $this->lists('order', $map,$order='create_time desc');
        int_to_string($list);

        $this->assign('_list', $list);
        $this->meta_title = '订单列表';
        $this->display();
    }
    /*
     * 订单产品
     */
    public function orderGoods($order_id)
    {
        $order_id = (int)$order_id;
        !$order_id && $this->error("缺少参数id");
        $map = array();
        $keywords = I('keywords');
        $map['order_id'] = $order_id;
        if(!empty($keywords)){
            $map['ordersn|username']=   array($keywords,array('like','%'.$keywords.'%'),'_multi'=>true);
        }

        $list   = $this->lists('order_goods', $map);
        int_to_string($list);

        $this->assign('_list', $list);
        $this->meta_title = '订单产品列表';

        $order = M('order')->find($order_id);


        $this->assign('order',$order);
        $this->display();
    }
    /*
     * 查看订单产品
     */
    public function viewGoods($id)
    {
        $id = (int)$id;
        !$id && $this->error("缺少参数id");
        $info = M('order_goods')->find($id);
        if($info['buy_config']){
            $info['config'] = json_decode($info['buy_config'],true);
        }
        $this->assign('info', $info);
        $this->meta_title = '查看订单产品';
        $this->display();
    }


    
}
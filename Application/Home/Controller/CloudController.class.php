<?php
/**
 * Created by PhpStorm.
 * User: 温柔一刀
 * Date: 2017/2/24
 * Time: 16:46
 */
namespace Home\Controller;

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
                $price = M('cp_price')->where('product_id='.$value['product_id'])->find();
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
    public function productBuy($id)
    {
        $id = intval($id);
        !$id && $this->error("非法访问!");


    }
    

}
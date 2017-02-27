<?php
/**
 * Created by PhpStorm.
 * User: 温柔一刀
 * Date: 2017/2/22
 * Time: 14:50
 * 购物车模型
 */
namespace Home\Model;
use Think\Model;

class CartModel extends Model{

    protected $_auto = array(
        array('add_time', NOW_TIME, self::MODEL_INSERT),
    );
    
    //加入购物车 
    public function addCart($data = null)
    {
        /* 获取数据对象 */
        $data = $this->token(false)->create($data);
        if(empty($data)){
            return false;
        }
        $id = $this->add(); //添加基础内容
        if(!$id){
            $this->error = '新增购物车出错！';
            return false;
        }
        return $id;
    }
    
    /*
     * 更新购物车
     */
    public function updateCart($cartid,$data = null)
    {
        if(empty($cartid)){
            $this->error = '缺少要更新的购物车id！';
            return false;
        }
        /* 获取数据对象 */
        $data = $this->token(false)->create($data);
        if(empty($data)){
            return false;
        }

        $status = $this->where('id='.$cartid)->save(); //更新购物车
        if(false === $status){
            $this->error = '更新购物车出错！';
            return false;
        }
        return $status;
    }
    
    /*
     * 从购物车删除
     */
    public function removeCart($cartid)
    {
        if(empty($cartid)){
            $this->error = '缺少购物车id！';
            return false;
        }
        if(is_array($cartid)){
            $cartid = implode(',',$cartid);
        }
        $map = array();
        $map['id'] = array("in",$cartid);
        $status = $this->where($map)->delete(); //删除购物车
        if(false === $status){
            $this->error = '删除购物车出错！';
            return false;
        }
        return $status;
    }
    
    /*
     * 获取某个用户的购物车列表
     */
    public function getCartByUid($uid)
    {
        if(empty($uid)){
            $this->error = '缺少用户id！';
            return false;
        }
        $map = array();
        $map['uid'] = $uid;
        $list = $this->where($map)->order('add_time desc')->select();
        return $list;
    }
    
    /*
     * 统计购物车总价
     */
    public function getToal($carids = 0,$uid='')
    {
        $map = array();
        $map['uid'] = $uid;
        if(empty($carids) && empty($uid)){
            $this->error = '缺少购物车id或用户id！';
            return false;
        }

        //统计某用户购物车总价
        if(empty($carids) && !empty($uid)){
            //统计所有
            $all_base_total = $this->where($map)->sum("base_total");
            $all_added_total = $this->where($map)->sum("added_price");
            $total = $all_base_total + $all_added_total;
            return $total;
        }

        //根据购物车id统计总价
        if($carids){
            if(is_array($carids)){
                $carids = implode(',',$carids);
            }
            $map['id'] = array("in",$carids);

            $all_base_total = $this->where($map)->sum("base_total");

            $all_added_total = $this->where($map)->sum("added_price");
            $total = $all_base_total + $all_added_total;
            return $total;
        }

    }
    
    //统计某会员购物车数量
    public function getCartNumByUid($uid)
    {
        $map = array();
        $map['uid'] = $uid;
        if(empty($carids) && empty($uid)){
            $this->error = '缺少用户id！';
            return false;
        }
        $cartNum = $this->where($map)->count();
        return $cartNum;

    }

    //清空用户购物车
    public function clearCartByUid($uid)
    {
        if(!$uid){
            $this->error = '缺少用户id！';
            return false;
        }
        $map = array();
        $map['uid'] = $uid;
        $status = $this->where($map)->delete(); //删除购物车
        if(false === $status){
            $this->error = '删除购物车出错！';
            return false;
        }
        return $status;
    }
    
}
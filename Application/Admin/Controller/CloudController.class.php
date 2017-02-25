<?php
/**
 * Created by PhpStorm.
 * User: 温柔一刀
 * Date: 2017/2/23
 * Time: 22:51
 */
namespace Admin\Controller;

class CloudController extends AdminController{
    //列表
    public function index()
    {
        $map = array();
        $list   = $this->lists('CloudCategory', $map,$order='level asc');
        int_to_string($list);
        $this->assign('_list', $list);
        $this->meta_title = '虚拟机分类列表';
        $this->display();
    }

    /*
     * 新增分类
     */
    public function addCate()
    {
        $this->meta_title = '新增虚拟机分类';
        $this->display();
    }

    /**
     * 更新一条数据
     * @author 温柔一刀
     */
    public function updateCate(){
        $document   =   D('CloudCategory');
        $res = $document->update();
        if(!$res){
            $this->error($document->getError());
        }else{
            $this->success($res['id']?'更新成功':'新增成功');
        }
    }

    /*
     * 编辑分类
     */
    public function editCate($id)
    {
        if(empty($id)){
            $this->error('参数不能为空！');
        }
        $info = D('CloudCategory')->detail($id);

        $this->assign('info', $info);
        $this->meta_title = '编辑分类';
        $this->display();
    }

    /*
     * 删除案例分类
     */
    public function removeCate()
    {
        $id = array_unique((array)I('id',0));
        $id = is_array($id) ? implode(',',$id) : $id;
        if ( empty($id) ) {
            $this->error ='请选择要操作的数据!';
            return false;
        }
        $map['id'] =   array('in',$id);
        $res = D('CloudCategory')->remove($map);
        if($res){
            $this->success('删除成功');
        }
    }

    /*
     * 虚拟机列表
     */
    public function cloudList()
    {
        $map = array();
        $list   = $this->lists('CloudProduct', $map,$order='level asc');
        int_to_string($list);

        if(!empty($list)){
            foreach($list as $key=>$value){
                $cate = D('CloudCategory')->detail($value['type_id']);
                $cate_name = $cate['name'];
                $list[$key]['cate_name'] = $cate_name;
                $list[$key]['is_present'] = $cate['is_present'];
            }
        }
        $this->assign('_list', $list);
        $this->meta_title = '虚拟机列表';
        $this->display();
    }

    /*
     * 新增虚拟机
     */
    public function addCloud()
    {
        $all_cate = D('CloudCategory')->order('level asc')->select();
        $this->meta_title = '新增虚拟机';
        $this->assign('all_cate', $all_cate);
        $this->display();
    }

    /*
     * 更新或新增虚拟机
     */
    public function updateCloud()
    {
        $document   =   D('CloudProduct');
        $res = $document->update();
        if(!$res){
            $this->error($document->getError());
        }else{
            $this->success($res['id']?'更新成功':'新增成功');
        }
    }

    /*
     * 编辑虚拟机
     */
    public function editCloud($id)
    {
        if(empty($id)){
            $this->error('参数不能为空！');
        }
        $info = D('CloudProduct')->detail($id);
        $price_info = M('cp_price')->where('product_id='.$info['product_id'])->find();

        $all_cate = D('CloudCategory')->order('level asc')->select();
        $this->assign('price_info', $price_info);
        $this->assign('all_cate', $all_cate);
        $this->assign('info', $info);
        $this->meta_title = '编辑虚拟机';
        $this->display();
    }

    /*
     * 删除虚拟机
     */
    public function removeCloud()
    {
        $id = array_unique((array)I('id',0));
        $id = is_array($id) ? implode(',',$id) : $id;
        if ( empty($id) ) {
            $this->error ='请选择要操作的数据!';
            return false;
        }
        $map['id'] =   array('in',$id);
        $res = D('CloudProduct')->remove($map);
        if($res){
            $this->success('删除成功');
        }
    }
    
    /*
     * 虚拟机价格列表
     */
    public function priceList()
    {
        $pid = I('pid');
        $map = array();
        if(!empty($pid)){
            $map['pid'] = $pid;
        }
        $list   = $this->lists('CpPrice', $map);
        int_to_string($list);

        if(!empty($list)){
            foreach($list as $key=>$value){
                $product_name = D('CloudProduct')->where('id='.$value['pid'])->getField('name');
                $list[$key]['product_name'] = $product_name;
            }
        }

        $this->assign('_list', $list);
        $this->meta_title = '虚拟机价格列表';
        $this->display();
    }
    
    /*
     * 虚拟机价格添加
     */
    public function addPrice()
    {
        $pid = I('pid',0);//产品id
        $all_product = D('CloudProduct')->order('level asc')->field('id,name')->select();
        if(intval($pid)>0){
            $product_id = D('CloudProduct')->where('id='.$pid)->getField('product_id');
            $this->assign('product_id', $product_id);
        }
        $this->meta_title = '新增虚拟机价格';
        $this->assign('pid', $pid);
        $this->assign('all_product', $all_product);
        $this->display();
    }
    
    /*
     * 更新或新增虚拟机价格
     */
    public function updatePrice()
    {
        $model   =   D('CpPrice');
        $pid = I('post.pid');
        $type_id = I('post.type_id');
        $id = I('post.id');
        $data = I('post.');
        //检测是否重复新增同一产品同一类型的价格信息
        if(empty($id)){
            $map['pid'] = $pid;
            $map['type_id'] = $type_id;
            $check_price = $model->where($map)->find();
            if($check_price){
                $data['id'] = $check_price['id'];//直接更新价格 防止重复
            }
        }

        $res = $model->update($data);
        if(!$res){
            $this->error($model->getError());
        }else{
            $this->success($res['id']?'更新成功':'新增成功');
        }
    }
    
    /*
     * 编辑价格
     */
    public function editPrice($id)
    {
        !$id && $this->error("缺少参数");
        $all_product = D('CloudProduct')->order('level asc')->field('id,name')->select();
        $info = D('CpPrice')->detail($id);
        $this->meta_title = '新增虚拟机价格';
        $this->assign('info', $info);
        $this->assign('all_product', $all_product);
        $this->display();
    }
    

}
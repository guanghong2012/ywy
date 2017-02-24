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
     * 删除案例
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

}
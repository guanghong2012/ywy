<?php
/**
 * Created by PhpStorm.
 * User: 温柔一刀
 * Date: 2017/2/18
 * Time: 13:40
 * 后台 客户案例控制器
 */
namespace Admin\Controller;

class CasesController extends AdminController{
    //案例分类列表
    public function index()
    {
        $map = array();
        $list   = $this->lists('Cases', $map);
        int_to_string($list);

        $this->assign('_list', $list);
        $this->meta_title = '案例分类列表';
        $this->display();
    }
    
    /*
     * 编辑分类
     */
    public function editCate($id)
    {
        if(empty($id)){
            $this->error('参数不能为空！');
        }
        $info = D('Cases')->detail($id);

        $this->assign('info', $info);
        $this->meta_title = '编辑分类';
        $this->display();
    }

    /**
     * 更新一条数据
     * @author 温柔一刀
     */
    public function updateCate(){
        $document   =   D('Cases');
        $res = $document->update();
        if(!$res){
            $this->error($document->getError());
        }else{
            $this->success($res['id']?'更新成功':'新增成功');
        }
    }

    /*
     * 新增分类
     */
    public function addCate()
    {

        $this->meta_title = '新增案例分类';
        $this->display();
    }

    /*
     * 客户案例列表
     */
    public function demoList($cate_id)
    {
        !$cate_id && $this->error('参数不能为空！');
        $info = D('Cases')->detail($cate_id);

        $map = array();
        $map['case_id'] = $cate_id;
        $list   = $this->lists('CasesDemo', $map);
        int_to_string($list);

        $this->meta_title = $info['title'].'案例列表';
        $this->assign('cate_title',$info['title']);

        $this->assign('_list', $list);
        $this->assign('cate_id',$cate_id);
        $this->display();
    }
    
    /*
     * 新增客户案例
     */
    public function addDemo($cate_id)
    {
        !$cate_id && $this->error('参数不能为空！');
        $info = D('Cases')->detail($cate_id);

        $this->meta_title = '新增'.$info['title'].'案例';
        $this->assign('cate_title',$info['title']);
        $this->assign('cate_id',$cate_id);
        $this->display();
    }
    
    /*
     * 更新或新增客户案例
     */
    public function updateDemo()
    {
        $document   =   D('CasesDemo');
        $res = $document->update();
        if(!$res){
            $this->error($document->getError());
        }else{
            $this->success($res['id']?'更新成功':'新增成功');
        }
    }
    
    /*
     * 编辑客户案例
     */
    public function editDemo($id)
    {
        if(empty($id)){
            $this->error('参数不能为空！');
        }
        $info = D('CasesDemo')->detail($id);

        $this->assign('info', $info);
        $this->meta_title = '编辑案例';
        $this->display();
    }
    
    /*
     * 删除案例
     */
    public function removeDemo()
    {
        $id = array_unique((array)I('id',0));
        $id = is_array($id) ? implode(',',$id) : $id;
        if ( empty($id) ) {
            $this->error ='请选择要操作的数据!';
            return false;
        }
        $map['id'] =   array('in',$id);
        $res = D('CasesDemo')->remove($map);
        if($res){
            $this->success('删除成功');
        }
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
        $res = D('Cases')->remove($map);
        if($res){
            $this->success('删除成功');
        }
    }
    
}
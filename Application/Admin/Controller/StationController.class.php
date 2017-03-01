<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/2/28
 * Time: 21:57
 */
namespace Admin\Controller;
class StationController extends AdminController{
    //分类列表
    public function categoryList()
    {
        $map = array();
        $list   = $this->lists('StationCategory', $map,$order='level asc');
        int_to_string($list);
        $this->assign('_list', $list);
        $this->meta_title = '模板分类列表';
        $this->display();
    }

    //新增分类
    public function addCate()
    {
        $this->meta_title = '新增模板分类';
        $this->display();
    }
    /**
     * 更新一条数据
     * @author 温柔一刀
     */
    public function updateCate(){
        $document   =   D('StationCategory');
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
        $info = D('StationCategory')->detail($id);

        $this->assign('info', $info);
        $this->meta_title = '编辑分类';
        $this->display();
    }

    /*
     * 删除分类
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
        $res = D('StationCategory')->remove($map);
        if($res){
            $this->success('删除成功');
        }
    }
    
    /*
     * 模板列表
     */
    public function templateList()
    {
        $map = array();
        $list   = $this->lists('StationTemplate', $map,$order='level asc');
        int_to_string($list);

        if(!empty($list)){
            foreach($list as $key=>$value){
                $cate = D('StationCategory')->detail($value['cate_id']);
                $cate_name = $cate['name'];
                $list[$key]['cate_name'] = $cate_name;
                $list[$key]['is_pc'] = $cate['is_pc'];
            }
        }
        $this->assign('_list', $list);
        $this->meta_title = '模板列表';
        $this->display();
    }

    /*
     * 新增模板
     */
    public function addTemplate()
    {
        $all_cate = D('StationCategory')->order('level asc')->select();
        //获取新的模板id
        $template_id = D('StationTemplate')->getTemplateId();
        $this->meta_title = '新增模板';
        $this->assign('template_id', $template_id);
        $this->assign('all_cate', $all_cate);
        $this->display();
    }
    /*
     * 更新或新增模板
     */
    public function updateTemplate()
    {
        $document   =   D('StationTemplate');
        $res = $document->update();
        if(!$res){
            $this->error($document->getError());
        }else{
            $this->success($res['id']?'更新成功':'新增成功');
        }
    }
    /*
     * 编辑模板
     */
    public function editTemplate($id)
    {
        if(empty($id)){
            $this->error('参数不能为空！');
        }
        $info = D('StationTemplate')->detail($id);


        $all_cate = D('StationCategory')->order('level asc')->select();
        $this->assign('all_cate', $all_cate);
        $this->assign('info', $info);
        $this->meta_title = '编辑模板';
        $this->display();
    }


}
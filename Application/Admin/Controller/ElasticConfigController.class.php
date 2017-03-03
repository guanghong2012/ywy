<?php
/**
 * Created by PhpStorm.
 * User: 温柔一刀
 * Date: 2017/3/3
 * Time: 10:39
 */
namespace Admin\Controller;
class ElasticConfigController extends AdminController{
    public function index()
    {
        $config = M('elastic_config')->find(1);
        $this->meta_title = '弹性云主机基本配置';
        $this->assign('info',$config);
        $this->display();
    }

    //更新配置
    public function updateConfig()
    {
        $data = I('post.');
        $model = M('elastic_config');
        $res = $model->where('id=1')->save($data);
        if($res){
            $this->success('保存成功！');
        }

    }
    
    /*
     * 操作系统列表
     */
    public function osList()
    {
        $name = I('name');
        $map = array();
        if(!empty($name)){
            $map['name'] = array("like","%".$name."%");
        }
        $list   = $this->lists('ElasticOsconfig', $map,$order='id asc');
        int_to_string($list);
        $this->assign('_list', $list);
        $this->meta_title = '操作系统列表';
        $this->display();
    }
    
    /*
     * 新增操作系统
     */
    public function addOs()
    {
        $this->meta_title = '新增操作系统';
        $this->display();
    }
    /*
     * 编辑操作系统
     */
    public function editOs()
    {
        $id = I('get.id');
        !$id && $this->error('缺少参数');
        $info = M('ElasticOsconfig')->find($id);

        $this->meta_title = '编辑操作系统';
        $this->assign('info',$info);
        $this->display();
    }
    
    /*
     * 更新操作系统
     */
    public function updateOs()
    {
        $data = I('post.');
        if(empty($data['id'])){
            $res = M('elastic_osconfig')->add($data);
        }else{
            $res = M('elastic_osconfig')->save($data);
        }
        if($res){
            $this->success(empty($data['id']) ? '新增成功！' : '保存成功！');
        }
    }
    /*
     * 删除操作系统
     */
    public function removeOs()
    {
        $id = array_unique((array)I('id',0));
        $id = is_array($id) ? implode(',',$id) : $id;
        if ( empty($id) ) {
            $this->error ='请选择要操作的数据!';
            return false;
        }
        $map['id'] =   array('in',$id);
        $res = M('elastic_osconfig')->where($map)->delete();
        if($res){
            $this->success('删除成功');
        }

    }

    /*
     * 线路列表
     */
    public function lineList()
    {
        $name = I('name');
        $map = array();
        if(!empty($name)){
            $map['name'] = array("like","%".$name."%");
        }
        $list   = $this->lists('ElasticLine', $map,$order='id asc');
        int_to_string($list);
        $this->assign('_list', $list);
        $this->meta_title = '线路列表';
        $this->display();
    }
    /*
     * 新增线路
     */
    public function addLine()
    {
        $this->meta_title = '新增线路';
        $this->display();
    }
    /*
     * 编辑线路
     */
    public function editLine()
    {
        $id = I('get.id');
        !$id && $this->error('缺少参数');
        $info = M('ElasticLine')->find($id);

        $this->meta_title = '编辑线路';
        $this->assign('info',$info);
        $this->display();
    }

    /*
     * 更新线路
     */
    public function updateLine()
    {
        $data = I('post.');
        if(empty($data['id'])){
            $res = M('ElasticLine')->add($data);
        }else{
            $res = M('ElasticLine')->save($data);
        }
        if($res){
            $this->success(empty($data['id']) ? '新增成功！' : '保存成功！');
        }
    }
    /*
     * 删除操作系统
     */
    public function removeLine()
    {
        $id = array_unique((array)I('id',0));
        $id = is_array($id) ? implode(',',$id) : $id;
        if ( empty($id) ) {
            $this->error ='请选择要操作的数据!';
            return false;
        }
        $map['id'] =   array('in',$id);
        $res = M('ElasticLine')->where($map)->delete();
        if($res){
            $this->success('删除成功');
        }

    }
    /*
     * 服务标准列表
     */
    public function serviceList()
    {
        $name = I('name');
        $map = array();
        if(!empty($name)){
            $map['name'] = array("like","%".$name."%");
        }
        $list   = $this->lists('ElasticService', $map,$order='id asc');
        int_to_string($list);
        $this->assign('_list', $list);
        $this->meta_title = '服务标准列表';
        $this->display();
    }
    /*
     * 新增服务标准
     */
    public function addService()
    {
        $this->meta_title = '新增服务标准';
        $this->display();
    }
    /*
     * 编辑服务标准
     */
    public function editService()
    {
        $id = I('get.id');
        !$id && $this->error('缺少参数');
        $info = M('ElasticService')->find($id);

        $this->meta_title = '编辑服务标准';
        $this->assign('info',$info);
        $this->display();
    }
    /*
     * 更新服务标准
     */
    public function updateService()
    {
        $data = I('post.');
        if(empty($data['id'])){
            $res = M('ElasticService')->add($data);
        }else{
            $res = M('ElasticService')->save($data);
        }
        if($res){
            $this->success(empty($data['id']) ? '新增成功！' : '保存成功！');
        }
    }
    /*
     * 删除服务标准
     */
    public function removeService()
    {
        $id = array_unique((array)I('id',0));
        $id = is_array($id) ? implode(',',$id) : $id;
        if ( empty($id) ) {
            $this->error ='请选择要操作的数据!';
            return false;
        }
        $map['id'] =   array('in',$id);
        $res = M('ElasticService')->where($map)->delete();
        if($res){
            $this->success('删除成功');
        }

    }


    
}
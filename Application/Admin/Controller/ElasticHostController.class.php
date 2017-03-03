<?php
/**
 * Created by PhpStorm.
 * User: 温柔一刀
 * Date: 2017/3/3
 * Time: 14:27
 * 弹性云主机控制器
 */
namespace Admin\Controller;
class ElasticHostController extends AdminController{
    //主机列表
    public function index()
    {
        $name = I('name');
        $map = array();
        if(!empty($name)){
            $map['name'] = array("like","%".$name."%");
        }
        $list   = $this->lists('ElasticHost', $map,$order='id asc');
        int_to_string($list);
        $this->assign('_list', $list);
        $this->meta_title = '弹性云主机列表';
        $this->display();
    }
    /*
     * 新增主机
     */
    public function add()
    {
        $elastic_config = M('elastic_config')->where('id=1')->find();
        $this->meta_title = '新增弹性云主机';
        $this->assign('elastic_config', $elastic_config);
        $this->display();
    }
    /*
     * 编辑主机
     */
    public function edit()
    {
        $id = I('get.id');
        !$id && $this->error('缺少参数');
        $elastic_config = M('elastic_config')->where('id=1')->find();
        $info = M('ElasticHost')->find($id);

        $this->meta_title = '编辑服务标准';
        $this->assign('elastic_config', $elastic_config);
        $this->assign('info',$info);
        $this->display();
    }
    /*
     * 更新服务标准
     */
    public function update()
    {
        $data = I('post.');
        if(empty($data['id'])){
            $res = M('ElasticHost')->add($data);
        }else{
            $res = M('ElasticHost')->save($data);
        }
        if($res){
            $this->success(empty($data['id']) ? '新增成功！' : '保存成功！');
        }
    }


}
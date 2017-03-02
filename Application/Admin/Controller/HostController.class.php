<?php
/**
 * Created by PhpStorm.
 * User: 温柔一刀
 * Date: 2017/3/2
 * Time: 10:02
 * 云服务端控制器
 */
namespace Admin\Controller;
class HostController extends AdminController{
    //套餐云主机列表
    public function packageHostList()
    {
        $map = array();
        $list   = $this->lists('PackageHost', $map,$order='level asc');
        int_to_string($list);
        $this->assign('_list', $list);
        $this->meta_title = '套餐云主机列表';
        $this->display();
    }
    /*
     * 新增套餐云主机
     */
    public function addPackageHost()
    {
        $this->meta_title = '新增套餐云主机';
        $this->display();
    }

    /**
     * 更新套餐云主机
     * @author 温柔一刀
     */
    public function updatePackageHost(){
        $data = I('post.');
        $document   =   D('PackageHost');
        $res = $document->update($data);
        if(!$res){
            $this->error($document->getError());
        }else{
            $this->success($res['id']?'更新成功':'新增成功');
        }
    }

    /*
     * 编辑套餐云主机
     */
    public function editPackageHost($id)
    {
        if(empty($id)){
            $this->error('参数不能为空！');
        }
        $info = D('PackageHost')->detail($id);

        $this->assign('info', $info);
        $this->meta_title = '编辑套餐云主机';
        $this->display();
    }
    /*
     * 删除套餐云主机
     */
    public function removePackageHost()
    {
        $id = array_unique((array)I('id',0));
        $id = is_array($id) ? implode(',',$id) : $id;
        if ( empty($id) ) {
            $this->error ='请选择要操作的数据!';
            return false;
        }
        $map['id'] =   array('in',$id);
        $res = D('PackageHost')->remove($map);
        if($res){
            $this->success('删除成功');
        }
    }

}
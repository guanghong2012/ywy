<?php
/**
 * Created by PhpStorm.
 * User: 温柔一刀
 * Date: 2017/3/8
 * Time: 10:08
 */
namespace Admin\Controller;
class WorkSheetController extends AdminController{
    //工单列表
    public function index()
    {
        $map = array();
        $list   = $this->lists('user_worksheet', $map,$order='create_time desc');
        int_to_string($list);

        $this->assign('_list', $list);
        $this->meta_title = '工单列表';
        $this->display();
    }
    /*
     * 工单详情
     */
    public function info($id)
    {
        $id = (int)$id;
        !$id && $this->error("缺少参数");
        $info = M('user_worksheet')->find($id);
        if(!empty($info['images'])){
            $info['images'] = json_decode($info['images'],true);
        }
        $this->assign('info', $info);
        $this->meta_title = '工单详情';
        $this->display();
    }
    /*
     * 咨询列表
     */
    public function chactList($id)
    {
        $id = (int)$id;
        !$id && $this->error("缺少参数");
        $worksheet = M('user_worksheet')->find($id);
        $map = array();
        $map['sheet_id'] = $id;
        $list = M('worksheet_chact')->where($map)->select();

        // 记录当前列表页的cookie
        Cookie('__forward__',$_SERVER['REQUEST_URI']);
        $this->assign('_list', $list);
        $this->assign('worksheet', $worksheet);
        $this->meta_title = '咨询列表';
        $this->display();
    }
    /*
     * 回复咨询
     */
    public function reply()
    {
        if(IS_POST){
            $data = I('post.');
            if(empty($data['content'])){
                $this->error("请填写回复内容");
            }
            $reply = array(
                'sheet_id' => $data['sheet_id'],
                'from' => $data['from'],
                'create_time' => time(),
                'content' => $data['content'],
            );
            $res = M('worksheet_chact')->add($reply);
            if($res){
                $this->success("回复成功！");
            }else{
                $this->error("回复失败");
            }

        }else{
            $id = (int)I('get.id');
            !$id && $this->error("缺少参数");
            $worksheet = M('user_worksheet')->find($id);

            $this->assign('worksheet',$worksheet);
            $this->assign('id',$id);
            $this->meta_title = '回复咨询';
            $this->display();
        }
    }
    /*
     * 查看咨询
     */
    public function viewChact($id)
    {
        $id = (int)$id;
        !$id && $this->error("缺少参数");
        $info = M('worksheet_chact')->find($id);
        if(!empty($info['images'])){
            $info['images'] = json_decode($info['images'],true);
        }
        $worksheet = M('user_worksheet')->find($info['sheet_id']);

        $this->assign('worksheet',$worksheet);
        $this->assign('info',$info);
        $this->meta_title = '查看回复/咨询';
        $this->display();
    }
    /*
     * 更新工单
     */
    public function updateSheet()
    {
        $data = I('post.');
        $id = $data['id'];
        $info = M('user_worksheet')->find($id);
        $status = $data['status'];
        if($status != $info['status'] && $status==2){
            $up['status'] = 2;
            $up['end_time'] = time();
            $res = M('user_worksheet')->where('id='.$id)->save($up);
            $res && $this->success("更新成功！");
        }else{
            $this->error("没有更新任何信息！");
        }

    }


}
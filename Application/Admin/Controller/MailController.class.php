<?php
/**
 * Created by PhpStorm.
 * User: 温柔一刀
 * Date: 2017/3/20
 * Time: 11:33
 * 全球邮产品配置
 */
namespace Admin\Controller;
class MailController extends AdminController{
    //列表
    public function index()
    {
        $map = array();
        $list   = $this->lists('Mail', $map,$order='id asc');
        int_to_string($list);
        $this->assign('_list', $list);
        $this->meta_title = '邮局产品列表';
        $this->display();
    }
    /*
     * 编辑
     */
    public function editMail()
    {
        $id = (int)I('id');
        if(empty($id)){
            $this->error('参数不能为空！');
        }
        $info = M('Mail')->find($id);

        $this->assign('info', $info);
        $this->meta_title = '编辑邮局产品';
        $this->display('Mail/edit');
    }
    
    /*
     * 更新
     */
    public function update()
    {
        if(IS_POST){
            $data = I('post.');
            $id = (int)$data['id'];
            if(!$id){
                $this->error('id参数不能为空！');
            }
            $up['price'] = $data['price'];
            $up['extra_price'] = $data['extra_price'];
            $res = M('Mail')->where('id='.$id)->save($up);
            if($res){
                $this->success("更新成功！");
            }else{
                $this->error("没有修改任何东西！");
            }
        }
    }
    
}
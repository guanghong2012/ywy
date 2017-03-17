<?php
/**
 * Created by PhpStorm.
 * User: 温柔一刀
 * Date: 2017/3/17
 * Time: 16:13
 */
namespace Admin\Controller;
use User\Api\UserlogApi;

class CashController extends AdminController{
    public function index()
    {
        $map = array();
        $keywords = I('keywords');
        if(!empty($keywords)){
            $map['name|username']=   array($keywords,array('like','%'.$keywords.'%'),'_multi'=>true);
        }

        $list   = $this->lists('tixian_log', $map,$order='create_time desc');
        int_to_string($list);

        $this->assign('_list', $list);
        $this->meta_title = '提现申请列表';
        $this->display();
    }

    /*
     * 查看
     */
    public function view($id)
    {
        $id = (int)$id;
        !$id && $this->error('缺少参数');
        $info = M('tixian_log')->find($id);

        $this->meta_title = '查看提现申请';
        $this->assign('info',$info);
        $this->display();
    }
    /*
     * 审核申请
     */
    public function checkApply()
    {
        if(IS_POST){
            $data = I('post.');
            $status = $data['status'];
            $desc = $data['desc'];
            $id = $data['id'];
            $info = M('tixian_log')->find($id);
            if(empty($desc)){
                $this->error("请输入审核备注！");
            }
            if($info['status']>0){
                $this->error("该申请已经审核过了！");
            }
            if($status>0 && $info['status']==0){
                //更新审核信息
                $up['pay_time'] = time();
                $up['status'] = $status;
                $up['desc'] = $desc;
                $res = M('tixian_log')->where('id='.$id)->save($up);
                if($status==1 && $res){
                    //减少用户资金
                    $UserAccountLog = new UserlogApi();
                    $rs = $UserAccountLog->reduceMoney($info['uid'],$info['money'],'提现减少',$_SESSION['onethink_admin']['user_auth']['uid'],3);
                    $rs && $this->success("审核成功");
                }
                if($status==2 && $res){
                    $this->success("审核成功");
                }

            }

        }
    }

}
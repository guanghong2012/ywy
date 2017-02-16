<?php
/**
 * Created by PhpStorm.
 * User: 温柔一刀
 * Date: 2017/2/16
 * Time: 10:41
 */
namespace Admin\Model;
use Think\Model;
use User\Model\CuserModel;
/**
 * 会员自己明细模型
 */
class UserAccountLogModel extends Model{

    /* 自动完成规则 */
    protected $_auto = array(
        array('create_time', NOW_TIME),
    );

    //增加用户金额
    public function addMoney($uid,$money,$desc='管理员调节',$admin_id=0)
    {
        /* 获取用户数据 */
        $User = new CuserModel();

        $userinfo = $User->info($uid);
        if(is_numeric($money)){
            if($money<0){
                $this->error = '请输入大于0的数！';
                return false;
            }
            $update_account = $userinfo['account'] + $money;
            $data['account'] = $update_account;
            $up = $User->updateUserField($uid,$data);
            if($up){
                $array = array(
                    'money' => $money,
                    'create_time' => NOW_TIME,
                    'desc' => $desc,
                    'uid' => $uid,
                    'admin_id' => $admin_id
                    //'admin_id' => $_SESSION['onethink_admin']['user_auth']['uid'],
                );
                if($this->create($array)){
                    $insertid = $this->add();
                    return $insertid ;
                }

            }
        }

    }

    /*
     * 减少用户金额
     */
    public function reduceMoney($uid,$money,$desc='管理员调节',$admin_id=0)
    {
        /* 获取用户数据 */
        $User = new CuserModel();
        $userinfo = $User->info($uid);
        if(is_numeric($money)){
            if($money<0){
                $update_account = $userinfo['account'] + $money;
            }else{
                $update_account = $userinfo['account'] - $money;
            }

            $data['account'] = $update_account;
            $up = $User->updateUserField($uid,$data);
            if($up){
                $array = array(
                    'money' => $money>0 ? -$money : $money,
                    'create_time' => NOW_TIME,
                    'desc' => $desc,
                    'uid' => $uid,
                    'admin_id' => $admin_id,
                );
                if($this->create($array)){
                    $insertid = $this->add();
                    return $insertid;
                }

            }
        }
    }

}
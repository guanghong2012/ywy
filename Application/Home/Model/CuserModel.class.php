<?php
/**
 * Created by PhpStorm.
 * User: 温柔一刀
 * Date: 2017/2/19
 * Time: 19:20
 * 用户模型
 */
namespace Home\Model;
use Think\Model;
use User\Api\CuserApi;

class CuserModel extends Model{
    /* 用户模型自动完成 */
    protected $_auto = array(
        array('login', 0, self::MODEL_INSERT),
        array('reg_ip', 'get_client_ip', self::MODEL_INSERT, 'function', 1),
        array('reg_time', NOW_TIME, self::MODEL_INSERT),
        array('last_login_ip', 0, self::MODEL_INSERT),
        array('last_login_time', 0, self::MODEL_INSERT),
        array('status', 1, self::MODEL_INSERT),
    );

    /*
     * 用户登录
     */
    public function login($uid)
    {
        /* 检测是否在当前应用注册 */
        $user = $this->field(true)->find($uid);
        if(!$user){ //未注册
            $this->error = '前台用户信息注册失败，请重试！';
            return false;
        } elseif(1 != $user['status']) {
            $this->error = '用户未激活或已禁用！'; //应用级别禁用
            return false;
        }

        /* 登录用户 */
        $this->autoLogin($user);

        //记录行为
        action_log('user_login', 'cuser', $uid, $uid);

        return true;
    }

    /**
     * 自动登录用户
     * @param  integer $user 用户信息数组
     */
    private function autoLogin($user){
        /* 更新登录信息 */
        $data = array(
            'id'             => $user['id'],
            'login'           => array('exp', '`login`+1'),
            'last_login_time' => NOW_TIME,
            'last_login_ip'   => get_client_ip(1),
        );
        $this->save($data);

        /* 记录登录SESSION和COOKIES */
        $auth = array(
            'id'             => $user['id'],
            //'username'        => get_username($user['uid']),
            'username'        => $user['username'],
            'email'        => $user['email'],
            'mobile'        => $user['mobile'],
            'account'        => $user['account'],
            'last_login_time' => $user['last_login_time'],
        );

        session('user_auth', $auth);
        session('user_auth_sign', data_auth_sign($auth));

    }

    /**
     * 注销当前用户
     * @return void
     */
    public function logout(){
        session('user_auth', null);
        session('user_auth_sign', null);
    }

    /**
     * 获取用户信息
     * @param  string  $uid         用户ID或用户名
     * @param  boolean $is_username 是否使用用户名查询
     * @return array                用户信息
     */
    public function info($uid, $is_username = false){
        $map = array();
        if($is_username){ //通过用户名获取
            $map['username'] = $uid;
        } else {
            $map['id'] = $uid;
        }

        $user = $this->where($map)->field(true)->find();
        if(is_array($user) && $user['status'] = 1){
            return $user;
            //return array($user['id'], $user['username'], $user['email'], $user['mobile']);
        } else {
            return -1; //用户不存在或被禁用
        }
    }

    /*
     * 更新用户单个字段信息
     */
    public function updateUserField($uid,$data)
    {
        if(empty($uid)  || empty($data)){
            $this->error = '没有修改任何信息！';
            return false;
        }
        //更新用户信息
        $data = $this->create($data);
        if($data){
            return $this->where(array('id'=>$uid))->save($data);
        }
        return false;
    }

}
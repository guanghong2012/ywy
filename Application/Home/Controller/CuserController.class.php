<?php
/**
 * Created by PhpStorm.
 * User: 温柔一刀
 * Date: 2017/2/19
 * Time: 18:47
 */
namespace Home\Controller;

use User\Api\CuserApi;

class CuserController extends HomeController{
    public function _initialize()
    {
        parent::_initialize();
        if(!in_array(ACTION_NAME,array('login','logout','verify','register'))){
            $this->is_login();
        }

    }
    //用户首页
    public function index()
    {
        print_r(session('user_auth'));
        $this->display();
    }
    
    /*
     * 用户登录
     */
    public function login($username = '', $password = '', $verify = '')
    {
        if(IS_POST){ //登录验证
            if(!$username){
                $this->error('请输入用户名！');
            }
            if(!$password){
                $this->error('请输入密码！');
            }

            /* 检测验证码 */
            if(!check_verify($verify)){
                $this->error('验证码输入错误！');
            }

            /* 调用UC登录接口登录 */
            $user = new CuserApi();
            if(!empty($username)){
                $type = 1;//默认用户名验证登录
                if(check_email($username)){
                    $type = 2;//邮箱验证登录
                }
                if(check_mobile($username)){
                    $type = 3;//手机验证登录
                }
            }
            $uid = $user->login($username, $password,$type);
            if(0 < $uid){ //UC登录成功
                /* 登录用户 */
                $Cuser = D('Cuser');
                if($Cuser->login($uid)){ //登录用户
                    //TODO:跳转到登录前页面
                    $this->success('登录成功！',U('Home/Cuser/index'));
                } else {
                    $this->error($Cuser->getError());
                }

            } else { //登录失败
                switch($uid) {
                    case -1: $error = '用户不存在或被禁用！'; break; //系统级别禁用
                    case -2: $error = '密码错误！'; break;
                    default: $error = '未知错误！'; break; // 0-接口参数错误（调试阶段使用）
                }
                $this->error($error);
            }

        } else { //显示登录表单
            $this->display();
        }
    }

    /* 退出登录 */
    public function logout(){
        if(!empty(session('user_auth'))){
            D('Cuser')->logout();
            $this->success('退出成功！', U('Cuser/login'));
        } else {
            $this->redirect('Cuser/login');
        }
    }

    /* 验证码，用于登录和注册 */
    public function verify(){
        $verify = new \Think\Verify();
        $verify->entry(1);
    }
    
    /*
     * 密码修改
     */
    public function password()
    {
        $user = session('user_auth');
        if(!$user){
            $this->error( '您还没有登陆',U('Cuser/login') );
        }

        if(IS_POST){

            //获取参数
            $uid        =   $user['id'];
            $password   =   I('post.old');
            $repassword = I('post.repassword');
            $data['password'] = I('post.password');
            empty($password) && $this->error('请输入原密码');
            empty($data['password']) && $this->error('请输入新密码');
            empty($repassword) && $this->error('请输入确认密码');

            if($data['password'] !== $repassword){
                $this->error('您输入的新密码与确认密码不一致');
            }
            $Api = new CuserApi();
            $res = $Api->updateInfo($uid,$password,$data);
            if($res['status']){
                $this->success('修改密码成功！');
            }else{
                $this->error($res['info']);
            }
        }else{

            $this->display();
        }

    }
    
    /*
     * 注册页面
     */
    public function register($username = '', $password = '', $repassword = '', $email = '',$mobile='',$address='', $verify = '')
    {
        if(!C('USER_ALLOW_REGISTER')){
            $this->error('注册已关闭');
        }
        if(IS_POST){ //注册用户
            /* 检测验证码 */

            if(!check_verify($verify,1)){
                $this->error('验证码输入错误！');
            }

            /* 检测密码 */
            if($password != $repassword){
                $this->error('密码和重复密码不一致！');
            }

            /* 调用注册接口注册用户 */
            $User = new CuserApi();
            $uid = $User->register($username, $password, $email,$mobile,$address);
            if(0 < $uid){ //注册成功
                //TODO: 发送验证邮件
                $this->success('注册成功！',U('login'));
            } else { //注册失败，显示错误信息
                $this->error($this->showRegError($uid));
            }

        } else { //显示注册表单
            $this->display();
        }
    }

    /**
     * 获取用户注册错误信息
     * @param  integer $code 错误编码
     * @return string        错误信息
     */
    private function showRegError($code = 0){
        switch ($code) {
            case -1:  $error = '用户名长度必须在16个字符以内！'; break;
            case -2:  $error = '用户名被禁止注册！'; break;
            case -3:  $error = '用户名被占用！'; break;
            case -4:  $error = '密码长度必须在6-30个字符之间！'; break;
            case -5:  $error = '邮箱格式不正确！'; break;
            case -6:  $error = '邮箱长度必须在1-32个字符之间！'; break;
            case -7:  $error = '邮箱被禁止注册！'; break;
            case -8:  $error = '邮箱被占用！'; break;
            case -9:  $error = '手机格式不正确！'; break;
            case -10: $error = '手机被禁止注册！'; break;
            case -11: $error = '手机号被占用！'; break;
            default:  $error = '未知错误';
        }
        return $error;
    }

    /*
     * 修改资料
     */
    public function profile($username='')
    {
        $user = session('user_auth');
        $uid = $user['id'];
        $Api = new CuserApi();
        $info = $Api->info($uid);

        if(IS_POST){
            $data = I('post.');
            if($data['username'] == $info['username']){
                unset($data['username']);
            }else{
                //校验用户名
                if(empty($data['username'])){
                    $this->error('用户名不能为空！');
                }
            }

            if($data['email'] == $info['email']){
                unset($data['email']);
            }else{
                //校验邮箱
                if(empty($data['email'])){
                    $this->error('邮箱不能为空！');
                }
            }

            if($data['mobile'] == $info['mobile']){
                unset($data['mobile']);
            }else{
                //校验手机
                if(empty($data['mobile'])){
                    $this->error('手机号码不能为空！');
                }
            }

            if($data['address'] == $info['address']){
                unset($data['address']);
            }else{
                //校验地址
                if(empty($data['address'])){
                    $this->error('地址不能为空！');
                }
            }

            $res = $Api->updateInfo1($uid,$password='',$data);
            if($res['status']){
                $this->success('修改密码成功！');
            }else{
                $this->error($res['info']);
            }
            //print_r($_POST);
        }else{

            $this->assign('user',$info);
            $this->display();
        }
    }

    /*
     * 资金明细
     */
    public function account_log()
    {
        $user = session('user_auth');
        $uid = $user['id'];
        $Api = new CuserApi();
        $info = $Api->info($uid);

        $keywords = I('get.keywords');//关键字
        $start = I('get.start');//搜索开始时间
        $end = I('get.end');

        $map = array();
        $map['uid'] = $uid;

        if(!empty($keywords)){
            $map['desc'] = array("like",'%'.$keywords.'%');
        }
        if(!empty($start) && !empty($end)){
            //加入时间搜索
            $map['create_time'] = array("between",array(strtotime($start),strtotime($end)));
        }

        $count      = D('user_account_log')->where($map)->count();// 查询满足要求的总记录数
        $Page       = new \Think\Page2($count,2);// 实例化分页类 传入总记录数和每页显示的记录数(25)
        $show       = $Page->show();// 分页显示输出
// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
        $list = D('user_account_log')->where($map)->order('create_time desc')->limit($Page->firstRow.','.$Page->listRows)->select();
        $this->assign('list',$list);// 赋值数据集
        $this->assign('page',$show);// 赋值分页输出

        $this->assign('info',$info);
        $this->display();
    }

    /*
     * 充值记录
     */
    public function charge_log()
    {
        $user = session('user_auth');
        $uid = $user['id'];
        $Api = new CuserApi();
        $info = $Api->info($uid);

        $keywords = I('get.keywords');//关键字
        $start = I('get.start');//搜索开始时间
        $end = I('get.end');

        $map = array();
        $map['uid'] = $uid;
        $map['type'] = 1;//1=充值2=消费或后台调节3=提现
        if(!empty($keywords)){
            $map['desc'] = array("like",'%'.$keywords.'%');
        }
        if(!empty($start) && !empty($end)){
            //加入时间搜索
            $map['create_time'] = array("between",array(strtotime($start),strtotime($end)));
        }

        $count      = D('user_account_log')->where($map)->count();// 查询满足要求的总记录数
        $Page       = new \Think\Page2($count,2);// 实例化分页类 传入总记录数和每页显示的记录数(25)
        $show       = $Page->show();// 分页显示输出
// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
        $list = D('user_account_log')->where($map)->order('create_time desc')->limit($Page->firstRow.','.$Page->listRows)->select();
        $this->assign('list',$list);// 赋值数据集
        $this->assign('page',$show);// 赋值分页输出

        $this->assign('info',$info);
        $this->display();
    }

    /*
     * 提现记录
     */
    public function withdraw_log()
    {
        $user = session('user_auth');
        $uid = $user['id'];
        $Api = new CuserApi();
        $info = $Api->info($uid);

        $keywords = I('get.keywords');//关键字
        $start = I('get.start');//搜索开始时间
        $end = I('get.end');

        $map = array();
        $map['uid'] = $uid;
        $map['type'] = 3;//1=充值2=消费或后台调节3=提现
        if(!empty($keywords)){
            $map['desc'] = array("like",'%'.$keywords.'%');
        }
        if(!empty($start) && !empty($end)){
            //加入时间搜索
            $map['create_time'] = array("between",array(strtotime($start),strtotime($end)));
        }

        $count      = D('user_account_log')->where($map)->count();// 查询满足要求的总记录数
        $Page       = new \Think\Page2($count,2);// 实例化分页类 传入总记录数和每页显示的记录数(25)
        $show       = $Page->show();// 分页显示输出
// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
        $list = D('user_account_log')->where($map)->order('create_time desc')->limit($Page->firstRow.','.$Page->listRows)->select();
        $this->assign('list',$list);// 赋值数据集
        $this->assign('page',$show);// 赋值分页输出

        $this->assign('info',$info);
        $this->display();
    }

}
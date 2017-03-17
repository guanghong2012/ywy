<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Admin\Controller;
use User\Api\CuserApi;
use User\Api\UserlogApi;


/**
 * 后台用户控制器
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
class CuserController extends AdminController {

    /**
     * 用户管理首页
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function index(){
        $username       =   I('username');
        $map['status']  =   array('egt',0);
        if(is_numeric($username)){
            $map['id|username']=   array(intval($username),array('like','%'.$username.'%'),'_multi'=>true);
        }else{
            $map['username']    =   array('like', '%'.(string)$username.'%');
        }

        $list   = $this->lists('Cuser', $map);
        int_to_string($list);
        $this->assign('_list', $list);
        $this->meta_title = '用户列表';
        $this->display();
    }

    /**
     * 修改昵称初始化
     * @author huajie <banhuajie@163.com>
     */
    public function updateNickname(){
        $nickname = M('Cuser')->getFieldByUid(UID, 'nickname');
        $this->assign('nickname', $nickname);
        $this->meta_title = '修改昵称';
        $this->display('updatenickname');
    }

    /**
     * 修改昵称提交
     * @author huajie <banhuajie@163.com>
     */
    public function submitNickname(){
        //获取参数
        $nickname = I('post.nickname');
        $password = I('post.password');
        empty($nickname) && $this->error('请输入昵称');
        empty($password) && $this->error('请输入密码');

        //密码验证
        $User   =   new CuserApi();
        $uid    =   $User->login(UID, $password, 4);
        ($uid == -2) && $this->error('密码不正确');

        $Member =   D('Member');
        $data   =   $Member->create(array('nickname'=>$nickname));
        if(!$data){
            $this->error($Member->getError());
        }

        $res = $Member->where(array('uid'=>$uid))->save($data);

        if($res){
            $user               =   session('user_auth');
            $user['username']   =   $data['nickname'];
            session('user_auth', $user);
            session('user_auth_sign', data_auth_sign($user));
            $this->success('修改昵称成功！');
        }else{
            $this->error('修改昵称失败！');
        }
    }

    /**
     * 修改密码初始化
     * @author huajie <banhuajie@163.com>
     */
    public function updatePassword(){
        $this->meta_title = '修改密码';
        $this->display('updatepassword');
    }

    /**
     * 修改密码提交
     * @author huajie <banhuajie@163.com>
     */
    public function submitPassword(){
        //获取参数
        $password   =   I('post.old');
        empty($password) && $this->error('请输入原密码');
        $data['password'] = I('post.password');
        empty($data['password']) && $this->error('请输入新密码');
        $repassword = I('post.repassword');
        empty($repassword) && $this->error('请输入确认密码');

        if($data['password'] !== $repassword){
            $this->error('您输入的新密码与确认密码不一致');
        }

        $Api    =   new CuserApi();
        $res    =   $Api->updateInfo(UID, $password, $data);
        if($res['status']){
            $this->success('修改密码成功！');
        }else{
            $this->error($res['info']);
        }
    }

    /**
     * 用户行为列表
     * @author huajie <banhuajie@163.com>
     */
    public function action(){
        //获取列表数据
        $Action =   M('Action')->where(array('status'=>array('gt',-1)));
        $list   =   $this->lists($Action);
        int_to_string($list);
        // 记录当前列表页的cookie
        Cookie('__forward__',$_SERVER['REQUEST_URI']);

        $this->assign('_list', $list);
        $this->meta_title = '用户行为';
        $this->display();
    }

    /**
     * 新增行为
     * @author huajie <banhuajie@163.com>
     */
    public function addAction(){
        $this->meta_title = '新增行为';
        $this->assign('data',null);
        $this->display('editaction');
    }

    /**
     * 编辑行为
     * @author huajie <banhuajie@163.com>
     */
    public function editAction(){
        $id = I('get.id');
        empty($id) && $this->error('参数不能为空！');
        $data = M('Action')->field(true)->find($id);

        $this->assign('data',$data);
        $this->meta_title = '编辑行为';
        $this->display('editaction');
    }

    /**
     * 更新行为
     * @author huajie <banhuajie@163.com>
     */
    public function saveAction(){
        $res = D('Action')->update();
        if(!$res){
            $this->error(D('Action')->getError());
        }else{
            $this->success($res['id']?'更新成功！':'新增成功！', Cookie('__forward__'));
        }
    }

    /**
     * 会员状态修改
     * @author 朱亚杰 <zhuyajie@topthink.net>
     */
    public function changeStatus($method=null){
        $id = array_unique((array)I('id',0));

        $id = is_array($id) ? implode(',',$id) : $id;
        if ( empty($id) ) {
            $this->error('请选择要操作的数据!');
        }
        $map['uid'] =   array('in',$id);
        switch ( strtolower($method) ){
            case 'forbiduser':
                $this->forbid('Cuser', $map );
                break;
            case 'resumeuser':
                $this->resume('Cuser', $map );
                break;
            case 'deleteuser':
                $this->delete('Cuser', $map );
                break;
            default:
                $this->error('参数非法');
        }
    }

    public function add($username = '', $password = '', $repassword = '', $email = '',$mobile='',$address=''){
        if(IS_POST){
            /* 检测密码 */
            if($password != $repassword){
                $this->error('密码和重复密码不一致！');
            }

            /* 调用注册接口注册用户 */
            $User   =   new CuserApi();
            $uid    =   $User->register($username, $password, $email,$mobile,$address);
            if(0 < $uid){ //注册成功

                if(!$uid){
                    $this->error('用户添加失败！');
                } else {
                    $this->success('用户添加成功！',U('index'));
                }
            } else { //注册失败，显示错误信息
                $this->error($this->showRegError($uid));
            }
        } else {

            $this->meta_title = '新增用户';
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
     * 会员信息编辑
     *
     */
    public function edit($id)
    {
        /* 调用注册接口编辑用户 */
        $User = new CuserApi();
        if(IS_POST){
            $id = I('post.id');
            $password = I('post.password');
            $repassword = I('post.repassword');
            if(!empty($password)){
                if($repassword != $password){
                    $this->error('两次输入密码不一致！');
                }
            }
            $data = I('post.');
            unset($data['password']);
            unset($data['repassword']);
            if($data){
                $res = $User->updateInfo1($id,$password,$data);
                if($res['status']){
                    $this->success("修改成功！");
                }
            }
        }else{
            !$id && $this->error('请选择要编辑的用户！');

            $info = $User->info($id);
            if(!$info){
                $this->error('用户不存在！');
            }
            $this->assign('info',$info);
            $this->meta_title = '编辑用户';
            $this->display();
        }
    }

    /*
     * 用户资金调节
     */
    public function changeAccount()
    {
        if(IS_POST){
            $money = I('post.money');
            $type = I('post.type');
            $uid = I('post.uid');
            $desc = I('post.desc');
            if(!is_numeric($money)){
                $this->error("请输入数字！");
            }
            $UserAccountLog = new UserlogApi();
            switch($type){
                case 1:
                    //增加用户金额
                    $res = $UserAccountLog->addMoney($uid,$money,$desc,$admin_id=$_SESSION['onethink_admin']['user_auth']['uid']);
                    break;
                case 2:
                    //减少用户金额
                    $res = $UserAccountLog->reduceMoney($uid,$money,$desc,$admin_id=$_SESSION['onethink_admin']['user_auth']['uid']);
                    break;
            }
            if($res){
                $this->success('用户资金调节成功！');
            }else{
                $this->error("用户资金调节失败！");
            }

        }else{
            $uid = I('uid');
            $User = new CuserApi();
            $info = $User->info($uid);
            $this->assign('info',$info);
            $this->meta_title = '调节用户资金';
            $this->display();
        }
    }

    /*
     * 用户资金记录
     */
    public function accountLog($uid)
    {
        $User = new CuserApi();
        $info = $User->info($uid);
        $map = array('uid'=>$uid);
        $list   = $this->lists('user_account_log', $map);
        int_to_string($list);
        $this->assign('_list', $list);
        $this->assign('info',$info);
        $this->meta_title = '用户资金变动列表';
        $this->display();
    }

    /*
     * 用户域名产品
     */
    public function userDomains()
    {
        $uid = I('uid');
        !$uid && $this->error('缺少参数');
        $User = new CuserApi();
        $uinfo = $User->info($uid);

        $map = array();
        $keywords = I('keywords');
        $map['uid'] = $uid;
        if(!empty($keywords)){
            $map['order_id|domain']=   array($keywords,array('like','%'.$keywords.'%'),'_multi'=>true);
        }
        $list   = $this->lists('user_domain', $map,$order='id desc');

        int_to_string($list);

        $this->assign('uinfo', $uinfo);
        $this->assign('uid', $uid);
        $this->assign('_list', $list);
        $this->meta_title = '用户域名产品列表';
        $this->display();
    }
    /*
     * 用户虚拟主机
     */
    public function userVitrual()
    {
        $uid = I('uid');
        !$uid && $this->error('缺少参数');
        $User = new CuserApi();
        $uinfo = $User->info($uid);

        $map = array();
        $keywords = I('keywords');
        $map['uid'] = $uid;
        if(!empty($keywords)){
            $map['name|domain']=   array($keywords,array('like','%'.$keywords.'%'),'_multi'=>true);
        }
        $list   = $this->lists('user_vitrual', $map,$order='id desc');

        int_to_string($list);

        $this->assign('uinfo', $uinfo);
        $this->assign('uid', $uid);
        $this->assign('_list', $list);
        $this->meta_title = '用户虚拟主机列表';
        $this->display();
    }    
    
    /*
     * 用户邮局产品
     */
    public function userMail()
    {
        $uid = I('uid');
        !$uid && $this->error('缺少参数');
        $User = new CuserApi();
        $uinfo = $User->info($uid);

        $map = array();
        $keywords = I('keywords');
        $map['uid'] = $uid;
        if(!empty($keywords)){
            $map['order_id|domain']=   array($keywords,array('like','%'.$keywords.'%'),'_multi'=>true);
        }
        $list   = $this->lists('user_mail', $map,$order='id desc');

        int_to_string($list);

        $this->assign('uinfo', $uinfo);
        $this->assign('uid', $uid);
        $this->assign('_list', $list);
        $this->meta_title = '用户邮局产品列表';
        $this->display();
    }
    
    /*
     *用户网站模板
     */
    public function userTemplate()
    {
        $uid = I('uid');
        !$uid && $this->error('缺少参数');
        $User = new CuserApi();
        $uinfo = $User->info($uid);

        $map = array();
        $keywords = I('keywords');
        $map['uid'] = $uid;
        if(!empty($keywords)){
            $map['template_id|name']=   array($keywords,array('like','%'.$keywords.'%'),'_multi'=>true);
        }
        $list   = $this->lists('user_template', $map,$order='id desc');

        int_to_string($list);

        $this->assign('uinfo', $uinfo);
        $this->assign('uid', $uid);
        $this->assign('_list', $list);
        $this->meta_title = '用户网站模板列表';
        $this->display();
    }
    
    /*
     * 用户弹性云主机
     */
    public function userHost()
    {
        $uid = I('uid');
        !$uid && $this->error('缺少参数');
        $User = new CuserApi();
        $uinfo = $User->info($uid);

        $map = array();
        $keywords = I('keywords');
        $map['uid'] = $uid;
        if(!empty($keywords)){
            $map['template_id|name']=   array($keywords,array('like','%'.$keywords.'%'),'_multi'=>true);
        }
        $list   = $this->lists('user_host', $map,$order='id desc');

        int_to_string($list);

        $this->assign('uinfo', $uinfo);
        $this->assign('uid', $uid);
        $this->assign('_list', $list);
        $this->meta_title = '用户弹性云主机列表';
        $this->display();
    }
    
    /*
     * 用户套餐云主机
     */
    public function userPackagehost()
    {
        $uid = I('uid');
        !$uid && $this->error('缺少参数');
        $User = new CuserApi();
        $uinfo = $User->info($uid);

        $map = array();
        $keywords = I('keywords');
        $map['uid'] = $uid;
        if(!empty($keywords)){
            $map['template_id|name']=   array($keywords,array('like','%'.$keywords.'%'),'_multi'=>true);
        }
        $list   = $this->lists('user_packagehost', $map,$order='id desc');

        int_to_string($list);

        $this->assign('uinfo', $uinfo);
        $this->assign('uid', $uid);
        $this->assign('_list', $list);
        $this->meta_title = '用户套餐云主机列表';
        $this->display();
    }
    
    /*
     * 查看用户产品
     */
    public function viewGoods()
    {
        $id = I('id');
        $type = I('type');//domain:域名 vitrual:虚拟机 mail:企业邮局 template:网站模板 host:弹性云主机 packagehost:套餐云主机
        !$id && $this->error("缺少参数id");
        !$type && $this->error("缺少类型");
        $map['id'] = $id;
        switch($type){
            case 'domain':
                $info = M('user_domain')->where($map)->find();
                break;
            case 'vitrual':
                $info = M('user_vitrual')->where($map)->find();
                break;
            case 'mail':
                $info = M('user_mail')->where($map)->find();
                break;
            case 'template':
                $info = M('user_template')->where($map)->find();
                break;
            case 'host':
                $info = M('user_host')->where($map)->find();
                break;
            case 'packagehost':
                $info = M('user_packagehost')->where($map)->find();
                break;
        }

        $this->meta_title = '用户产品';
        $this->assign('info',$info);
        $this->assign('type',$type);
        $this->display();
    }


    
}
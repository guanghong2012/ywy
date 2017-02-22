<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Home\Controller;
use Think\Controller;

/**
 * 前台公共控制器
 * 为防止多分组Controller名称冲突，公共Controller名称统一使用分组名称
 */
class HomeController extends Controller {

	/* 空操作，用于输出404页面 */
	public function _empty(){
		$this->redirect('Index/index');
	}


    protected function _initialize(){
        /* 读取站点配置 */
        $config = api('Config/lists');
        C($config); //添加配置
        $userinfo = session('user_auth');
        if(!empty($user)){
            $user_login = 1;
            $user_account = $userinfo['account'];
            $user_name = $userinfo['username'];
            $this->assign('user_name',$user_name);
            $this->assign('user_account',$user_account);
        }else{
            $user_login = 0;
        }

        $this->assign('user_login',$user_login);
        if(!C('WEB_SITE_CLOSE')){
            $this->error('站点已经关闭，请稍后访问~');
        }
    }

	/* 用户登录检测 */
	protected function is_login(){
		/* 用户登录检测 */
        $user = session('user_auth');
        if(empty($user)){
            $this->error('您还没有登录，请先登录！', U('Cuser/login'));
        }else{
            return $user['id'];
        }
	}

}

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
        if(!in_array(ACTION_NAME,array('login','logout','verify','register','forgetPass','setPass'))){
            $this->is_login();
        }
        $this->user_auth = session('user_auth');
    }
    //用户首页
    public function index()
    {
        //print_r(session('user_auth'));
        //网站公告
        $notice = D('document')->where('category_id=68 and status=1')->order('level desc')->limit(9)->field('id,title,create_time')->select();


        $user = $this->user_auth;
        $uid = $user['id'];

        $user_domain = M('user_domain')->where('uid='.$uid)->count();//域名个数
        $all_domain = M('user_domain')->where('uid='.$uid)->select();
        $expiring_domain = 0;//即将过期域名 30天内
        if(!empty($all_domain)){
            foreach($all_domain as $value){
                if( (strtotime($value['expiry_time'])-time())/86400<=30 ){
                    $expiring_domain ++;
                }
            }
        }

        $user_vitrual = M('user_vitrual')->where('uid='.$uid)->count();//虚拟主机个数
        $all_vitrual = M('user_vitrual')->where('uid='.$uid)->select();
        $expiring_vitrual = 0;//即将过期虚拟主机 30天内
        if(!empty($all_vitrual)){
            foreach($all_vitrual as $value){
                if( (strtotime($value['expire_time'])-time())/86400<=30 ){
                    $expiring_vitrual ++;
                }
            }
        }

        $user_mail = M('user_mail')->where('uid='.$uid)->count();//邮局个数
        $all_user_mail = M('user_mail')->where('uid='.$uid)->select();
        $expiring_mail = 0;//即将过期邮箱 30天内
        if(!empty($all_user_mail)){
            foreach($all_user_mail as $value){
                if( (strtotime($value['expiry_time'])-time())/86400<=30 ){
                    $expiring_mail ++;
                }
            }
        }


        $user_worksheet = M('user_worksheet')->where('uid='.$uid)->count();//工单个数
        $inhandle_worksheet = M('user_worksheet')->where('uid='.$uid.' and status =1')->count();//处理中工单个数

        $this->assign('notice',$notice);
        $this->assign('user_domain',$user_domain);
        $this->assign('expiring_domain',$expiring_domain);
        $this->assign('user_vitrual',$user_vitrual);
        $this->assign('expiring_vitrual',$expiring_vitrual);
        $this->assign('user_mail',$user_mail);
        $this->assign('expiring_mail',$expiring_mail);
        $this->assign('user_worksheet',$user_worksheet);
        $this->assign('inhandle_worksheet',$inhandle_worksheet);
        $this->display();
    }
    
    /*
     * 用户登录
     */
    public function login($username = '', $password = '', $verify = '')
    {
        if(!empty(session('user_auth'))){
            $this->error("您已登录！");
        }
        $userurl = session('userurl');//登录前的页面地址
        //echo $userurl;
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
                    $userurl = session('userurl');
                    $this->success('登录成功！',!empty($userurl) ? $userurl : U('Home/Cuser/index'));
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
            $this->display('Cuser/login1');
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
        $user = $this->user_auth;
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
                //$this->success('注册成功！',U('login'));
                echo json_encode(array("status"=>1,"url"=>U('login')));
            } else { //注册失败，显示错误信息
                $this->error($this->showRegError($uid));
            }

        } else { //显示注册表单
            $this->display('Cuser/register1');
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
    public function profile()
    {
        $user = $this->user_auth;
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
        $user = $this->user_auth;
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
        $user = $this->user_auth;
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
        $Page       = new \Think\Page2($count,10);// 实例化分页类 传入总记录数和每页显示的记录数(25)
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
        $user = $this->user_auth;
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

    /*
     * 网站模板产品
     */
    public function userTemplate()
    {
        $user = $this->user_auth;
        $uid = $user['id'];
        $keywords = I('get.keywords');//关键字
        $map = array();
        $map['uid'] = $uid;
        if(!empty($keywords)){
            $map['name'] = array("like",'%'.$keywords.'%');
        }

        $count      = M('user_template')->where($map)->count();// 查询满足要求的总记录数
        $Page       = new \Think\Page2($count,2);// 实例化分页类 传入总记录数和每页显示的记录数(25)
        $show       = $Page->show();// 分页显示输出
// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
        $list = M('user_template')->where($map)->order('create_time desc')->limit($Page->firstRow.','.$Page->listRows)->select();
        $this->assign('list',$list);// 赋值数据集
        $this->assign('page',$show);// 赋值分页输出

        $this->display();
    }

    /*
     * 域名产品
     */
    public function userDomain()
    {
        $user = $this->user_auth;
        $uid = $user['id'];
        $keywords = I('get.keywords');//关键字
        $map = array();
        $map['uid'] = $uid;
        if(!empty($keywords)){
            $map['name'] = array("like",'%'.$keywords.'%');
        }

        $count      = M('user_domain')->where($map)->count();// 查询满足要求的总记录数
        $Page       = new \Think\Page2($count,2);// 实例化分页类 传入总记录数和每页显示的记录数(25)
        $show       = $Page->show();// 分页显示输出
// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
        $list = M('user_domain')->where($map)->order('create_time desc')->limit($Page->firstRow.','.$Page->listRows)->select();
        $this->assign('list',$list);// 赋值数据集
        $this->assign('page',$show);// 赋值分页输出

        $this->display();
    }
    
    /*
     * 虚拟主机
     */
    public function userVitrual()
    {
        $user = $this->user_auth;
        $uid = $user['id'];
        $keywords = I('get.keywords');//关键字
        $map = array();
        $map['uid'] = $uid;
        if(!empty($keywords)){
            $map['order_id'] = array("like",'%'.$keywords.'%');
        }

        $count      = M('user_vitrual')->where($map)->count();// 查询满足要求的总记录数
        $Page       = new \Think\Page2($count,2);// 实例化分页类 传入总记录数和每页显示的记录数(25)
        $show       = $Page->show();// 分页显示输出
// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
        $list = M('user_vitrual')->where($map)->order('create_time desc')->limit($Page->firstRow.','.$Page->listRows)->select();
        $this->assign('list',$list);// 赋值数据集
        $this->assign('page',$show);// 赋值分页输出

        $this->display();
    }

    /*
     * 用户邮局
     */
    public function userMail()
    {
        $user = $this->user_auth;
        $uid = $user['id'];
        $keywords = I('get.keywords');//关键字
        $map = array();
        $map['uid'] = $uid;
        if(!empty($keywords)){
            $map['order_id'] = array("like",'%'.$keywords.'%');
        }

        $count      = M('user_mail')->where($map)->count();// 查询满足要求的总记录数
        $Page       = new \Think\Page2($count,2);// 实例化分页类 传入总记录数和每页显示的记录数(25)
        $show       = $Page->show();// 分页显示输出
// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
        $list = M('user_mail')->where($map)->order('create_time desc')->limit($Page->firstRow.','.$Page->listRows)->select();
        $this->assign('list',$list);// 赋值数据集
        $this->assign('page',$show);// 赋值分页输出

        $this->display();
    }
    
    /*
     * 弹性云主机
     */
    public function userHost()
    {
        $user = $this->user_auth;
        $uid = $user['id'];
        $keywords = I('get.keywords');//关键字
        $map = array();
        $map['uid'] = $uid;
        if(!empty($keywords)){
            $map['id'] = $keywords;
        }

        $count      = M('user_host')->where($map)->count();// 查询满足要求的总记录数
        $Page       = new \Think\Page2($count,2);// 实例化分页类 传入总记录数和每页显示的记录数(25)
        $show       = $Page->show();// 分页显示输出
// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
        $list = M('user_host')->where($map)->order('create_time desc')->limit($Page->firstRow.','.$Page->listRows)->select();
        $this->assign('list',$list);// 赋值数据集
        $this->assign('page',$show);// 赋值分页输出

        $this->display();
    }
    /*
     * 套餐云主机
     */
    public function userPackagehost()
    {
        $user = $this->user_auth;
        $uid = $user['id'];
        $keywords = I('get.keywords');//关键字
        $map = array();
        $map['uid'] = $uid;
        if(!empty($keywords)){
            $map['id'] = $keywords;
        }

        $count      = M('user_packagehost')->where($map)->count();// 查询满足要求的总记录数
        $Page       = new \Think\Page2($count,2);// 实例化分页类 传入总记录数和每页显示的记录数(25)
        $show       = $Page->show();// 分页显示输出
// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
        $list = M('user_packagehost')->where($map)->order('create_time desc')->limit($Page->firstRow.','.$Page->listRows)->select();
        $this->assign('list',$list);// 赋值数据集
        $this->assign('page',$show);// 赋值分页输出

        $this->display();
    }
    
    /*
     * 我的工单
     */
    public function userWorksheet()
    {
        $user = $this->user_auth;
        $uid = $user['id'];
        $keywords = I('get.keywords');//关键字
        $start = I('get.start');//开始时间
        $end = I('get.end');//结束时间
        $map = array();
        $map['uid'] = $uid;
        if(!empty($keywords)){
            $map['order_sn'] = $keywords;
        }
        if(!empty($start) && !empty($end)){
            $start = strtotime($start);
            $end = strtotime($end);
            $map['create_time'] = array("between",array($start,$end));
        }

        $count      = M('user_worksheet')->where($map)->count();// 查询满足要求的总记录数
        $Page       = new \Think\Page2($count,10);// 实例化分页类 传入总记录数和每页显示的记录数(25)
        $show       = $Page->show();// 分页显示输出
// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
        $list = M('user_worksheet')->where($map)->order('create_time desc')->limit($Page->firstRow.','.$Page->listRows)->select();
        $this->assign('list',$list);// 赋值数据集
        $this->assign('page',$show);// 赋值分页输出

        $this->display();
    }
    /*
     * 提交工单
     */
    public function createWorksheet()
    {
        $user = $this->user_auth;
        $uid = $user['id'];
        if(IS_POST){
            $data = I('post.');
            if(empty($data['title'])){
                $return = array("status"=>0,"msg"=>"请输入工单标题");
                echo json_encode($return);die;
            }
            if(empty($data['content'])){
                $return = array("status"=>0,"msg"=>"请输入问题描述");
                echo json_encode($return);die;
            }
            $images = array();
            if(!empty($data['images'])){
                $images_json = explode("#",$data['images']);
                foreach($images_json as $key=>$value){
                    if(!empty($value)){
                        $images[] = json_decode($value,true);
                    }

                }
            }
            $image_id = array();
            if(!empty($images)){
                foreach($images as $val){
                    //保存图片
                    $picture_data = array(
                        'path' => '/Uploads/'.$val['savepath'].$val['savename'],
                        'md5' => $val['md5'],
                        'sha1' => $val['sha1'],
                        'status' => 1,
                        'create_time' => time()
                    );
                    $image_id[] = D('picture')->add($picture_data);//图片id
                }
            }

            $worksheet = array(
                'uid' => $uid,
                'title' => $data['title'],
                'order_sn' => 'GD'.time(),
                'create_time' => time(),
                'content' => $data['content'],
                'images' => !empty($image_id) ? json_encode($image_id) : '',
            );
            $res = M('user_worksheet')->add($worksheet);
            if($res){
                $return = array("status"=>1,"msg"=>"工单提交成功","url"=>U('Cuser/userWorksheet'));
                echo json_encode($return);exit;
            }


        }else{
            $this->display();
        }
    }
    
    /*
     * 工单详情
     */
    public function workSheetInfo()
    {
        $id = (int)I('id');
        !$id && $this->error("非法访问");
        $info = M('user_worksheet')->find($id);

        $user = $this->user_auth;

        $chact_list = M('worksheet_chact')->where('sheet_id='.$id)->order('create_time asc')->select();
        if(!empty($chact_list)){
            foreach($chact_list as $key=>$value){
                $chact_list[$key]['images'] = json_decode($value['images'],true);
            }
        }
        $this->assign("user",$user);
        $this->assign("info",$info);
        $this->assign("chact_list",$chact_list);
        $this->display();
    }

    /*
     * 回复工单
     */
    public function workSheetReply()
    {
        if(IS_POST){
            $data = I('post.');
            if(empty($data['content'])){
                $return = array("status"=>0,"msg"=>"请填写回复内容！");
                echo json_encode($return);exit;
            }
            $images = array();
            if(!empty($data['images'])){
                $images_json = explode("#",$data['images']);
                foreach($images_json as $key=>$value){
                    if(!empty($value)){
                        $images[] = json_decode($value,true);
                    }

                }
            }
            $image_id = array();
            if(!empty($images)){
                foreach($images as $val){
                    //保存图片
                    $picture_data = array(
                        'path' => '/Uploads/'.$val['savepath'].$val['savename'],
                        'md5' => $val['md5'],
                        'sha1' => $val['sha1'],
                        'status' => 1,
                        'create_time' => time()
                    );
                    $image_id[] = D('picture')->add($picture_data);//图片id
                }
            }
            $reply = array(
                'sheet_id' => $data['sheet_id'],
                'from' => $data['from'],
                'create_time' => time(),
                'content' => $data['content'],
                'images' => !empty($image_id) ? json_encode($image_id) : '',
            );
            $res = M('worksheet_chact')->add($reply);
            if($res){
                $return = array("status"=>1,"msg"=>"回复成功","url"=>U('Cuser/userWorksheet'));
                echo json_encode($return);exit;
            }

        }
    }
    
    /*
     * 找回密码
     */
    public function forgetPass()
    {
        if(IS_POST){
            $email = stripslashes(I('post.email'));
            $verify = I('post.verify');
            /* 检测验证码 */
            if(!check_verify($verify,1)){
                $this->error('验证码输入错误！');
            }
            //检测邮箱
            if(!check_email($email)){
                $this->error('请输入正确的邮箱地址！');
            }
            //检测该邮箱是否存在
            $map['email'] = $email;
            $check = D('Cuser')->where($map)->find();
            if(empty($check)){
                $this->error('邮箱不存在！');
            }
            $getpasstime = time();//密码找回验证时间戳
            $token = md5($check['id'].$check['email'].$check['password']);
            $url = 'http://'.$_SERVER['HTTP_HOST'].U('Cuser/setPass',array('email'=>$email,'token'=>$token));

            $body = "亲爱的".$email."：<br/>您在".date('Y-m-d H:i:s')."提交了找回密码请求。请点击下面的链接重置密码（按钮24小时内有效）。<br/><a href='".$url."'target='_blank'>".$url."</a>";
            //发送邮件
            $send = send_mail($email,"亿维云-找回密码",$body);
            if($send){
                D('Cuser')->where('id='.$check['id'])->setField('getpasstime',$getpasstime);//更新数据发送时间
                echo json_encode(array('status'=>1,"msg"=>'邮件发送成功',"url"=>U('Cuser/forgetPass')));
                exit;
            }

        }else{
            $this->display();
        }
    }
    
    //重置密码
    public function setPass()
    {
        //$data = I('get.');
        $token = stripslashes(trim($_GET['token']));
        $email = stripslashes(trim($_GET['email']));
        $map['email'] = $email;
        $uinfo = D('Cuser')->where($map)->find();
        if($uinfo){
            $mt = md5($uinfo['id'].$uinfo['email'].$uinfo['password']);
            if($mt == $token){
                if(time()-$uinfo['getpasstime']>24*60*60){
                    redirect('/Index/index', 5, '该链接已过期...');
                }else{
                    //更改密码
                    $update['password'] = '123456';
                    $API = new CuserApi();
                    $res = $API->updateFields($uinfo['id'],$update);
                    if($res['status']){

                        $this->display();
                    }
                }
            }else{
                redirect('/Index/index', 5, '无效链接...');
            }
        }else{
            redirect('/Index/index', 5, '错误链接...');
        }


    }

    //查看虚拟主机
    public function viewVitrual()
    {
        $id = (int)I('get.id');
        !$id && $this->error("非法访问！");
        $info = M('user_vitrual')->find($id);
        $this->assign('info',$info);
        $this->display();
    }
    
    //公告列表
    public function noticeList()
    {
        $Document = D('Document');
        $map = array();
        $map['category_id'] = 68;
        $map['status'] = 1;

        $count      = $Document->where($map)->count();// 查询满足要求的总记录数
        $Page       = new \Think\Page2($count,10);// 实例化分页类 传入总记录数和每页显示的记录数(25)
        $show       = $Page->show();// 分页显示输出
// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
        $list = $Document->where($map)->order('level desc, create_time desc')->limit($Page->firstRow.','.$Page->listRows)->select();
        $this->assign('list',$list);// 赋值数据集
        $this->assign('page',$show);// 赋值分页输出
        $this->display();
    }
    //公告内容
    public function viewNotice($id)
    {
        $id = (int)$id;
        !$id && $this->_empty();
        $info = D('document')->detail($id);
        //下一条
        $next = D('document')->next($info);
        //上一条
        $prev = D('document')->prev($info);

        $this->assign('prev',$prev);
        $this->assign('next',$next);
        $this->assign('info',$info);
        $this->display();
    }


}
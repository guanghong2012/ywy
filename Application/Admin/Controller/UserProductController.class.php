<?php
/**
 * Created by PhpStorm.
 * User: 温柔一刀
 * Date: 2017/3/20
 * Time: 13:46
 */
namespace Admin\Controller;
use User\Api\CuserApi;

class UserProductController extends AdminController{
    public function _initialize()
    {
        parent::_initialize();
        $this->USERAPI = new CuserApi();
    }
    /*
     * 用户域名产品
     */
    public function userDomains()
    {
        $uid = I('uid');
        //!$uid && $this->error('缺少参数');
        
        $map = array();
        $keywords = I('keywords');
        if($uid){
            $map['uid'] = $uid;
        }
        if(!empty($keywords)){
            $map['order_id|domain']=   array($keywords,array('like','%'.$keywords.'%'),'_multi'=>true);
        }
        $list   = $this->lists('user_domain', $map,$order='id desc');
        if(!empty($list)){
            foreach($list as $key=>$value){
                $uinfo = $this->USERAPI->info($value['uid']);//用户信息
                $list[$key]['uinfo'] = $uinfo;
            }
        }
        int_to_string($list);

        $this->assign('_list', $list);
        $this->meta_title = '用户域名产品列表';
        $this->display();
    }

    /*
     * 用户虚拟机产品
     */
    public function userVitrual()
    {
        $uid = I('uid');

        $map = array();
        $keywords = I('keywords');
        if($uid){
            $map['uid'] = $uid;
        }
        if(!empty($keywords)){
            $map['name|domain']=   array($keywords,array('like','%'.$keywords.'%'),'_multi'=>true);
        }
        $list   = $this->lists('user_vitrual', $map,$order='id desc');
        if(!empty($list)){
            foreach($list as $key=>$value){
                $uinfo = $this->USERAPI->info($value['uid']);//用户信息
                $list[$key]['uinfo'] = $uinfo;
            }
        }
        int_to_string($list);

        $this->assign('_list', $list);
        $this->meta_title = '用户虚拟主机列表';
        $this->display();
    }

    /*
     * 用户邮局
     */
    public function userMail()
    {
        $uid = I('uid');


        $map = array();
        $keywords = I('keywords');
        if($uid){
            $map['uid'] = $uid;
        }
        if(!empty($keywords)){
            $map['order_id|domain']=   array($keywords,array('like','%'.$keywords.'%'),'_multi'=>true);
        }
        $list   = $this->lists('user_mail', $map,$order='id desc');
        if(!empty($list)){
            foreach($list as $key=>$value){
                $uinfo = $this->USERAPI->info($value['uid']);//用户信息
                $list[$key]['uinfo'] = $uinfo;
            }
        }
        int_to_string($list);

        $this->assign('_list', $list);
        $this->meta_title = '用户邮局产品列表';
        $this->display();
    }

    /*
     * 用户网站模板产品
     */
    public function userTemplate()
    {
        $uid = I('uid');

        $map = array();
        $keywords = I('keywords');
        if($uid){
            $map['uid'] = $uid;
        }
        if(!empty($keywords)){
            $map['template_id|name']=   array($keywords,array('like','%'.$keywords.'%'),'_multi'=>true);
        }
        $list   = $this->lists('user_template', $map,$order='id desc');
        if(!empty($list)){
            foreach($list as $key=>$value){
                $uinfo = $this->USERAPI->info($value['uid']);//用户信息
                $list[$key]['uinfo'] = $uinfo;
            }
        }
        int_to_string($list);

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

        $map = array();
        $keywords = I('keywords');
        if($uid){
            $map['uid'] = $uid;
        }
        if(!empty($keywords)){
            $map['template_id|name']=   array($keywords,array('like','%'.$keywords.'%'),'_multi'=>true);
        }
        $list   = $this->lists('user_host', $map,$order='id desc');
        if(!empty($list)){
            foreach($list as $key=>$value){
                $uinfo = $this->USERAPI->info($value['uid']);//用户信息
                $list[$key]['uinfo'] = $uinfo;
            }
        }
        int_to_string($list);

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

        $map = array();
        $keywords = I('keywords');
        if($uid){
            $map['uid'] = $uid;
        }
        if(!empty($keywords)){
            $map['template_id|name']=   array($keywords,array('like','%'.$keywords.'%'),'_multi'=>true);
        }
        $list   = $this->lists('user_packagehost', $map,$order='id desc');
        if(!empty($list)){
            foreach($list as $key=>$value){
                $uinfo = $this->USERAPI->info($value['uid']);//用户信息
                $list[$key]['uinfo'] = $uinfo;
            }
        }
        int_to_string($list);

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
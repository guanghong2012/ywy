<?php
/**
 * Created by PhpStorm.
 * User: 温柔一刀
 * Date: 2017/2/17
 * Time: 14:46
 * 云服务端控制器
 */
namespace Home\Controller;

class ServerController extends HomeController{

    public function index()
    {
        session('userurl',$_SERVER['REQUEST_URI']);//记录登录前的页面地址
        //套餐云产品
        $package_list = D('PackageHost')->order('level asc')->select();
        if(!empty($package_list)){
            foreach($package_list as $key=>$value){
                $package_list[$key]['computer_room'] = json_decode($value['computer_room'],true);
            }
        }


        $this->assign('package_list',$package_list);
        $this->display();
    }
}
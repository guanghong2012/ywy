<?php
/**
 * Created by PhpStorm.
 * User: 温柔一刀
 * Date: 2017/2/18
 * Time: 10:05
 * 新闻类控制器
 */
namespace Home\Controller;

class NewsController extends HomeController{

    //列表页
    public function index()
    {

        $this->display();
    }

    /*
     * 详情页
     */
    public function detail($id)
    {

        $this->display();
    }

}
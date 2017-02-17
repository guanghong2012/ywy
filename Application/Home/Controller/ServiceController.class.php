<?php
/**
 * Created by PhpStorm.
 * User: 温柔一刀
 * Date: 2017/2/17
 * Time: 15:15
 * 客服中心控制器
 */
namespace Home\Controller;

class ServiceController extends HomeController{

    public function index()
    {

        $this->display();
    }
    
    /*
     * 合作伙伴
     */
    public function partner()
    {

        $this->display();
    }
    
    /*
     * 企业动态
     */
    public function news()
    {

        $this->display();
    }
    
    /*
     * 客户案例
     */
    public function cases()
    {

        $this->display();
    }
    
    /*
     * 备案中心
     */
    public function filings()
    {

        $this->display();
    }

    /*
     * 联系我们
     */
    public function contactus()
    {

        $this->display();
    }
    
}
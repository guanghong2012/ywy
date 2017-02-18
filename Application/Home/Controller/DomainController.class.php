<?php
/**
 * Created by PhpStorm.
 * User: 温柔一刀
 * Date: 2017/2/17
 * Time: 14:32
 * 域名注册控制器
 */
namespace Home\Controller;

class DomainController extends HomeController{

    public function index()
    {
        //亿维云网优势
        $advantages = D('Document')->where('category_id=58 and status=1')->field('id,title,description,cover_id')->order('level desc')->select();

        //热门动态6条
        $document = D('Document');
        $hot_news = $document->where('category_id=53 and status=1')->order('level desc')->field('id,title,create_time')->select();
        //产品动态6条
        $product_news = $document->where('category_id=59 and status=1')->order('level desc')->field('id,title,create_time')->select();
        //媒体报告6条
        $media_news = $document->where('category_id=57 and status=1')->order('level desc')->field('id,title,create_time')->select();

        $this->assign('advantages',$advantages);
        $this->assign('hot_news',$hot_news);
        $this->assign('product_news',$product_news);
        $this->assign('media_news',$media_news);
        $this->display();
    }


}
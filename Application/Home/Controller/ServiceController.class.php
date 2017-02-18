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
    public function _initialize()
    {
        parent::_initialize();
        //公司简介
        $this->aboutus = D('Document')->detail(3);
        $this->assign('aboutus',$this->aboutus);
    }
    
    public function index()
    {
        //公司简介
        //$aboutus = D('Document')->detail(3);
        //获得的荣誉
        $honors = D('Document')->where('category_id=50 and status=1')->field('id,title,cover_id')->order('level desc')->select();

        //$this->assign('aboutus',$aboutus);
        $this->assign('honors',$honors);
        $this->display();
    }
    
    /*
     * 合作伙伴
     */
    public function partner()
    {
        //合作伙伴
        $partners = D('Document')->alias('a')->join('LEFT JOIN onethink_document_partner as b ON a.id=b.id')->where('a.category_id=51 and a.status=1')->field('a.id,a.title,a.cover_id,b.url')->order('a.level desc')->select();

        $this->assign('partners',$partners);
        $this->display();
    }
    
    /*
     * 企业动态
     */
    public function news()
    {
        /* 获取当前分类列表 */
        $Document = D('Document');
        //热门动态
        $map = array();
        $map['category_id'] = 53;
        $map['status'] = 1;

        $count      = $Document->where($map)->count();// 查询满足要求的总记录数
        $Page       = new \Think\Page2($count,2);// 实例化分页类 传入总记录数和每页显示的记录数(25)
        $show       = $Page->show();// 分页显示输出
// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
        $list = $Document->where($map)->order('level desc, create_time desc')->limit($Page->firstRow.','.$Page->listRows)->select();
        $this->assign('list',$list);// 赋值数据集
        $this->assign('page',$show);// 赋值分页输出


        //长期活动
        $long_activity = $Document->where('category_id=54 and status = 1')->order('level desc, create_time desc')->limit(8)->select();
        $this->assign('long_activity',$long_activity);
        $this->display();
    }
    
    /*
     * 客户案例
     */
    public function cases()
    {
        $cate_id = I('get.cate_id');
        $Cases = D('cases');
        if(empty($cate_id)){
            //取案例分类排序靠前的一个
            $cate_id = $Cases->order('level desc')->getField('id');
        }
        $info = $Cases->detail($cate_id);

        //所有案例分类
        $all_case_cate = $Cases->order('level desc')->select();

        //该分类下的所有客户案例
        $map['case_id'] = $cate_id;
        $all_cases = D('CasesDemo')->where($map)->select();

        $this->assign('all_cases',$all_cases);
        $this->assign('all_case_cate',$all_case_cate);
        $this->assign('info',$info);
        $this->display();
    }
    
    /*
     * 备案中心
     */
    public function filings()
    {
        $info = D('Document')->detail(9);
        $this->assign('info',$info);
        $this->display();
    }

    /*
     * 联系我们
     */
    public function contactus()
    {
        $info = D('Document')->detail(10);
        if(!empty($info['consults'])){
            $info['consults'] = explode(',',$info['consults']);
        }

        $this->assign('info',$info);
        $this->display();
    }
    
}
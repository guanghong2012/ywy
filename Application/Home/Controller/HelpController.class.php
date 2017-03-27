<?php
/**
 * Created by PhpStorm.
 * User: 温柔一刀
 * Date: 2017/2/17
 * Time: 16:00
 */
namespace Home\Controller;

class HelpController extends HomeController{

    public function index()
    {
        $cat_id = I('cat_id');
        $keywords = I('keywords');//查询关键字

        //所有分类
        $all_cate = D('category')->where('pid=39 and status=1')->order('sort asc')->field('id,title')->select();

        if(empty($cat_id)){
            //获取帮助中心分类下排序第一的分类id
            $cat_id = D('category')->where('pid=39 and status=1')->order('sort asc')->getField('id');
        }

        /* 分类信息 */
        $category = $this->category($cat_id);

        /* 获取当前分类列表 */
        $Document = D('Document');
        if(!empty($keywords)){
            //根据关键字查找
            $map = array();
            $map['a.category_id'] = $cat_id;
            $map['a.status'] = 1;
            $map['b.keywords'] = array('like','%'.$keywords.'%');

            $count      = $Document->alias('a')->join('LEFT JOIN onethink_document_help as b ON a.id=b.id')->where($map)->count();// 查询满足要求的总记录数

            $Page       = new \Think\Page2($count,10);// 实例化分页类 传入总记录数和每页显示的记录数(25)
            $show       = $Page->show();// 分页显示输出
// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
            $list = $Document->alias('a')->join('LEFT JOIN onethink_document_help as b ON a.id=b.id')->where($map)->field('a.id,a.title,a.create_time,a.status,b.keywords')->order('a.level desc, a.create_time desc')->limit($Page->firstRow.','.$Page->listRows)->select();

            $this->assign('list',$list);// 赋值数据集
            $this->assign('page',$show);// 赋值分页输出

        }else{
            $map = array();
            $map['category_id'] = $cat_id;
            $map['status'] = 1;

            $count      = $Document->where($map)->count();// 查询满足要求的总记录数
            $Page       = new \Think\Page2($count,10);// 实例化分页类 传入总记录数和每页显示的记录数(25)
            $show       = $Page->show();// 分页显示输出
// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
            $list = $Document->where($map)->order('level desc, create_time desc')->limit($Page->firstRow.','.$Page->listRows)->select();
            $this->assign('list',$list);// 赋值数据集
            $this->assign('page',$show);// 赋值分页输出


        }

        if(false === $list){
            $this->error('获取列表数据失败！');
        }

        /* 模板赋值并渲染模板 */
        $this->assign('category', $category);
        $this->assign('all_cate', $all_cate);

        $this->display();
    }
    
    /*
     * 详细页
     */
    public function detail($id)
    {
        /* 标识正确性检测 */
        if(!($id && is_numeric($id))){
            $this->error('文档ID错误！');
        }
        /* 获取详细信息 */
        $Document = D('Document');
        $info = $Document->detail($id);
        if(!$info){
            $this->error($Document->getError());
        }
        //所有分类
        $all_cate = D('category')->where('pid=39 and status=1')->order('sort asc')->field('id,title')->select();
        /* 分类信息 */
        $category = $this->category($info['category_id']);
        /* 更新浏览数 */
        $map = array('id' => $id);
        $Document->where($map)->setInc('view');

        //上一篇
        $all_news = M('document')->where('category_id='.$info['category_id'].' and status = 1 ')->order('level desc,create_time desc')->field('id')->select();
        foreach($all_news as $k=>$v){
            //$list_order[] = $v['id'];
            if($id == $v['id']){
                $pre_id = $all_news[$k-1]['id'] ? $all_news[$k-1]['id'] : 0;//上一篇id
                $next_id = $all_news[$k+1]['id'] ? $all_news[$k+1]['id'] : 0;//下一篇id

            }
        }

        if($pre_id>0){
            $pre_title = M('document')->where('id='.$pre_id)->getField('title');
        }else{
            $pre_title = '没有了';
        }
        if($next_id>0){

            $next_title = M('document')->where('id='.$next_id)->getField('title');

        }else{
            $next_title = '敬请期待';
        }

        $pre = array(
            'pre_id'=>$pre_id,
            'pre_title'=>$pre_title
        );
        $next = array(
            'next_id'=>$next_id,
            'next_title'=>$next_title
        );


        /* 模板赋值并渲染模板 */
        $this->assign('all_cate', $all_cate);
        $this->assign('category', $category);
        $this->assign('info', $info);
        $this->assign('pre',$pre);//上一篇
        $this->assign('next',$next);//下一篇
        $this->display();
    }

    /* 文档分类检测 */
    private function category($id = 0){
        /* 标识正确性检测 */
        $id = $id ? $id : I('get.category', 0);
        if(empty($id)){
            $this->error('没有指定文档分类！');
        }

        /* 获取分类信息 */
        $category = D('Category')->info($id);
        if($category && 1 == $category['status']){
            switch ($category['display']) {
                case 0:
                    $this->error('该分类禁止显示！');
                    break;
                //TODO: 更多分类显示状态判断
                default:
                    return $category;
            }
        } else {
            $this->error('分类不存在或被禁用！');
        }
    }
    
}
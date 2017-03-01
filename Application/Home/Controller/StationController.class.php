<?php
/**
 * Created by PhpStorm.
 * User: 温柔一刀
 * Date: 2017/2/17
 * Time: 15:06
 * 云建站控制器
 */
namespace Home\Controller;

class StationController extends HomeController{
    public function _initialize()
    {
        parent::_initialize();

    }
    public function index()
    {
        session('userurl',$_SERVER['REQUEST_URI']);//记录登录前的页面地址
        $pc = intval(I('get.pc')) ? intval(I('get.pc')) : 1;
        $cate_id = intval(I('get.cate_id'));
        $color = I('get.color') ? I('get.color') : '#fe0000';
        //所有模板分类
        $all_temp_cate = D('StationCategory')->where('is_pc='.$pc)->order('level asc')->select();
        if(empty($cate_id)){
            $cate_id = $all_temp_cate[0]['id'];
        }
        $cate_name = D('StationCategory')->where('id='.$cate_id)->getField('name');

        $map = array();
        $map['cate_id'] = $cate_id;
        $map['color'] = $color;

        $count      = D('StationTemplate')->where($map)->count();// 查询满足要求的总记录数

        $Page       = new \Think\Page2($count,2);// 实例化分页类 传入总记录数和每页显示的记录数(25)
        $show       = $Page->show();// 分页显示输出
// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
        $list = D('StationTemplate')->where($map)->order('level desc')->limit($Page->firstRow.','.$Page->listRows)->select();
        $this->assign('list',$list);// 赋值数据集
        $this->assign('page',$show);// 赋值分页输出

        $this->assign('cate_name',$cate_name);
        $this->assign('all_temp_cate',$all_temp_cate);
        $this->assign('pc',$pc);
        $this->assign('cate_id',$cate_id);
        $this->assign('color',$color);
        $this->display();
    }
    
    /*
     * 加入购物车
     */
    public function addToCart()
    {
        if(IS_AJAX){
            $id = intval(I('post.id'));
            if(!$id){
                $return = array('status'=>0,'msg'=>'缺少参数');
                echo json_encode($return);exit;
            }
            /* 用户登录检测 */
            $user = session('user_auth');
            if(empty($user)){
                $status = 2;
                $msg = '用户未登录！';
                $return = array('status'=>$status,'url'=>U('Cuser/login'),'msg'=>$msg);
                echo json_encode($return);exit;
            }
            //模板详情
            $template = D('StationTemplate')->detail($id);
            $template_cate = D('StationCategory')->detail($template['cate_id']);//模板分类
            $buy_config = $template;

            $model = D("Cart");
            $data = array();
            $data['uid'] = $user['id'];
            $data['product_id'] = 0;//新一代产品id
            $data['name'] = $template['name'];//模板id
            $data['keywords'] = '无';
            $data['number'] = 1;
            $data['price'] = $template['price'];//域名单价未知
            $data['month'] = 12;//购买时限(月)
            $data['base_total'] = $template['price'];
            $data['added_price'] = 0.00;

            $project['name'] = $template_cate['name'].'-'.$template['name'];//方案名称

            $data['project'] = json_encode($project);//方案信息
            $data['parameters'] = '';//产品参数信息
            $data['type'] = 5;//产品类型 1=域名 2=虚拟机3=企业邮箱4=云服务器5=云建站模板
            $data['domain_info'] = '';//域名注册信息
            $data['subtotal'] = $template['price'];//全部总价
            $data['price_id'] = 0;
            $data['buy_config'] = json_encode($buy_config);//用户购买的配置信息
            $res = $model->addCart($data);//加入购物车
            if($res){
                $return = array('status'=>1,'url'=>U('Cart/index'),'msg'=>'加入购物车成功');
                echo json_encode($return);exit;
            }


        }
    }

}
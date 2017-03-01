<?php
/**
 * Created by PhpStorm.
 * User: 温柔一刀
 * Date: 2017/2/17
 * Time: 14:41
 * 企业邮箱控制器
 */
namespace Home\Controller;

class MailController extends HomeController{

    public function index()
    {
        $mail = M('mail')->find();
        $this->assign('mail',$mail);
        $this->display();
    }
    
    /*
     * 选择配置
     */
    public function buyMail()
    {
        $mail = M('mail')->find();
        $this->assign('mail',$mail);
        $this->display();
    }
    
    /*
     * 加入购物车
     */
    public function addToCart()
    {
        if(IS_AJAX){
            $id = intval(I('post.id'));
            $domain = I('domain');//绑定域名
            $extra_mail_num = I('extra_mail_num');//额外购买邮箱个数
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
            //邮局详情
            $mail = M('Mail')->find($id);
            $buy_config = array(
                'domain' => $domain,//绑定域名
                'number' => $extra_mail_num,//额外的邮箱个数限制
                'timeperiod' => 12,//12个月
                'quota' => 0,//额外的邮局空间(G)
                'id' => $mail['id'],
                'name' => $mail['name'],
                'price' => $mail['price'],
                'usernum' => $mail['$mail'],//基本邮箱用户数量
                'space' => $mail['space'],//每个用户邮箱容量
                'extra_price' => $mail['extra_price']//额外邮箱单价
            );

            $model = D("Cart");
            $data = array();
            $data['uid'] = $user['id'];
            $data['product_id'] = $mail['product_id'];//新一代产品id
            $data['name'] = $mail['name'];//模板id
            $data['keywords'] = '无';
            $data['number'] = 1;
            $data['price'] = $mail['price'];//域名单价未知
            $data['month'] = 12;//购买时限(月)
            $data['base_total'] = $mail['price'];
            $data['added_price'] = $mail['extra_price'] * $extra_mail_num;

            $project['name'] = $mail['name'];//方案名称

            $data['project'] = json_encode($project);//方案信息
            $data['parameters'] = '';//产品参数信息
            $data['type'] = 3;//产品类型 1=域名 2=虚拟机3=企业邮箱4=云服务器5=云建站模板
            $data['domain_info'] = '';//域名注册信息
            $data['subtotal'] = $data['base_total'] + $data['added_price'];//全部总价
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
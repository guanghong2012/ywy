<?php
/**
 * Created by PhpStorm.
 * User: 温柔一刀
 * Date: 2017/3/8
 * Time: 16:26
 */
namespace Admin\Controller;

use Org\Schedule\Queue;

class OrderController extends AdminController{
    public function _initialize()
    {
        parent::_initialize();
        $this->usermodel = D('Cuser');
    }
    //订单列表
    public function index()
    {
        $map = array();
        $keywords = I('keywords');
        if(!empty($keywords)){
            $map['ordersn|username']=   array($keywords,array('like','%'.$keywords.'%'),'_multi'=>true);
        }

        $list   = $this->lists('order', $map,$order='create_time desc');
        int_to_string($list);

        $this->assign('_list', $list);
        $this->meta_title = '订单列表';
        $this->display();
    }
    /*
     * 订单产品
     */
    public function orderGoods($order_id)
    {
        $order_id = (int)$order_id;
        !$order_id && $this->error("缺少参数id");
        $map = array();
        $keywords = I('keywords');
        $map['order_id'] = $order_id;
        if(!empty($keywords)){
            $map['ordersn|username']=   array($keywords,array('like','%'.$keywords.'%'),'_multi'=>true);
        }

        $list   = $this->lists('order_goods', $map);
        int_to_string($list);

        $this->assign('_list', $list);
        $this->meta_title = '订单产品列表';

        $order = M('order')->find($order_id);


        $this->assign('order',$order);
        $this->display();
    }
    /*
     * 查看订单产品
     */
    public function viewGoods($id)
    {
        $id = (int)$id;
        !$id && $this->error("缺少参数id");
        $info = M('order_goods')->find($id);
        if($info['buy_config']){
            $info['config'] = json_decode($info['buy_config'],true);
        }
        $this->assign('info', $info);
        $this->meta_title = '查看订单产品';
        $this->display();
    }
    //开通订单产品
    public function enableGoods()
    {
        $id = (int)I('id');
        !$id && $this->error("缺少参数id");
        $goods = M('order_goods')->find($id);//产品类型 1=域名 2=虚拟机3=企业邮箱4=弹性云主机5=云建站模板 6=套餐云主机
        if(in_array($goods['type'],array(1,2,3))){
            //取出任务计划
            $schedule = M('schedule_list')->where('order_goods_id='.$id)->find();
            if($schedule){
                if($schedule['exec_status']==1){
                    $this->error("任务执行中");
                }
                if($schedule['exec_lock']==0){
                    //执行任务
                    $queue = new Queue();
                    $result = $queue::executeQueue($schedule);
                    $result['info'] =  json_decode($result['info'],true);

                    $this->meta_title = '开通产品';
                    $this->assign('goods',$goods);
                    $this->assign('result',$result['info']);
                    $this->display();
                }


            }else{
                $this->error("任务不存在！");
            }
        }else{
            $goods['buy_config'] = json_decode($goods['buy_config'],true);
            $this->meta_title = '开通产品';
            $this->assign('info',$goods);

            $this->display('enableGood');
        }


    }

    //开通套餐云主机和弹性云主机
    public function enableHosts()
    {
        $data = I('post.');
        $id = $data['id'];
        $product_status = $data['product_status'];//产品状态
        $goods = M('order_goods')->find($id);//产品类型 1=域名 2=虚拟机3=企业邮箱4=弹性云主机5=云建站模板 6=套餐云主机
        $goods['buy_config'] = json_decode($goods['buy_config'],true);
        if($goods['product_status']==1){
            $this->error('产品已开通！');
        }
        if($product_status==0){
            $this->error('请选择开通状态！');
        }
        if($goods['product_status']==0 && $product_status==1){
            if($goods['type']==4){
                //弹性云主机
                //生产用户产品
                $num = $goods['buy_config']['buycount'];//购买数量
                $create_data = array(
                    'uid' => $goods['uid'],
                    'name' => $goods['product_name'],
                    'cpu' => $goods['buy_config']['cpu'],
                    'memory' => $goods['buy_config']['memory'],
                    'disk' => $goods['buy_config']['disk'],
                    'bandwidth' => $goods['buy_config']['bandwidth'],
                    'os' => $goods['buy_config']['os_name'],
                    'line' => $goods['buy_config']['line_name'],
                    'service' => $goods['buy_config']['service_name'],
                    'create_time' => time(),
                    'expiry_time' => time() + intval($goods['month'])*3600*24*30,
                    'desc' => $data['desc'],

                );
                for($i=0;$i<$num;$i++){
                    $res = M('user_host')->add($create_data);
                }
                if($res){
                    //更新订单产品的开通状态
                    $status = M('order_goods')->where('id='.$id)->setField('product_status',1);
                    $status && $this->success('开通成功！');
                }

            }
            //套餐云主机
            if($goods['type']==6){
                $create_data = array(
                    'uid' => $goods['uid'],
                    'name' => $goods['product_name'],
                    'product_id' => $goods['buy_config']['host_id'],
                    'cpu' => $goods['buy_config']['cpu'],
                    'memory' => $goods['buy_config']['memory'],
                    'disk' => $goods['buy_config']['disk'],
                    'bandwidth' => $goods['buy_config']['bandwidth'],
                    'ip' => $goods['buy_config']['ip'],
                    'create_time' => time(),
                    'expiry_time' => time() + intval($goods['month'])*3600*24*30,
                    'desc' => $data['desc'],
                );
                $res = M('user_packagehost')->add($create_data);//新增用户套餐云主机产品
                if($res){
                    //更新订单产品的开通状态
                    $status = M('order_goods')->where('id='.$id)->setField('product_status',1);
                    $status && $this->success('开通成功！');
                }

            }
        }


    }

    //查看开通结果
    public function viewResult()
    {
        $id = (int)I('id');
        !$id && $this->error("缺少参数id");
        $goods = M('order_goods')->find($id);//产品类型 1=域名 2=虚拟机3=企业邮箱4=弹性云主机5=云建站模板 6=套餐云主机
        if(in_array($goods['type'],array(1,2,3))){
            //取出任务计划
            $schedule = M('schedule_list')->where('order_goods_id='.$id)->find();
            $schedule['exec_info'] = json_decode($schedule['exec_info'],true);
        }
        $this->meta_title = '查看开通结果';
        $this->assign('goods',$goods);
        $this->assign('schedule',$schedule);
        $this->display();
    }

    
}
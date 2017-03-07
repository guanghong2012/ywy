<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

/**
 * 前台公共库文件
 * 主要定义前台公共函数库
 */

/**
 * 检测验证码
 * @param  integer $id 验证码ID
 * @return boolean     检测结果
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
function check_verify($code, $id = 1){
	$verify = new \Think\Verify();
	return $verify->check($code, $id);
}

/**
 * 获取列表总行数
 * @param  string  $category 分类ID
 * @param  integer $status   数据状态
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
function get_list_count($category, $status = 1){
    static $count;
    if(!isset($count[$category])){
        $count[$category] = D('Document')->listCount($category, $status);
    }
    return $count[$category];
}

/**
 * 获取段落总数
 * @param  string $id 文档ID
 * @return integer    段落总数
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
function get_part_count($id){
    static $count;
    if(!isset($count[$id])){
        $count[$id] = D('Document')->partCount($id);
    }
    return $count[$id];
}

/**
 * 获取导航URL
 * @param  string $url 导航URL
 * @return string      解析或的url
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
function get_nav_url($url){
    switch ($url) {
        case 'http://' === substr($url, 0, 7):
        case '#' === substr($url, 0, 1):
            break;        
        default:
            $url = U($url);
            break;
    }
    return $url;
}

/*
 * 价格地图
 */
function priceMap($year){
    $year = intval($year);
    if(!$year){
        return false;
    }
    switch($year){
        case 1:
            $price_str = 'one_price';
            break;
        case 2:
            $price_str = 'two_price';
            break;
        case 3:
            $price_str = 'three_price';
            break;
        case 4:
            $price_str = 'four_price';
            break;
        case 5:
            $price_str = 'five_price';
            break;
        case 6:
            $price_str = 'six_price';
            break;
        case 7:
            $price_str = 'seven_price';
            break;
        case 8:
            $price_str = 'eight_price';
            break;
        case 9:
            $price_str = 'nine_price';
            break;
        case 10:
            $price_str = 'ten_price';
            break;
    }
    return $price_str;
}

/*
 * 获取一个新的流水号
 */
function createFlowNum($year){
    if(empty($year)){
        $year = date('Y');
    }
    //获取数据库中最后一个流水号
    $latestFlowNum = M('paylog')->order('id desc')->getField('serialsn');
    if(empty($latestFlowNum)){
        $newFlowNum = $year.'000001';
    }else{
        $newFlowNum = intval($latestFlowNum) +1;
    }
    return $newFlowNum;

}

/*
 * 对订单中模板类型产品进行开通
 * $order_id 订单id
 */
function enableOrderTemplate($order_id){
    if(empty($order_id)){
        return false;
    }
    //判断订单支付状态
    $order = D('Order')->detail($order_id);
    if(!$order['status']){
        return false;
    }
    //查询订单模板类型产品
    $templates = M('OrderGoods')->where('order_id='.$order_id.' AND type=5')->select();
    if(!empty($templates)){
        foreach($templates as $key=>$val){
            $buyConfig = json_decode($val['buy_config'],true);//购买配置
            $data = array(
                'tid' => $buyConfig['id'],//模板记录id
                'template_id' => $buyConfig['template_id'],//模板id
                'name' => $buyConfig['name'],//模板名称
                'create_time' => time(),//创建时间
                'expiry_time' => time()+86400*365,//一年有效期
                'status' => 1,//0:未开通 1:已开通 2:已过期
            );
            $res = M('user_template')->add($data);
            if($res){
                //修改订单产品的开通状态
                M('OrderGoods')->where('id='.$val['id'])->setField('product_status',1);//0:未开通 1:已开通 2:开通失败
            }
        }
    }

}

/**
 * @param $arr
 * @param $key_name
 * @return array
 * 将数据库中查出的列表以指定的 id 作为数组的键名
 */
function convert_arr_key($arr, $key_name)
{
    $arr2 = array();
    foreach($arr as $key => $val){
        $arr2[$val[$key_name]] = $val;
    }
    return $arr2;
}

/*
 * 优雅显示年月
 */
function formatYear($month){
    if(empty($month)){
        return false;
    }
    if($month<12){
        return $month.'个月';
    }
    if($month>=12){
        //大于12个月
        $mod = $month % 12;
        $floor = floor($month/12);
        if($mod==0){
            return $floor.'年';
        }else{
            return $floor.'年'.$mod.'个月';
        }

    }

}



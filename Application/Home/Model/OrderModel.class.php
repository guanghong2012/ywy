<?php
/**
 * Created by PhpStorm.
 * User: 温柔一刀
 * Date: 2017/2/27
 * Time: 17:41
 */
namespace Home\Model;
use Think\Model;
class OrderModel extends Model{
    protected $_auto = array(
        array('create_time', NOW_TIME, self::MODEL_INSERT),
    );

    //新增订单
    public function addOrder($data = null)
    {

        if(empty($data)){
            return false;
        }
        $id = $this->add($data);
        if(!$id){
            $this->error = '新增订单出错！';
            return false;
        }
        return $id;
    }

}
<?php
/**
 * Created by PhpStorm.
 * User: 温柔一刀
 * Date: 2017/2/28
 * Time: 10:05
 * 用户虚拟机模型
 */
namespace Home\Model;
use Think\Model;
class UserVitrualModel extends Model{
    /* 自动完成规则 */
    protected $_auto = array(
        array('create_time', NOW_TIME),
    );

    /*
     * 新增用户虚拟机
     */
    public function addVitrual($data=null)
    {
        if(empty($data)){
            $this->error = '缺少数据';
            return false;
        }
        if(empty($data['uid'])){
            $this->error = '缺少用户id';
            return false;
        }
        if($this->create($data)){
            $insertid = $this->add();
            return $insertid;
        }
    }

}
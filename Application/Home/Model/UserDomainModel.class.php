<?php
/**
 * Created by PhpStorm.
 * User: 温柔一刀
 * Date: 2017/2/28
 * Time: 9:57
 * 用户域名产品模型
 */
namespace Home\Model;
use Think\Model;
class UserDomain extends Model{

    /* 自动完成规则 */
    protected $_auto = array(
        array('create_time', NOW_TIME),
    );

    /*
     * 新增用户域名产品
     */
    public function addDomain($data=null)
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
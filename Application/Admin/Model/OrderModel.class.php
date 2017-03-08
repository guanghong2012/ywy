<?php
/**
 * Created by PhpStorm.
 * User: 温柔一刀
 * Date: 2017/3/8
 * Time: 16:28
 */
namespace Admin\Model;
use Think\Model;
class OrderModel extends Model{

    /**
     * 获取数据
     * @param  integer $id 文档ID
     * @return array       详细数据
     */
    public function detail($id){
        /* 获取基础数据 */
        $info = $this->field(true)->find($id);
        if(!(is_array($info) )){
            $this->error = '已删除！';
            return false;
        }

        return $info;
    }


}
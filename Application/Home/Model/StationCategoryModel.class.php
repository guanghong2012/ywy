<?php
/**
 * Created by PhpStorm.
 * User: 温柔一刀
 * Date: 2017/3/1
 * Time: 9:48
 */
namespace Home\Model;
use Think\Model;
class StationcategoryModel extends Model{
    /**
     * 获取分类数据
     * @param  integer $id 文档ID
     * @return array       详细数据
     */
    public function detail($id){
        /* 获取基础数据 */
        $info = $this->field(true)->find($id);
        if(!(is_array($info) )){
            $this->error = '分类已删除！';
            return false;
        }

        return $info;
    }
}
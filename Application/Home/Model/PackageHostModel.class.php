<?php
/**
 * Created by PhpStorm.
 * User: 温柔一刀
 * Date: 2017/3/2
 * Time: 11:50
 * 套餐云主机
 */
namespace Home\Model;
use Think\Model;
class PackageHostModel extends Model{
    /**
     * 获取详情页数据
     * @param  integer $id 文档ID
     * @return array       详细数据
     */
    public function detail($id){
        /* 获取基础数据 */
        $info = $this->field(true)->find($id);
        if(!(is_array($info) )){
            $this->error = '信息已删除！';
            return false;
        }
        return $info;
    }
}
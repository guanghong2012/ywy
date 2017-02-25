<?php
/**
 * Created by PhpStorm.
 * User: 温柔一刀
 * Date: 2017/2/24
 * Time: 11:33
 */
namespace Home\Model;
use Think\Model;
class CloudProductModel extends Model{

    /* 自动验证规则 */
    protected $_validate = array(
        array('name', 'require', '名称不能为空'),

    );

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
        //$info['os_type'] = explode(',',$info['os_type']);
        return $info;
    }


    /*
     * 删除
     */
    public function remove($map=array())
    {
        $res = $this->where($map)->delete();
        if($res){
            return true;
        }else{
            return false;
        }
    }

}
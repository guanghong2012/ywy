<?php
/**
 * Created by PhpStorm.
 * User: 温柔一刀
 * Date: 2017/2/24
 * Time: 10:56
 */

namespace Home\Model;
use Think\Model;

class CloudCategoryModel extends Model
{
    /* 自动验证规则 */
    protected $_validate = array(
        array('name', 'require', '类别名称不能为空'),
    );

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

    /**
     * 新增或更新一个文档
     * @param array  $data 手动传入的数据
     * @return boolean fasle 失败 ， int  成功 返回完整的数据
     * @author huajie <banhuajie@163.com>
     */
    public function update($data = null){

        /* 获取数据对象 */
        $data = $this->token(false)->create($data);
        if(empty($data)){
            return false;
        }

        /* 添加或新增基础内容 */
        if(empty($data['id'])){ //新增数据
            $id = $this->add(); //添加基础内容
            if(!$id){
                $this->error = '新增出错！';
                return false;
            }
        } else { //更新数据
            $status = $this->save(); //更新基础内容
            if(false === $status){
                $this->error = '更新内容出错！';
                return false;
            }
        }

        /*/行为记录
        if($id){
            action_log('add_document', 'document', $id, UID);
        }
        */

        //内容添加或更新完成
        return $data;
    }

    /*
     * 删除分类
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
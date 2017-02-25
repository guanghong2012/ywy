<?php
/**
 * Created by PhpStorm.
 * User: 温柔一刀
 * Date: 2017/2/25
 * Time: 15:44
 */
namespace Admin\Model;
use Think\Model;

class CpPriceModel extends Model{

    /* 自动验证规则 */
    protected $_validate = array(
        array('product_id', 'require', '新一代产品id不能为空'),
        array('pid', 'require', '产品id不能为空'),
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
        $info['os_type'] = explode(',',$info['os_type']);
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
        //$data = $this->token(false)->create($data);

        if(empty($data)){
            return false;
        }
        //主机类型是多选的
        if(is_array($data['os_type'])){
            $data['os_type'] = implode(',',$data['os_type']);
        }
        //保存价格信息
        /* 添加或新增基础内容 */
        if(empty($data['id'])){ //新增数据
            $id = $this->add($data); //添加基础内容
            if(!$id){
                $this->error = '新增内容出错！';
                return false;
            }

        } else { //更新数据
            $status = $this->save($data); //更新基础内容
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
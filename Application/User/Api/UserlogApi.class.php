<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/2/16
 * Time: 13:46
 */
namespace User\Api;
use User\Api\Api;
use Admin\Model\UserAccountLogModel;

class UserlogApi extends Api{
    /**
     * 构造方法，实例化操作模型
     */
    protected function _init(){
        $this->model = new UserAccountLogModel();
    }
    
    /*
     * 增加用户金额
     */
    public function addMoney($uid,$money,$desc='管理员调节',$admin_id=0)
    {
        return $this->model->addMoney($uid,$money,$desc,$admin_id);
    }

    /*
     * 减少用户金额
     */
    public function reduceMoney($uid,$money,$desc='管理员调节',$admin_id=0)
    {
        return $this->model->reduceMoney($uid,$money,$desc,$admin_id);
    }


}
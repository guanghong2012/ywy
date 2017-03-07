<?php
/**
 * Created by PhpStorm.
 * User: 温柔一刀
 * Date: 2017/3/6
 * Time: 15:19
 */
//计划任务执行接口
interface schedule {

    /**
     * 执行指定的计划任务,
     * 返回   返回 array("status"=>0/1, "attemp"=>0/1,  "info"=>string);
     * @param unknown_type $data
     */
    function exec($data);




}
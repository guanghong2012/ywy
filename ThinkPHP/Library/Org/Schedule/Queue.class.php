<?php
/**
 * Created by PhpStorm.
 * User: 温柔一刀
 * Date: 2017/3/6
 * Time: 14:29
 * 任务队列实现
 */

namespace Org\Schedule;


class Queue
{
    /*
     * 加入队列
     */
    public static function add($type,$name,$schedule_data,$schedule_time){
        $data = array();
        $data['type'] =$type;
        $data['name'] =$name;

        $data['data'] =serialize($schedule_data);
        if($schedule_time>0)$schedule_exec_time =$schedule_time;
        else $schedule_exec_time =time();
        $data['schedule_date'] =date("Y-m-d",$schedule_exec_time);
        $data['schedule_time'] =$schedule_exec_time;

        $data['id'] = M("schedule_list")->add($data);
        if($schedule_time==0 && $data['id'])
        {
            self::executeQueue($data);//立即执行计划任务
        }
    }

    //读取未执行的队列
    public static function getQueueTask($limit=10){
        $limit = (int)$limit;
        $res = M("schedule_list")->where('exec_status=0')->order('id asc')->limit($limit)->select();
        return $res;
    }
    
    //更新队列状态
    public static function updateTaskByID($id,$data=array())
    {
        $id = (int)$id;
        if(empty($data)){
            return false;
        }else{
            $res = M('schedule_list')->where('id='.$id)->save($data);
            return $res;
        }

    }
    
    //执行队列
    public static function executeQueue($schedule_data)
    {
        $type = $schedule_data['type'];
        $cname = $type . "_schedule";
        require_once(LIB_PATH.'Org/Schedule/'.$cname.'.php');
        $c = new $cname;
        $item_data = unserialize($schedule_data['data']);
        if ($schedule_data['exec_status'] == 0) $schedule_data['exec_begin_time'] = time();
        $result = $c->exec($item_data);
        if ($result['info']) {
            $schedule_data['exec_info'] = $result['info'];
        } else {
            unset($schedule_data['exec_info']);
        }
        if ($result['attemp']) {
            $schedule_data['exec_status'] = 1;
        } else {
            $schedule_data['exec_status'] = 2;
            $schedule_data['exec_end_time'] = time();
        }

        self::updateTaskByID($schedule_data['id'],$schedule_data);
        return $result;
    }

}
<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.thinkphp.cn>
// +----------------------------------------------------------------------

/**
 * 前台配置文件
 * 所有除开系统级别的前台配置
 */
return array(

    // 预先加载的标签库
    'TAGLIB_PRE_LOAD'     =>    'OT\\TagLib\\Article,OT\\TagLib\\Think',
        
    /* 主题设置 */
    'DEFAULT_THEME' =>  'ywy',  // 默认模板主题名称

    /* 数据缓存设置 */
    'DATA_CACHE_PREFIX' => 'onethink_', // 缓存前缀
    'DATA_CACHE_TYPE'   => 'File', // 数据缓存类型

    /* 文件上传相关配置 */
    'DOWNLOAD_UPLOAD' => array(
        'mimes'    => '', //允许上传的文件MiMe类型
        'maxSize'  => 5*1024*1024, //上传的文件大小限制 (0-不做限制)
        'exts'     => 'jpg,gif,png,jpeg,zip,rar,tar,gz,7z,doc,docx,txt,xml', //允许上传的文件后缀
        'autoSub'  => true, //自动子目录保存文件
        'subName'  => array('date', 'Y-m-d'), //子目录创建方式，[0]-函数名，[1]-参数，多个参数使用数组
        'rootPath' => './Uploads/Download/', //保存根路径
        'savePath' => '', //保存路径
        'saveName' => array('uniqid', ''), //上传文件命名规则，[0]-函数名，[1]-参数，多个参数使用数组
        'saveExt'  => '', //文件保存后缀，空则使用原后缀
        'replace'  => false, //存在同名是否覆盖
        'hash'     => true, //是否生成hash编码
        'callback' => false, //检测文件是否存在回调函数，如果存在返回文件信息数组
    ), //下载模型上传配置（文件上传类配置）

    /* 编辑器图片上传相关配置 */
    'EDITOR_UPLOAD' => array(
        'mimes'    => '', //允许上传的文件MiMe类型
        'maxSize'  => 2*1024*1024, //上传的文件大小限制 (0-不做限制)
        'exts'     => 'jpg,gif,png,jpeg', //允许上传的文件后缀
        'autoSub'  => true, //自动子目录保存文件
        'subName'  => array('date', 'Y-m-d'), //子目录创建方式，[0]-函数名，[1]-参数，多个参数使用数组
        'rootPath' => './Uploads/Editor/', //保存根路径
        'savePath' => '', //保存路径
        'saveName' => array('uniqid', ''), //上传文件命名规则，[0]-函数名，[1]-参数，多个参数使用数组
        'saveExt'  => '', //文件保存后缀，空则使用原后缀
        'replace'  => false, //存在同名是否覆盖
        'hash'     => true, //是否生成hash编码
        'callback' => false, //检测文件是否存在回调函数，如果存在返回文件信息数组
    ),

    /* 模板相关配置 */
    'TMPL_PARSE_STRING' => array(
        '__STATIC__' => __ROOT__ . '/Public/static',
        '__ADDONS__' => __ROOT__ . '/Public/' . MODULE_NAME . '/Addons',
        '__IMG__'    => __ROOT__ . '/Public/' . MODULE_NAME . '/images',
        '__CSS__'    => __ROOT__ . '/Public/' . MODULE_NAME . '/css',
        '__JS__'     => __ROOT__ . '/Public/' . MODULE_NAME . '/js',
        '__YWY__'     => __ROOT__ . '/Public/' . MODULE_NAME .'/ywy',
    ),

    /* SESSION 和 COOKIE 配置 */
    'SESSION_PREFIX' => 'onethink_home', //session前缀
    'COOKIE_PREFIX'  => 'onethink_home_', // Cookie前缀 避免冲突

    /**
     * 附件相关配置
     * 附件是规划在插件中的，所以附件的配置暂时写到这里
     * 后期会移动到数据库进行管理
     */
    'ATTACHMENT_DEFAULT' => array(
        'is_upload'     => true,
        'allow_type'    => '0,1,2', //允许的附件类型 (0-目录，1-外链，2-文件)
        'driver'        => 'Local', //上传驱动
        'driver_config' => null, //驱动配置
    ), //附件默认配置

    'ATTACHMENT_UPLOAD' => array(
        'mimes'    => '', //允许上传的文件MiMe类型
        'maxSize'  => 5*1024*1024, //上传的文件大小限制 (0-不做限制)
        'exts'     => 'jpg,gif,png,jpeg,zip,rar,tar,gz,7z,doc,docx,txt,xml', //允许上传的文件后缀
        'autoSub'  => true, //自动子目录保存文件
        'subName'  => array('date', 'Y-m-d'), //子目录创建方式，[0]-函数名，[1]-参数，多个参数使用数组
        'rootPath' => './Uploads/Attachment/', //保存根路径
        'savePath' => '', //保存路径
        'saveName' => array('uniqid', ''), //上传文件命名规则，[0]-函数名，[1]-参数，多个参数使用数组
        'saveExt'  => '', //文件保存后缀，空则使用原后缀
        'replace'  => false, //存在同名是否覆盖
        'hash'     => true, //是否生成hash编码
        'callback' => false, //检测文件是否存在回调函数，如果存在返回文件信息数组
    ), //附件上传配置（文件上传类配置）


    /* 支付设置 */
    'payment' => array(
        'tenpay' => array(
            // 加密key，开通财付通账户后给予
            'key' => 'e82573dc7e6136ba414f2e2affbe39fa',
            // 合作者ID，财付通有该配置，开通财付通账户后给予
            'partner' => '1900000113'
        ),
        'alipay' => array(
            // 收款账号邮箱
            'email' => 'zfb@qbt8.com',
            // 加密key，开通支付宝账户后给予
            'key' => '44nidenw7x2ncnog9ejhouwsghs05sai',
            // 合作者ID，支付宝有该配置，开通易宝账户后给予
            'partner' => '2088421734014770'
        ),
        'aliwappay' => array(
            // 收款账号邮箱
            'email' => 'chenf003@yahoo.cn',
            // 加密key，开通支付宝账户后给予
            'key' => 'aaa',
            // 合作者ID，支付宝有该配置，开通易宝账户后给予
            'partner' => '2088101000137799'
        ),
        'palpay' => array(
            'business' => 'zyj@qq.com'
        ),
        'yeepay' => array(
            'key' => '69cl522AV6q613Ii4W6u8K6XuW8vM1N6bFgyv769220IuYe9u37N4y7rI4Pl',
            'partner' => '10001126856'
        ),
        'kuaiqian' => array(
            'key' => '1234567897654321',
            'partner' => '1000300079901'
        ),
        'unionpay' => array(
            'key' => '88888888',
            'partner' => '105550149170027'
        )
    ),

    'UNIONPAY' => array(// 银联配置
        //测试环境参数
        'frontUrl' => 'https://101.231.204.80:5000/gateway/api/frontTransReq.do', //测试环境前台交易请求地址
        //'frontUrl' => 'https://gateway.95516.com/gateway/api/frontTransReq.do', //生产环境前台交易请求地址

        'singleQueryUrl' => 'https://101.231.204.80:5000/gateway/api/backTransReq.do', //测试环境单笔查询请求地址
        //'singleQueryUrl' => 'https://gateway.95516.com/gateway/api/queryTrans.do', //生产环境单笔查询请求地址

        'signCertPath' =>getcwd().'/Public/cer/acp_test_sign.pfx', //签名证书路径 这个证书就是你在https://open.unionpay.com/ajweb/account/testPara 上面下载的那个商户私钥证书 供你测试使用
        //'signCertPath' =>getcwd().'/Public/cer/acp_prod_sign.pfx', //签名证书路径 这个证书就是你在 商户开通邮件里面叫你去 http://cs.cfca.com.cn/ 下载并把私钥上传至商户服务网站并启用的那个私钥文件

        'signCertPwd' => '000000', //测试环境签名证书密码
        //'signCertPwd' => '135246', //生产环境证书签名证书密码 这个密码是你在IE导出上述私钥文件时候你自己定义的6位数字密码

        //'verifyCertPath' => getcwd().'/Public/cer/verify_sign_acp.cer', //测试环境验签证书路径
        'verifyCertPath' => getcwd().'/Public/cer/acp_prod_verify_sign.cer', //验签证书路径

        'merId' => '777290058138754', //测试商户代码
        //'merId' => '802440048160893', //生产环境商户代码 从你的商户开通邮件里面有


    ),
    'UNIONPAY_CONFIG'=>array(// 银联配置
        'version' => '5.0.0', //版本号
        'encoding' => 'GBK', //编码方式
        'signMethod' => '01', //签名方式
        'txnType' => '01', //交易类型
        'txnSubType' => '01', //交易子类
        'bizType' => '000201', //产品类型
        'channelType' => '07',//渠道类型
        'frontUrl' => "http://win2.qbt8.com/ywyw/index.php/Home/Cart/OrderOk", //前台通知地址
        'backUrl' => "http://win2.qbt8.com/ywyw/index.php/Home/ypay/notify", //后台通知地址
        'frontFailUrl' => "http://win2.qbt8.com/ywyw/index.php/Home/ypay/pay_fail", //失败交易前台跳转地址
        'accessType' => '0', //接入类型
        'merId' => '777290058138754', //测试商户代码
        //'merId' => '802440048160893', //生产环境商户代码
        'txnTime' => date('YmdHis'), //订单发送时间
        'currencyCode' => '156', //交易币种
    ),



);

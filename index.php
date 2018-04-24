<?php
/**
 * 前端页面加载
 * @copyright (c) Emlog All Rights Reserved
 */

require_once 'init.php';

define('TEMPLATE_PATH', TPLS_PATH.Option::get('nonce_templet').'/');//前台模板路径
//echo TEMPLATE_PATH;exit;     //  /var/www/html/emlog_3/content/templates/default/    --by fangchao
$emDispatcher = Dispatcher::getInstance();
//var_dump($emDispatcher);exit;
//echo 'i am fangchao'; exit;//
$emDispatcher->dispatch();
View::output();

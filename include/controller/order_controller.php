<?php
/**
 * 下订单
 *复制的 comment_controller  要修改  数据库等
 * @copyright (c) Emlog All Rights Reserved
 */

class Order_Controller {
    function addOrder($params) {
        $count = isset($_POST['order_count']) ? addslashes(trim($_POST['order_count'])) : '';
        $color = isset($_POST['colorlist']) ? addslashes(trim($_POST['colorlist'])) : '';
        $size = isset($_POST['sizelist']) ? addslashes(trim($_POST['sizelist'])) : '';
		$blogId = isset($_POST['gid']) ? intval($_POST['gid']) : -1;
		//echo $count.' and '.$color.' and '.$size;exit;
/*
        if (ISLOGIN === true) {
            $CACHE = Cache::getInstance();
            $user_cache = $CACHE->readCache('user');
            $name = addslashes($user_cache[UID]['name_orig']);
            $mail = addslashes($user_cache[UID]['mail']);
            $url = addslashes(BLOG_URL);
        }

        if ($url && strncasecmp($url,'http',4)) {
            $url = 'http://'.$url;
        }

        doAction('comment_post');
*/
        $Order_Model = new Order_Model();
        $Order_Model->setCommentCookie($count,$color,$size);
        $Order_Model->addOrder($blogId,$count,$color,$size);
		/*
        if($Comment_Model->isLogCanComment($blogId) === false) {
            emMsg('评论失败：该文章已关闭评论');
        } elseif ($Comment_Model->isCommentExist($blogId, $name, $content) === true) {
            emMsg('评论失败：已存在相同内容评论');
        } elseif (ROLE == ROLE_VISITOR && $Comment_Model->isCommentTooFast() === true) {
            emMsg('评论失败：您提交评论的速度太快了，请稍后再发表评论');
        } elseif (empty($name)) {
            emMsg('评论失败：请填写姓名');
        } elseif (strlen($name) > 20) {
            emMsg('评论失败：姓名不符合规范');
        } elseif ($mail != '' && !checkMail($mail)) {
            emMsg('评论失败：邮件地址不符合规范');
        } elseif (ISLOGIN == false && $Comment_Model->isNameAndMailValid($name, $mail) === false) {
            emMsg('评论失败：禁止使用管理员昵称或邮箱评论');
        } elseif (!empty($url) && preg_match("/^(http|https)\:\/\/[^<>'\"]*$/", $url) == false) {
            emMsg('评论失败：主页地址不符合规范','javascript:history.back(-1);');
        } elseif (empty($content)) {
            emMsg('评论失败：请填写评论内容');
        } elseif (strlen($content) > 8000) {
            emMsg('评论失败：内容不符合规范');
        } elseif (ROLE == ROLE_VISITOR && Option::get('comment_needchinese') == 'y' && !preg_match('/[\x{4e00}-\x{9fa5}]/iu', $content)) {
            emMsg('评论失败：评论内容需包含中文');
        } elseif (ISLOGIN == false && Option::get('comment_code') == 'y' && session_start() && (empty($imgcode) || $imgcode !== $_SESSION['code'])) {
            emMsg('评论失败：验证码错误');
        } else {
            $_SESSION['code'] = null;
            $Comment_Model->addComment($name, $content, $mail, $url, $imgcode, $blogId, $pid);
        }*/
    }
}

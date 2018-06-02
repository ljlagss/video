<?php
/**
 * Created by PhpStorm.
 * User: ljl
 * Date: 2018/5/21
 * Time: 20:54
 */

namespace app\admins\controller;

use think\Controller;
use Util\data\Sysdb;

class BaseAdmin extends controller
{
    public function __construct()
    {
        parent::__construct();
        $this->_admin = session('admin');
        //未登录用户不允许访问
        if(!$this->_admin){
            header('Location:/admins.php/admins/Account/login');
            exit;
        }
        //判断用户是否有权限


        $this->assign('admin',$this->_admin);
        $this->db = new Sysdb;
    }

}
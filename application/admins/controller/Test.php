<?php
/**
 * Created by PhpStorm.
 * User: ljl
 * Date: 2018/5/21
 * Time: 12:25
 */

namespace app\admins\controller;

use think\Controller;
use  Util\data\Sysdb;
class Test extends controller
{
    public function index()
    {
        $this->db = new Sysdb;
        $res = $this->db->table('admins')->field('id,username')->lists();
        dump($res);

        $res2 = $this->db->table('admins')->field('id,username')->cates('id');
        dump($res2);
    }
}
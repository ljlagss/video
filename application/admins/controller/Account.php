<?php
namespace app\admins\controller;

use think\Controller;
use Util\data\Sysdb;

class Account extends controller
{
    public function login()
    {
       return $this->fetch();
    }

    //管理员登录
    public function dologin()
    {
        $username = trim(input('post.username'));
        $pwd = trim(input('post.pwd'));
        $verifycode = trim(input('post.verifycode'));

        if($username == ''){
            exit(json_encode(array('code'=>1,'msg'=>'用户名不能为空')));
        }
        if($pwd == ''){
            exit(json_encode(array('code'=>1,'msg'=>'密码名不能为空')));
        }
        if($verifycode == ''){
            exit(json_encode(array('code'=>1,'msg'=>'请输入验证码')));
        }

        //验证验证码
        if(!captcha_check($verifycode)){
            exit(json_encode(array('code'=>1,'msg'=>'验证码错误')));
        }

        //验证用户
        $this->db = new Sysdb;
        $admin = $this->db->table('admins')->where(array('username'=>$username))->item();
        if(!$admin){
            exit(json_encode(array('code'=>1,'msg'=>'用户名不存在')));
        }
        if(md5($pwd) != $admin['password']){
            exit(json_encode(array('code'=>1,'msg'=>'密码错误')));
        }
        if($admin['status'] == 1){
            exit(json_encode(array('code'=>1,'msg'=>'用户已经被禁用')));
        }

        //设置用户session
        session('admin',$admin);
        exit(json_encode(array('code'=>0,'msg'=>'登陆成功')));
    }

    //退出
    public function logout()
    {
        session('admin',null);
        exit(json_encode(array('code'=>0,'msg'=>'退出成功')));
    }
}

<?php
/**
 * Created by PhpStorm.
 * User: ljl
 * Date: 2018/5/27
 * Time: 17:23
 */

namespace app\admins\controller;

//系统设置
class Site extends BaseAdmin
{

    public function index()
    {
        $site = $this->db->table('sites')->where(array('names'=>'site'))->item();
        $site && $site['values'] = json_decode($site['values']);
        $this->assign('site',$site);
        return $this->fetch();
    }

    //保存
    public function save()
    {
        $title = trim(input('post.title'));
        $site = $this->db->table('sites')->where(array('names'=>'site'))->item();
        if(!$site){
            $this->db->table('sites')->insert(array('names'=>'site','values'=>json_encode($title)));
        }else{
            $value['values'] = json_encode($title);
            $this->db->table('sites')->where(array('names'=>'site'))->update($value);
        }
        exit(json_encode(array('code'=>0,'msg'=>'保存成功')));
    }
}
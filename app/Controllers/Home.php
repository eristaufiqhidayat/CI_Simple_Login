<?php

namespace App\Controllers;

use App\Models\MMenu;

class Home extends BaseController
{
    public function index($menuAktip = '', $moduleAktip = '')
    {
        if (isset(user()->username)) {
            helper('text');
            $menu = new MMenu();
            $datamenu = $menu->listing();

            $data = array(
                'title'        => '',
                'content'    => 'home/index',
                'menu'   =>  $datamenu,
                'menuAktip' => $menuAktip,
                'moduleAktip' => $moduleAktip
            );
        } else {
            return redirect()->to(site_url('/login'));
        }

        return view('Home/V_Dasboard', $data);
    }
    public function login2()
    {
        helper('text');

        //return view('Home/V_Login');
        return redirect()->to(site_url('C_Home/index'));
    }
}

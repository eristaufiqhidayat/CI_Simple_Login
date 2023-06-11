<?php

namespace App\Controllers\Admin;

use App\Controllers\BaseController;
use App\Models\Admin\MModule;
use App\Models\Admin\MDataMenu;
use App\Models\MMenu;

class CMenu extends BaseController
{
    public function index($menuAktip = '', $moduleAktip = '')
    {
        helper('text');

        $menu = new MMenu();
        $datamenu = $menu->listing();
        $model = new MDataMenu();
        //$datamenu2 = $model->findAll();
        $datamenu2 = $model->jointmodule();

        $data = array(
            'title'        => 'Data Module',
            'DataMenu'    => $datamenu2,
            'menu'   =>  $datamenu,
            'menuAktip' => $menuAktip,
            'moduleAktip' => $moduleAktip
        );
        return view('Admin/VDataMenu', $data);
    }
    public function tambah($menuAktip = '', $moduleAktip = '')
    {
        $menumodel = new MDataMenu();
        $datamenu           = new \App\Entities\EDataMenu();
        $datamenu->id_module = $this->request->getPost('id_module');
        $datamenu->path    = $this->request->getPost('path');
        $datamenu->menu    = $this->request->getPost('menu');
        $datamenu->icon    = $this->request->getPost('icon');

        $menumodel->save($datamenu);
        return redirect()->back()->with('message', lang('Auth.userupdate'));
        // End masuk database

    }
    public function rubah($menuAktip = '', $moduleAktip = '')
    {

        $menumodel = new MDataMenu();
        $datamenu = $menumodel->find($this->request->getPost('id_menu'));
        unset($datamenu->id_module);
        unset($datamenu->path);
        unset($datamenu->menu);
        unset($datamenu->icon);

        if (!isset($datamenu->id_module)) {
            $datamenu->id_module = $this->request->getPost('id_module');
            $datamenu->path    = $this->request->getPost('path');
            $datamenu->menu    = $this->request->getPost('menu');
            $datamenu->icon    = $this->request->getPost('icon');
        }
        $menumodel->save($datamenu);

        return redirect()->back()->with('message', lang('Auth.userupdate'));
    }
    public function delete($menuAktip = '', $moduleAktip = '')
    {
        helper('form');
        //$menu = new M_Menu();
        //$datamenu = $menu->listing();  
        $session = \Config\Services::session();
        $validated =  $this->validate([
            'id_menu'     => 'required'
        ]);
        if ($validated) {
            $data = array(
                'id_menu'    => $this->request->getVar('id_menu'),
            );
            $model = new MDataMenu();
            $model->delete($data);
            $session->setFlashdata('sukses', 'Data telah dihapus');
            return redirect()->to(base_url('index.php/menu/index/' . $menuAktip . '/' . $moduleAktip));
            // End masuk database
        }
    }
}

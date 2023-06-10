<?php

namespace App\Controllers\Admin;

use App\Controllers\BaseController;
use App\Models\MMenu;
use App\Models\Admin\MGroups;
use App\Models\Admin\MUser;

class CGroups extends BaseController
{
    public function index($menuAktip = '', $moduleAktip = '')
    {
        helper('text');

        $menu = new MMenu();
        $datamenu = $menu->listing();
        $model = new MGroups();
        $datamenu2 = $model->findAll();
        $data = array(
            'title'        => 'Data Menu',
            'DataMenu'    => $datamenu2,
            'menu'   =>  $datamenu,
            'menuAktip' => $menuAktip,
            'moduleAktip' => $moduleAktip
        );
        return view('Admin/VGroups', $data);
    }
    public function indexGroupsUsers($menuAktip = '', $moduleAktip = '')
    {
        helper('text');

        $menu = new MMenu();
        $datamenu = $menu->listing();
        $group = new MGroups();
        $user = new MUser();
        $dataGroup = $group->listing();
        $dataUser = $user->listing();
        $datamenu2 = $group->listingGroupsUsers();
        $data = array(
            'title'        => 'Data Menu',
            'DataMenu'    => $datamenu2,
            'DataGroup'    => $dataGroup,
            'DataUser'    => $dataUser,
            'menu'   =>  $datamenu,
            'menuAktip' => $menuAktip,
            'moduleAktip' => $moduleAktip
        );
        return view('Admin/VGroupsUsers', $data);
    }
    public function indexPermissionGroups($menuAktip = '', $moduleAktip = '')
    {
        helper('text');

        $menu = new MMenu();
        $datamenu = $menu->listing();
        $model = new MGroups();
        $datamenu2 = $model->listingPermissionGroups();
        $groupPermission = $model->listingPermissionGroups2();
        $permissions = $model->listingPermissions();
        $group = $model->listingGroups();
        $data = array(
            'title'        => 'Data Menu',
            'DataMenu'    => $datamenu2,
            'menu'   =>  $datamenu,
            'menuAktip' => $menuAktip,
            'moduleAktip' => $moduleAktip,
            'permission' => $permissions,
            'group' => $group,
            'groupPermission' => $groupPermission,
        );
        return view('Admin/V_PermissionGroups', $data);
    }
    public function permissionGroupsAdd($menuAktip = '', $moduleAktip = '')
    {
        helper('form');
        //$menu = new M_Menu();
        //$datamenu = $menu->listing();
        $session = \Config\Services::session();

        $validated =  $this->validate([
            'group_id'     => 'required',
        ]);
        if ($validated) {
            $data = array(
                'group_id'    => $this->request->getVar('group_id[]'),
                'name'    => $this->request->getVar('name'),
                'description'    => $this->request->getVar('description'),

            );

            $model = new MGroups();
            $model->listingPermissionGroupsTrunc(); //hapus data 
            foreach ($data['group_id'] as $key => $val) {
                foreach ($val as $namaModule) {
                    echo $key . "=>" . $namaModule . "<br>";
                    $data = array(
                        'group_id'    => $key,
                        'permission_id'    => $namaModule,
                    );
                    $model->listingPermissionGroupsAdd($data);
                }
                $data = "";
            }
            $session->setFlashdata('sukses', 'Data telah ditambah');
            return redirect()->to(base_url('index.php/permissionGroups/index/' . $menuAktip . '/' . $moduleAktip));
            // End masuk database
        }
    }
    public function tambah()
    {
        $authorize = service('authorization');
        $authorize->createGroup($this->request->getPost('name'), $this->request->getPost('description'));
        return redirect()->back()->with('message', lang('Auth.userupdate'));
    }
    public function rubah()
    {
        //$authorize = service('authorization');
        //$authorize->updateGroup($this->request->getPost('id'), $this->request->getPost('name'), $this->request->getPost('description'));
        $groups = new MGroups();
        $group = $groups->find($this->request->getPost('id'));
        $group->name = $this->request->getPost('name');
        $group->description = $this->request->getPost('description');
        if (!$groups->save($group)) {
            return redirect()->back()->with('message', lang('Auth.userupdate'));
        }
        $authorize = service('authorization');
        $authorize->createPermission('blog.posts.manage');
        return redirect()->back()->with('message', lang('Auth.userupdate'));
    }
    public function hapus()
    {
        $authorize = service('authorization');
        $authorize->deleteGroup($this->request->getPost('id'));
        return redirect()->back()->with('message', lang('Auth.userupdate'));
    }
    public function ubahGroupUser($menuAktip = '', $moduleAktip = '')
    {
        helper('form');
        $session = \Config\Services::session();
        $validated =  $this->validate([
            'group_id'     => 'required',
            'user_id'     => 'required'
        ]);
        if ($validated) {
            $model = new MGroups();
            if ($model->cekGroupUser($this->request->getVar('user_id'))) {
                $model->rubahGroupUser($this->request->getVar('group_id'), $this->request->getVar('user_id'));
                $session->setFlashdata('msg', 'Data sukses dirubah');
            } else {
                $model->addGroupUser($this->request->getVar('group_id'), $this->request->getVar('user_id'));
                $session->setFlashdata('error', 'Data gagal dirubah');
            }

            return redirect()->to(base_url('index.php/groupsUsers/index/' . $menuAktip . '/' . $moduleAktip));
            // End masuk database
        } else {
            $session->setFlashdata('error', 'Data Gagal disimpan Validasi Error');
            return redirect()->to(base_url('index.php/groupsUsers/index/' . $menuAktip . '/' . $moduleAktip));
        }
    }
}

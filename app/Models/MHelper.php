<?php

namespace App\Models;

use CodeIgniter\Model;

class MHelper extends Model
{
    protected $DBGroup          = 'default';
    protected $table            = 'users';
    protected $primaryKey       = 'username';
    protected $useAutoIncrement = true;
    protected $returnType       = 'array';
    protected $useSoftDeletes   = false;
    protected $protectFields    = true;
    protected $allowedFields    = [];

    // Dates
    protected $useTimestamps = false;
    protected $dateFormat    = 'datetime';
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';

    // Validation
    protected $validationRules      = [];
    protected $validationMessages   = [];
    protected $skipValidation       = false;
    protected $cleanValidationRules = true;

    // Callbacks
    protected $allowCallbacks = true;
    protected $beforeInsert   = [];
    protected $afterInsert    = [];
    protected $beforeUpdate   = [];
    protected $afterUpdate    = [];
    protected $beforeFind     = [];
    protected $afterFind      = [];
    protected $beforeDelete   = [];
    protected $afterDelete    = [];
    public function listingGroupsUsers($username)
    {
        $db = db_connect();
        $query = $db->query("SELECT * 
                            FROM auth_groups_users
                            left join auth_groups on auth_groups.id = auth_groups_users.group_id
                            left join users on users.id = auth_groups_users.user_id
                            where users.username = '$username'  
                            ");
        return $query->getResult('array');
    }
    public function listingGroups()
    {
        $db = db_connect();
        $query = $db->query("SELECT * FROM auth_groups ");
        return $query->getResult('array');
    }
    public function listingmodule()
    {
        $db = db_connect();
        $query = $db->query("SELECT * FROM tbl_module ");
        return $query->getResult('array');
    }
}

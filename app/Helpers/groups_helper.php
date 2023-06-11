<?php

use App\Models\MHelper;

function groupsname($username)
{
    $cek = new MHelper();
    $cek = $cek->listingGroupsUsers($username);
    return $cek;
}
function groupsall()
{
    $cek = new MHelper();
    $cek = $cek->listingGroups();
    return $cek;
}
function listmodule()
{
    $cek = new MHelper();
    $cek = $cek->listingmodule();
    return $cek;
}

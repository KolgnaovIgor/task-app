<?php

spl_autoload_register('myAutoLoader');

function myAutoLoader($className){
    $path = 'classes/';
    $ext = '.php';
    $fullPath = $path . $className . $ext;

    require_once $fullPath;
}
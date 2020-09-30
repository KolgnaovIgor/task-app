<?php

class Main{
    private $host = '127.0.0.1';
    private $name = 'mysql';
    private $password = 'mysql';
    private $db = 'apartments';
    private $login_admin = 'admin';
    private $password_admin = '123';


    protected function connect(){
        $link = mysqli_connect($this->host, $this->name, $this->password, $this->db);
        if (mysqli_connect_errno()) {
            echo 'Error connection to DB (' . mysqli_connect_errno() . ')' . mysqli_connect_error();
            exit();
        }
        mysqli_set_charset($link, 'utf8');
        return $link;
    }
}
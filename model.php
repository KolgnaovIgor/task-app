<?php

session_start();

class Model extends Main{
    private $offset;
    private $cookie;
    private $limit = 3;

    protected function putData($idus, $show, $name, $email, $text, $cookie, $edited){
        if($idus === 0){
            $sql_put_data = "INSERT INTO tasks (show_task, name_user, email, text_task, mark, edited) VALUES ('$show', '$name', '$email', '$text', '$cookie', '$edited')";
        } else {
            $sql_put_data = "UPDATE tasks SET show_task = '$show', text_task = '$text', edited = '$edited' WHERE id='$idus'";
        }
        $result = mysqli_query($this->connect(), $sql_put_data);
        mysqli_close($this->connect());
    }

    protected function getData($cookie, $offset, $limit, $sort){
        $this->cookie = $cookie;
        $offset < 0 ? $this->offset = 0 : $this->offset = $offset;
        $this->limit = $limit;

        $sql_get_data = "SELECT * FROM tasks ORDER BY $this->cookie $sort LIMIT $this->offset, $this->limit ";
        $result = mysqli_query($this->connect(), $sql_get_data);
        return mysqli_fetch_all($result, MYSQLI_ASSOC);
    }

    protected function regAdmin(){
        $sql_get_ad_data = "SELECT * FROM useradmin";
        $result = mysqli_query($this->connect(), $sql_get_ad_data);
        return mysqli_fetch_all($result, MYSQLI_ASSOC);
    }
}
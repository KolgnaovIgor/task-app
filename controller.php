<?php

session_start();

require "../loaderclasses.php";

class Controller extends Model {
    private $login;
    private $password;

    public function puttingData($idus, $show, $name, $email, $text, $cookie, $edited){
        $this->putData($idus, $show, $name, $email, $text, $cookie, $edited);
        header('Location: http://tasksapp/');
    }

    public function checkAndPut($idus, $checked, $name, $email, $text, $button){
        if ($button !== 'Сохранить изменения'){
            if ($name === '' || strlen($name) < 3 || $email === '' || (!preg_match("/[0-9a-z]+@[a-z]/", $email)) || $text === '' || strlen($text) < 7) {

                if ($name === '' || strlen($name) < 3) {
                    $_SESSION['message'] = 'Введено не верное имя';
                } elseif ($email === '' || (!preg_match("/[0-9a-z]+@[a-z]/", $email))){
                    $_SESSION['message'] = 'Введена не верная почта';
                } elseif($text === '' || strlen($text) < 20){
                    $_SESSION['message'] = 'Текст задачи должен быть больше 7-ти символов';
                }

                header('Location: http://tasksapp/');
            }else{
                $_SESSION['message'] = 'Задача успешно добавлена!';
                $this->puttingData(0,0, $name, $email, $text, $_COOKIE["task_cookie"], 0);
            }
        }else{
            $this->puttingData($idus, $checked, $name, $email, $text, $_COOKIE["task_cookie"], 1);
        }

    }

    public function registrAdmin($login, $password){
        $this->login = $login;
        $this->password = $password;

        $data_admin = $this->regAdmin();
        if ($data_admin[0]['login'] ==  $this->login && $data_admin[0]['password'] === $password){
            $_SESSION['admin'] = 'registrok';
            $_SESSION['message_admin'] = '';
        }else{
            $_SESSION['admin'] = '';
            $_SESSION['message_admin'] = 'Введены не корректные данные!';
        }
        header('Location: http://tasksapp/');
    }
}
$putting_data = new Controller();

if ($_POST['button']){
    isset($_POST['checked']) == true ? $checked = 1 : $checked = 0;
    $putting_data->checkAndPut($_POST['id-user'], $checked, $_POST['name'], $_POST['email'], $_POST['text'], $_POST['button']);
    $_SESSION['message_admin'] = '';
}else{
    if($_POST['second-button'] === 'Выйти из под Администратора'){
        $putting_data->registrAdmin('', '');
    }else{
        $putting_data->registrAdmin($_POST['name-ad'], $_POST['password']);
    }
    $_SESSION['message'] = '';
}

<?php

    session_start();
    !isset($_SESSION['count']) ? $_SESSION['count'] = 0 : $_SESSION['count'];
    !isset($_SESSION['name']) ? $_SESSION['name'] = id : $_SESSION['name'];
    !isset($_SESSION['sort']) ? $_SESSION['sort'] = DESC : $_SESSION['sort'];


    if (!$_COOKIE["task_cookie"]){
        $value_cookie = time();
        setcookie("task_cookie", $value_cookie, time()+3600*1000);
    }
    $_COOKIE["task_cookie"];


    require "loaderclasses.php";

    if(((int)$_POST['button-navigation'] - 1) * 3 < 0){
        $_SESSION['count'];
    }else{
        $_SESSION['count'] = ((int)$_POST['button-navigation'] - 1) * 3;
        $_SESSION['message'] = '';
        $_SESSION['message_admin'] = '';
    }

    switch ($_POST['sort-button']){
        case 'Имя': $_SESSION['name'] = name_user; break;
        case 'Почта': $_SESSION['name'] = email; break;
        case 'Статус': $_SESSION['name'] = show_task; break;
        case 'Номер записи': $_SESSION['name'] = id; break;
        case 'По возрастанию': $_SESSION['sort'] = ASC; break;
        case 'По убыванию': $_SESSION['sort'] = DESC; break;
    }


    $get_data = new View();
    $take_data = $get_data->getTasks($_SESSION['name'], $_SESSION['count'], 3, $_SESSION['sort']);
    $take_data_all = $get_data->getTasks($_SESSION['name'], 0, 1000, $_SESSION['sort']);
?>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link rel="stylesheet" href="styles/styles.css">

    <title>Document</title>
</head>
<body>


<div class="task-box-block">
    <div class="task-block">
        <form action="" method="post">
            <?php
            if ($_SESSION['name'] === name_user) {
                echo '<p>Сортировка по Имени</p>';
            } elseif($_SESSION['name'] === email) {
                echo '<p>Сортировка по Почте</p>';
            }elseif($_SESSION['name'] === show_task){
                echo '<p>Сортировка по Статусу</p>';
            }elseif($_SESSION['name'] === id){
                echo '<p>Сортировка по Номеру записи</p>';
            }
            ?>
            <?php
            if ($_SESSION['sort'] === ASC) {
                echo '<p>Сортировка по возрастанию &#8595;</p>';
            } else {
                echo '<p>Сортировка по убыванию &#8593;</p>';
            }
            ?>
            <p>Страница: <?php echo($_SESSION['count'] / 3 + 1); ?></p>
            <input type="submit" name="sort-button" id="sort-button" value="Имя">
            <input type="submit" name="sort-button" id="sort-button" value="Почта">
            <input type="submit" name="sort-button" id="sort-button" value="Статус">
            <input type="submit" name="sort-button" id="sort-button" value="Номер записи"><br><br>
            <input type="submit" name="sort-button" id="sort-button" value="По возрастанию">
            <input type="submit" name="sort-button" id="sort-button" value="По убыванию">
        </form>
        <?php foreach ($take_data as $value):?>
        <div class="each-task">
            <form action="classes/controller.php" method="post">
            <?php
            if(!$_SESSION['admin']){
                if($value['edited'] === '1'){
                    echo '<p style="color: blue;">Отредактировано Администратором</p><br>';
                }
            }
            ?>
            <?php
                if($_SESSION['admin']){
                    echo '<input style="width: 20px;" readonly name="id-user" value="' . $value['id'] . '">';
                }else{
                    echo '<p name="id-user"><b>'. $value['id'] . ' - </b></p>';
                }
            ?>
            <p><?= $value['name_user'] ?></p>
            <?php
            if ($value['show_task'] === '1') {
                echo '<p style="font-weight: bold; color: green; margin-right: 5px;">Выполнено</p>';
            } else {
                echo '<p style="font-weight: bold; color: red; margin-right: 5px;">В работе</p>';
            }
            if($_SESSION['admin']){
                if ($value['show_task'] === '1') {
                    echo '<input type="checkbox" name="checked" checked>';
                } else {
                    echo '<input type="checkbox" name="checked">';
                }
            }
            ?>
            <br>
            <p style="font-size: 14px;"><?= $value['email'] ?></p><br>
            <p style="font-size: 18px;"><?= $value['text_task'] ?></p>
            <?php
            if($_SESSION['admin']){
                echo '<textarea name="text" id="" style="width: 100%; height: 30px; resize: none; border: 1px solid red; border-radius: 2px;">' . $value['text_task'] . '</textarea><br><input style="width: 100%; margin-top: 3px;" type="submit" name="button" id="button-change" value="Сохранить изменения">';
            }
            ?>
            </form>
        </div>
        <?php endforeach;?>
        <form action="" method="post">
            <?php $i = 0;?>
            <?php foreach ($take_data_all as $val):?><?php ++$i;?><?php endforeach;?>
            <?php for ($m = 1; $m < ceil($i/3) + 1; $m++):?>
                <input type="submit" name="button-navigation" id="button-page" value="<?= $m;?>">
            <?php endfor;?>
        </form>
    </div>
</div>


<div class="form-task-box-block">
    <div class="form-task-block">
        <form action="classes/controller.php" method="post">
            <?php
            if ($_SESSION['message'] === 'Задача успешно добавлена!'){
                echo '<p style="color: green;">' . $_SESSION['message'] . '</p>';
            }else{
                echo '<p style="color: red;">' . $_SESSION['message'] . '</p>';
            }
            ?>
            <input type="text" id="form-name" name="name" placeholder="Введите Ваше имя">
            <input type="text" id="form-email" name="email" placeholder="Введите Вашу почту">
            <textarea type="text" name="text" placeholder="Введите текст задачи"></textarea>
            <input type="submit" id="form-button" name="button" value="Разместить задачу">
        </form><br>
        <form action="classes/controller.php" method="post">
            <?php
            if($_SESSION['message_admin']){
                echo '<p style="color: red;">' . $_SESSION['message_admin'] . '</p>';
            }
            ?>
            <input type="name" name="name-ad" id="form-name" placeholder="Введите логин">
            <input type="password" name="password" id="form-name" placeholder="Введите пароль">
            <input type="submit" id="form-button" name="second-button" value="Войти как Администратор">
            <?php
            if ($_SESSION['admin'] === 'registrok'){
                echo '<input type="submit" id="form-button" name="second-button" value="Выйти из под Администратора">';
            }
            ?>
        </form>
    </div>
</div>


</body>
</html>
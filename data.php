<?php

function database_connect(){

    /** Подключение к бд */
    $host = "localhost";
    $dbuser = "root";
    $dbpass = "";
    $dbname = "site_teach";

    $con = mysqli_connect($host, $dbuser, $dbpass, $dbname);

    if (!$con) {
        die("Ошибка подключения: " . mysqli_connect_error());
    }

    return $con;

}


function user_auth($email, $password){

    $con = database_connect();
    mysqli_set_charset($con, "utf8");

    $sql = "SELECT * FROM users WHERE email = ? AND пароль = ?";
    $stmt = mysqli_prepare($con, $sql);
    mysqli_stmt_bind_param($stmt, "ss", $email, $password);
    mysqli_stmt_execute($stmt);

    $result = mysqli_stmt_get_result($stmt);

    if (!$result) {
        $error = mysqli_error($con);
        mysqli_stmt_close($stmt);
        mysqli_close($con);
        die("Ошибка MySQL: " . $error);
    }

    $user = mysqli_fetch_assoc($result);

    mysqli_stmt_close($stmt);
    mysqli_close($con);

    if ($user) {
        if ($user['пароль']) {
            return $user;
        }
    }

    return false;

}

function user_project($id_user){

    $con = database_connect();
    mysqli_set_charset($con, "utf8");

    $sql = "SELECT `id`, `название`, `site_title` FROM `site_teach`.`projects` WHERE `пользователь_id` = ?";
    $stmt = mysqli_prepare($con, $sql);
    mysqli_stmt_bind_param($stmt, "i", $id_user);
    mysqli_stmt_execute($stmt);

    $result = mysqli_stmt_get_result($stmt);

    if (!$result) {
        $error = mysqli_error($con);
        mysqli_stmt_close($stmt);
        mysqli_close($con);
        die("Ошибка MySQL: " . $error);
    }

    $projects = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $projects[] = $row;
    }

    mysqli_stmt_close($stmt);
    mysqli_close($con);

    return $projects;

}

function project_count_tasks($id_project){

    $con = database_connect();
    mysqli_set_charset($con, "utf8");

    $sql = "SELECT COUNT(*) as task_count FROM `site_teach`.`tasks` WHERE `проект_id` = ?";
    $stmt = mysqli_prepare($con, $sql);
    mysqli_stmt_bind_param($stmt, "i", $id_project);
    mysqli_stmt_execute($stmt);

    $result = mysqli_stmt_get_result($stmt);

    if (!$result) {
        $error = mysqli_error($con);
        mysqli_stmt_close($stmt);
        mysqli_close($con);
        die("Ошибка MySQL: " . $error);
    }

    $row = mysqli_fetch_assoc($result);
    $taskCount = (int) $row['task_count'];

    mysqli_stmt_close($stmt);
    mysqli_close($con);

    return $taskCount;

}



$projects = [
    "Inbox" => "Входящие",
    "Studies" => "Учеба",
    "Job" => "Работа",
    "Household chores" => "Домашние дела",
    "Auto" => "Авто"
];
$tasks = [
    [
        "title" => "Собеседование в IT компании",
        "date" => "17.03.2025",
        "category" => "Работа",
        "ready" => "false",
        "file" => ""
    ],
    [
        "title" => "Выполнить тестовое задание",
        "date" => "07.05.2025",
        "category" => "Работа",
        "ready" => "false",
        "file" => ""
    ],
    [
        "title" => "Сделать задание первого раздела",
        "date" => "21.12.2025",
        "category" => "Учеба",
        "ready" => "true",
        "file" => ""
    ],
    [
        "title" => "Встреча с другом",
        "date" => "	20.12.2025",
        "category" => "Входящие",
        "ready" => "false",
        "file" => ""
    ],
    [
        "title" => "Купить корм для кота",
        "date" => "",
        "category" => "Домашние дела",
        "ready" => "false",
        "file" => ""
    ],
    [
        "title" => "Заказать пиццу",
        "date" => "",
        "category" => "Домашние дела",
        "ready" => "false",
        "file" => ""
    ],
];
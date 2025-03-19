<?php

function project_num($project, $arr){
    $result = '0';

    foreach ($arr as $key => $task):

        if($task["category"] == $project){
            $result++;
        }

    endforeach;

    return $result;
}

function date_check($date){

    date_default_timezone_set('Europe/Moscow');
    $take_date = date_create($date);
    $cur_date = date_create();

    if($date == ""){
        $result = 99;
    }else if($cur_date > $take_date){
        $result = 0;
    }else{
        $diff = date_diff($take_date, $cur_date);
        $months = $diff->m;
        $days = $diff->d;

        $total_days = $months * 30 + $days;

        $total_hours = $total_days * 24 + $diff->h;


        $result = $total_hours;
    }

    return $result;
}



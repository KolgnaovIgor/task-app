<?php

class View extends Model{
    public function getTasks($cookie, $offset, $limit, $sort){
        return $this->getData($cookie, $offset, $limit, $sort);
    }
}
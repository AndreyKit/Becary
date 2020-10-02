<?php


namespace Model;

use Core\Config;
use mysqli;
use TexLab\MyDB\DbEntity;

class EatModel extends DbEntity
{
    public function __construct(string $tableName, mysqli $mysqli)
    {
        parent::__construct($tableName, $mysqli);
    }


    /*
     * Возвращает список всех блюд
     * */
    public function getEat()
    {
        $data = $this->runSQL('SELECT `id`,`nameEat` FROM `eat`');
        $result = [];
        foreach ($data as $row) {
            $result[$row['id']] = $row['nameEat'];
        }
        return $result;
    }

    /*
    * Фильтр статуса активных блюд
    * */
    public function getEatStatusFilter(int $page)
    {
        
        return $this
            ->reset()
            ->setSelect('*')
            ->setFrom('`eat`')
            ->setWhere("`statusdish` = 'Актуально'")
            ->getPage($page);
    }

    /*
     * подсчёт страниц
    * */
    public function pageCountEatStatus()
    {
        
        return ceil($this->runSQL("SELECT COUNT(*) as count FROM eat WHERE statusdish='Актуально'")[0]['count'] / $this->pageSize);
    }

}
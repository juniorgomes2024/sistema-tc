<?php
class entradacliente{
    private $host = 'localhost';
    private $user = 'root';
    private $password = ''; 
    private $database = 'fabricadecampeoes';
    private $port = '3306';

    public function connection(){
        $connection = mysqli_connect($this->host, $this->user, $this->password, $this->database, $this->port);
        mysqli_set_charset($connection, 'utf8');
        return $connection;
    }

    public function select($query){
        $connection = $this->connection();
        $result = mysqli_query($connection, $query);
        $data = mysqli_fetch_all($result, MYSQLI_ASSOC);
        mysqli_close($connection);
        return $data;
    }

    public function insert($query){
        
        $connection = $this->connection();
        $result=mysqli_query($connection, $query);

        if(!$result){
            echo mysqli_error($connection);
        }

        mysqli_close($connection);
        return $result;
    }
    public function update($query){
        $connection = $this->connection();
        $result=mysqli_query($connection, $query);

        if(!$result){
            echo mysqli_error($connection);
        }

        mysqli_close($connection);
        return $result;
    }
    public function delete($query){
        $connection = $this->connection();
        $result=mysqli_query($connection, $query);

        if(!$result){
            echo mysqli_error($connection);
        }

        mysqli_close($connection);
        return $result;
    }
}
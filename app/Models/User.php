<?php
namespace App\Models;

use App\Core\Model;
use App\Contracts\Authenticatable;
use App\Traits\Authenticatable as AuthenticatableTrait;

class User extends Model implements Authenticatable
{
    use AuthenticatableTrait;

    protected static $table = 'users';
}
<?php

namespace App\Models;
use Laravel\Passport\HasApiTokens;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class items extends Model
{
  use HasApiTokens, Notifiable;
  public $table = "items";
  /**
  * The attributes that are mass assignable.
  *
  * @var array
  */
  protected $fillable = [
   'name','price','Description','image','name_category','size',
  ];
  
  }
<?php

namespace App\Models;
use Laravel\Passport\HasApiTokens;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class application extends Model
{
  use HasApiTokens, Notifiable;
  public $table = "application";
  /**
  * The attributes that are mass assignable.
  *
  * @var array
  */
  protected $fillable = [
   'id_user','status','appName','companyName','phone','location','domain','logo','description','payment','currency'
   ,'categories','barsPosition','productView','productSlider','productSaleSlider',
   'productIconView','topbarColor','buttonsColor','textColor','footerColor',
  ];
  



  }
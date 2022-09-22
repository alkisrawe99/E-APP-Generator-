<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Auth; 
use Illuminate\Support\Facades\DB; 

use App\Models\category;
use View;
use Illuminate\Http\Request;
use App\Models\User; 
use App\Models\application; 

use Session;

Session::put('load','false');
class dashController extends Controller
{

    

    public function usershow()
    {
        $data=User::all();
        return view('usershow',['user'=>$data]);
    }
    public function adminindex()
    {

        $sql=DB::select("select id_user from application where status='0' ");
        $b=array();
        for ($x = 0; $x <count($sql); $x++)
        {
           array_push( $b, $sql[$x]->id_user );
        }
      
        $s= DB::select('select id,name,phone,email from users where id in(' . implode(',', array_map('intval', $b)) . ')');
        if ($s){
           return View::make("adminindex")->with(array('order'=>$s));
          // return view('adminlogin',['order'=>$s]);

        }
     
       
    }


    


    public function logout()
    {
        Session::put('load','false');
        return view('adminlogin');
    }



    public function admin_login(Request $request) {
       if ($request->email=="admin" && $request->password=="admin")
       {
        Session::put('load','true');
        $sql=DB::select("select id_user from application where status='0' ");
        $b=array();
        for ($x = 0; $x <count($sql); $x++)
        {
           array_push( $b, $sql[$x]->id_user );
        }
      
        $s= DB::select('select id,name,phone,email from users where id in(' . implode(',', array_map('intval', $b)) . ')');
        if ($s){
           return View::make("adminindex")->with(array('order'=>$s));
          // return view('adminlogin',['order'=>$s]);

        }
       }
       else
       { 
        return view('adminlogin'); 
    } 

    }



    public function delete_user($id)
    {
        $data=User::find($id);
        $data->delete();
        return redirect('usershow');
    }


    public function show_order($id)
    {
        $sql=DB::select("select * from application where id_user='{$id}' ");

        return View::make("order")->with(array('show'=>$sql));
    }





    public function genrate(Request $request)
    { 
        $id=$request->id;
        $host=$request->name;

        function generateRandomString($length = 10) {
            $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
            $charactersLength = strlen($characters);
            $randomString = '';
            for ($i = 0; $i < $length; $i++) {
                $randomString .= $characters[rand(0, $charactersLength - 1)];
            }
            return $randomString;
        }


        
        function replace($file,$find,$re){
        file_put_contents($file,str_replace($find,$re,file_get_contents($file)));
        }
    
  
     $sql=DB::select("select * from application where id='{$id}' ");
      $appname=$sql[0]->appName;
      $topbarColor=$sql[0]->topbarColor;
      $buttonsColor=$sql[0]->buttonsColor;
      $textColor=$sql[0]->textColor;
      $footerColor=$sql[0]->footerColor;
     $productSaleSlider=$sql[0]->productSaleSlider;

     
   

      $file="C:/Users/User/Desktop/genrate.bat";
     replace($file,"appname",$appname);
    
      shell_exec('C:/Users/User/Desktop/genrate.bat');

      $eenv="C:/wamp643/www/$appname/.env";
      $database="DB_DATABASE=e-commerce";
      $new_data="DB_DATABASE=$appname";
      replace($eenv,$database,$new_data);




 $fi = 'C:/wamp643/www/a.sh';

$fappname='--appname "alaa"';
$rappname="--appname "."$appname"."";
replace($fi,$fappname,$rappname);





$fbundleId='com.onatcipli.networkUpp';
$rbundleId='com.a'.generateRandomString().'.a'.generateRandomString();
replace($fi,$fbundleId,$rbundleId);




$fpasskey='key_password';
$rpasskey='aiu'.generateRandomString();
replace($fi,$fpasskey,$rpasskey);
replace("C:/Users/User/Desktop/flutter_genrate/alaatest1/android/key.properties",$fpasskey,$rpasskey);

$cart_choise='C:/Users/User/Desktop/flutter_genrate/alaatest1/lib/Choice/Cart_Choice.dart';
$history_choise='C:/Users/User/Desktop/flutter_genrate/alaatest1/lib/Choice/History_Choice.dart';
$home_choices='C:/Users/User/Desktop/flutter_genrate/alaatest1/lib/Choice/home-tab-choices.dart';

$textColor_old='static const Color font_color=Color(0xFFFF0000)';
$textColor_new="static const Color font_color=Color(0xFF$textColor)";
replace($cart_choise,$textColor_old,$textColor_new);
replace($history_choise,$textColor_old,$textColor_new);
replace($home_choices,$textColor_old,$textColor_new);

$buttonsColor_old='static const Color Button=Color(0xFFFF0000)';
$buttonsColor_new="static const Color Button=Color(0xFF$buttonsColor)";
replace($cart_choise,$buttonsColor_old,$buttonsColor_new);
replace($history_choise,$buttonsColor_old,$buttonsColor_new);
replace($home_choices,$buttonsColor_old,$buttonsColor_new);

$textColor_old='static const Color Button=Color(0xFFFF0000)';
$textColor_new="static const Color Button=Color(0xFF$textColor)";
replace($cart_choise,$textColor_old,$textColor_new);
replace($cart_choise,"#","");
replace($history_choise,$textColor_old,$textColor_new);
replace($history_choise,"#","");
replace($home_choices,$textColor_old,$textColor_new);
replace($home_choices,"#","");


$api='C:/Users/User/Desktop/flutter_genrate/alaatest1/lib/services/api_services.dart';
$host_old='192.168.43.52:8000';
$host_new=$host;
replace($api,$host_old,$host_new);


shell_exec('C:/wamp643/www/a.sh');

exec('c:\WINDOWS\system32\cmd.exe /c START C:/wamp643/www/move.bat');



      return $host ;
    }
  

}

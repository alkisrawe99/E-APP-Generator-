<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth; 
use Illuminate\Support\Facades\DB; 
use App\Models\User; 
use App\Models\history;
use App\Models\application;
use Validator;
use Illuminate\Support\Facades\Input;

class admincontroller extends Controller
{
    public $successStatus = 200;

    public function login(Request $request){ 
       

        $email=request('email');
        $password=request('password');
        $sql= DB::select("select id from users where email='{$email}' and password='{$password}'");
        if ($sql != null){
            $id["id"]=$sql[0]->id;
      
        return response()->json($id,$this-> successStatus); 
        } 
        else{ 
            return response()->json('error', 205); 
        } 
    }




    public function register(Request $request) 
    {      
        $validator = Validator::make($request->all(), [ 

            'name' => 'required', 
            'email' => 'required|email', 
            'password' => 'required', 
            
        ]);
if ($validator->fails()) { 
            return response()->json(['error'=>$validator->errors()], 401);            
        }
$input = $request->all(); 


        $user = User::create($input); 
       
        $success['token'] =  $user->createToken('MyApp')-> accessToken; 
        $success['name'] =  $user->name;
       
       
        
return response()->json( $this-> successStatus); 
    }





    public function add_application(Request $request) 
    { 
        $validator = Validator::make($request->all(), [ 
            'id_user' => 'required',
            'appName' => 'required',
            'companyName' => 'required', 
            'phone'=> 'required',
            'location'=>'required',
            
                 
        ]);
if ($validator->fails()) { 
            return response()->json(['error'=>$validator->errors()], 401);            
        }


        $reImage=rand(10,1000000000);
        $ext= $request->file('logo')->getClientOriginalExtension();
        $final_name=$reImage.'.'.$ext;
        $request->file('logo')->move('image',$final_name);
       
        





        $data=application::create([ 'id_user' => $request->id_user, 
        'appName' => $request->appName, 
        'companyName' => $request->companyName,
        'phone' => $request->phone,
        'location' => $request->location, 
        'domain' => $request->domain, 
        'description' => $request->description, 
        'payment' => $request->payment,
        'currency' => $request->currency,
        'categories' => $request->categories,
        'barsPosition' => $request->barsPosition, 
        'productView' => $request->productView, 
        'productSlider' => $request->productSlider,
        'productSaleSlider' => $request->productSaleSlider,
        'productIconView' => $request->productIconView, 
        'topbarColor' => $request->topbarColor, 
        'buttonsColor' => $request->buttonsColor, 
        'textColor' => $request->textColor,
        'footerColor' => $request->footerColor,
        'logo' => $final_name,
       ]);  $success['name'] =  $user->name;
       
       
       history::create([ 'id_user' => $data->id_user, 
       'id_app' => $data->id,  ]); 

       
return response()->json($this-> successStatus); 
    }


    public function user_profile(Request $request)
    {
        $id=$request->id_user;
        $sql=DB::select("select id,name,email,password,phone from users where id='{$id}'");
        

        $sql2=DB::select("select id from history where id_user='{$id}'");

        if($sql2){
            $sql3=DB::select("select appName from application where id_user='{$id}'");
            return response()->json([$sql,$sql3],$this-> successStatus); 

        }
        return response()->json($sql,$this-> successStatus); 
        
    }



}

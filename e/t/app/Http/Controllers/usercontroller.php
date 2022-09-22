<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Auth; 
use Illuminate\Support\Facades\DB; 
use App\Models\car;
use App\Models\category;
use Validator;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use App\Models\User; 
use App\Models\cart;
use App\Models\save;
use App\Models\items;
use App\Models\history;
use App\Models\sale;
use Illuminate\Support\Facades\Route;
use Session;


class UserController extends Controller
{
public $successStatus = 200;
/** 
     * login api 
     * $success['token'] =  $user->createToken('MyApp')-> accessToken; 
       * $success['id'] =  $user->id;
     * @return \Illuminate\Http\Response 
     */ 
    
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
    
    
    
/** 
 * 
 * 
     * Register api 
     * 
     * @return \Illuminate\Http\Response 
     */ 
    public function register(Request $request) 
    {      
        $validator = Validator::make($request->all(), [ 
            
            
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

    public function get_item($id) 
    { 
       
        $success=items::find($id);
       return response()->json([$success],200);

        
    }
    

    public function get_user(Request $request) 
    { 
       $id=$request->id_user;
       $sql= DB::select("select name,email,password,amount,location from users where id='{$id}'");
       return response()->json($sql,200);

        
    }
    public function view_items(){
       

        $sql=DB::select('select id,name,name_category,price,Description,size,image from items');
  
        
        return response()->json( $sql, $this-> successStatus); 
        
            }



           
       

                public function view_category(){
                    $sql=DB::select('select id,name,image from category');
                  
                    return response()->json($sql, $this-> successStatus); 
                    
                        }
          
        
    
    public function item_category(Request $request,$name)
    {
        
        $member_info = items::where('name_category',$name)
                 ->get();
    
        return Response()->json($member_info, 200);
    }




    


   
    public function add_cart(Request $request) 
    { 
        
       

        $validator = Validator::make($request->all(), [ 
            'id_user' => 'required', 
            
            'id_item' => 'required', 
                 
        ]);
if ($validator->fails()) { 
            return response()->json(['error'=>$validator->errors()], 401);            
        }
$input = $request->all(); 

        $cart = cart::create($input); 
    
        $success['id_user'] =  $cart->id_user;
        $success['id_item'] =  $cart->id_item;
       
    
       
        
return response()->json( $this-> successStatus); 
    }




    public function search_item(Request $request)
{
    $data = $request->get('data');
    $member_info = items::where('name', 'like', "%{$data}%")
             ->get();

    return Response()->json($member_info, 200);
}




    public function history(Request $request) 
    {
     
        $id_user= $request->id_user;
        $sql= DB::select('select id_item from history where id_user=?',[$id_user]);
      
        $b=array();
        for ($x = 0; $x <count($sql); $x++)
        {
           array_push( $b, $sql[$x]->id_item );
        }
      
        $s= DB::select('select * from items where id in(' . implode(',', array_map('intval', $b)) . ')');
          return response()->json($s, $this-> successStatus);


    }

        



    public function delete_all_history(Request $request) 
    { 
        $id_user= $request->id_user;
            
      $sql= DB::select("select id from history where id_user='{$id_user}'");

      
      for ($x = 0; $x <count($sql); $x++)
      {
         
         $success=history::find($sql[$x]->id);
         $success->delete();
      }
      
      

     return response()->json(200);
      
      
  }







    public function delete_save(Request $request) 
    { 
        
        

        $id_user= $request->id_user;
        $id_item= $request->id_item;



      $sql= DB::select("select id from save where id_user='{$id_user}' and id_item='{$id_item}'");

      $success=save::find($sql[0]->id);
         
      $result=$success->delete();
      if( $result){
    
     return response()->json(200);
      }
      else{

          return response()->json(['message'=>'error not found'],401);
      }
      
  }

  public function get_sale(){
    
    $sql= DB::select("select id,name,price_old,price_new,image   from sale ");
     return response()->json($sql,200);

  }




            public function add_save(Request $request) 
    { 
        $validator = Validator::make($request->all(), [ 
            'id_user' => 'required', 
            'id_item' => 'required',  
        ]);
if ($validator->fails()) { 
            return response()->json(['error'=>$validator->errors()], 401);            
        }
$input = $request->all();
        $save = save::create($input); 
        $success['id_user'] =  $save->id_user;
        $success['id_item'] =  $save->id_item;
return response()->json( $this-> successStatus); 
    }

    
    public function view_save($id){
        $sql= DB::select('select id_item from save where id_user=?',[$id]);
      
      $b=array();
      for ($x = 0; $x <count($sql); $x++)
      {
         array_push( $b, $sql[$x]->id_item );
      }
    
      $s= DB::select('select id,name,name_category,price,Description,size,image from items where id in(' . implode(',', array_map('intval', $b)) . ')');
        return response()->json($s, $this-> successStatus); 
    
             }
 





    public function delete_cart(Request $request) 
        { 
            
            

            $id_user= $request->id_user;
            $id_item= $request->id_item;



          $sql= DB::select("select id from cart where id_user='{$id_user}' and id_item='{$id_item}'");

          $success=cart::find($sql[0]->id);
             
          $result=$success->delete();
          if( $result){
        
         return response()->json(200);
          }
          else{
  
              return response()->json(['message'=>'error not found'],200);
          }
          
      }




    public function delete_all_cart(Request $request) 
        { 
            $id_user= $request->id_user;
                
          $sql= DB::select("select id from cart where id_user='{$id_user}'");

          
          for ($x = 0; $x <count($sql); $x++)
          {
             
             $success=cart::find( $sql[$x]->id);
             $success->delete();
          }
          
          

         return response()->json(200);
          
          
      }
            

      public function view_cart($id){
        $sql= DB::select('select id_item from cart where id_user=?',[$id]);
      
      $b=array();
      for ($x = 0; $x <count($sql); $x++)
      {
         array_push( $b, $sql[$x]->id_item );
      }
    
      $s= DB::select('select id,name,name_category,price,Description,size,image from items where id in(' . implode(',', array_map('intval', $b)) . ')');
 
        return response()->json($s, $this-> successStatus); 
    
             }
 

    public function amount(Request $request) 
    { 
      $id_user= $request->id_user;
      $sql_get_item= DB::select("select id_item from cart where id_user='{$id_user}'");
      $sum=0;
      for ($x = 0; $x <count($sql_get_item); $x++)
      {
          $sql_get_price= DB::select("select price from items where id='{$sql_get_item[$x]->id_item}'");

         $sum +=$sql_get_price[0]->price;
        
      }
      $price["total"]=$sum;


      $sql_get_price_user=DB::select("select amount from users where id='{$id_user}'");

       $price["amount"]=$sql_get_price_user[0]->amount;
      return response()->json([$price],200);
  }




      public function buy(Request $request) 
      { 
        $id_user= $request->id_user;
        $sql_get_item= DB::select("select id_item from cart where id_user='{$id_user}'");
        $sum=0;
        for ($x = 0; $x <count($sql_get_item); $x++)
        {
            $sql_get_price= DB::select("select price from items where id='{$sql_get_item[$x]->id_item}'");

            $sum +=$sql_get_price[0]->price;
          
        }
        $sql_get_price_user=DB::select("select amount from users where id='{$id_user}'");
        
        if($sql_get_price_user[0]->amount >=$sum){

            for ( $x = 0; $x <count($sql_get_item); $x++){
         history::create([ 'id_user' => $id_user,  
        'id_item'=> $sql_get_item[$x]->id_item,]);
        
            }
            DB::table('cart')->where('id_user', $id_user)->delete();
           $amount_new= $sql_get_price_user[0]->amount - $sum;

            $up = user::find($id_user);
            $up->update(["amount"=>$amount_new]);
            return response()->json(200);
        }

         else{
                return response()->json(404);
                 }
 }


  
         


}
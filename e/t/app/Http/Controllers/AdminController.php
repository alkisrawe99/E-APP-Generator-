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
use App\Models\items; 
use App\Models\sale;
use App\Models\size_items;
use App\Models\image_items;
use Illuminate\Support\Facades\Route;
use Session;

Session::put('load','false');
class AdminController extends Controller
{

    

    public function usershow()
    {
        $data=User::all();
        return view('usershow',['user'=>$data]);
    }
    public function adminindex()
    {
        return view('adminindex');
    }


    public function productsshow()
    {
        $data=items::all();
        return view('productsshow',['ca'=>$data]);
    }



    public function products()
    {
        $data=category::all();
        return view('products',['ca'=>$data]);
    }



    public function show_categorys()
    {
        $data=category::all();
        return view('show_category',['ca'=>$data]);
    }


    public function categories()
    {
        return view('categories');
    }

    public function sale()
    {
        return view('sale');
    }


    public function logout()
    {
        Session::put('load','false');
        return view('adminlogin');
    }


    public function add_products(Request $request) {
        
        $items = new items;
       // $size_items=new size_items;
       
        $items-> name = $request->name;
       $items->price = $request->price ;
       $items-> Description = $request->description;
       $items->name_category = $request->category ;
       $items->size = $request->size ;
       //$size_items->size = $request->size ;
       

       $reImage=rand(10,1000000000);
       $ext= $request->file('image')->getClientOriginalExtension();
       $final_name=$reImage.'.'.$ext;
       $request->file('image')->move('image',$final_name);
       $items->image= $final_name ;
       $items->save();
       //$size_items->id_item = $items->id ;
       //$size_items->save();
       //$items->size = $size_items->id ;
       //$items->save();
       return view('adminindex');
    }




    public function add_category(Request $request) {


        
       
        $category = new category;  
        $reImage=rand(10,1000000000);
       $ext= $request->file('image')->getClientOriginalExtension();
       $final_name=$reImage.'.'.$ext;
       $request->file('image')->move('image',$final_name);
       $category-> name = $request->name;
       $category-> image =  $final_name;
       $category->save();
       return view('adminindex');
    }



    public function admin_login(Request $request) {
       if ($request->email=="admin" && $request->password=="admin")
       {
        Session::put('load','true');
        return view('adminindex');
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



    public function delete_products($id)
    {
        $data=items::find($id);
        $data->delete();
        return redirect('productsshow');
    }



    public function delete_category($id)
    {
        $data=category::find($id);
        $data->delete();
        return redirect('show_categorys');
    }

    public function delete_sale($id)
    {
        $data=sale::find($id);
        $data->delete();
        return redirect('saleshow');
    }


    
    public function show_user($id)
    {
        $data=User::find($id);
        return view('update_user',['user'=>$data]);
    }


   
    public function saleshow()
    {
        $data=sale::all();
        return view('saleshow',['ca'=>$data]);
    }

    public function show_category($id)
    {
        $data=category::find($id);
        return view('update_category',['category'=>$data]);
    }



    public function show_products($id)
    {
        $data=items::find($id);
        $data1=category::all();
        return view('update_product',['items'=>$data],['ca'=>$data1]);
    }


    public function update_user(Request $request)
    {
        $data =User::find($request->id);
       $data->email = $request->email;
       $data->password = $request->password;
       $data->amount = $request->amount;
       $data->location = $request->location;
            $data->save();
            return redirect('usershow');
      }



      public function update_category(Request $request)
      {
          $data =category::find($request->id);

          $reImage=rand(10,1000000000);
          $ext= $request->file('image')->getClientOriginalExtension();
          $final_name=$reImage.'.'.$ext;
          $request->file('image')->move('image',$final_name);

         $data->name = $request->name;
         $data->image = $final_name;
              $data->save();
              return redirect('show_categorys');
        }



        public function update_prodact(Request $request)
        {
            $data =items::find($request->id);
            $data-> name = $request->name;
            $data->price = $request->price ;
            $data-> Description = $request->Description;
            $data->name_category = $request->category ;
            $data->size = $request->size ;
            $reImage=rand(10,1000000000);
          $ext= $request->file('image')->getClientOriginalExtension();
          $final_name=$reImage.'.'.$ext;
          $request->file('image')->move('image',$final_name);
          $data->image = $final_name;
            $data->save();
            
            
                $data->save();
                return redirect('productsshow');
          }
  
          public function add_sale(Request $request) {


        
       
            $sale = new sale;  
            $reImage=rand(10,1000000000);
           $ext= $request->file('image')->getClientOriginalExtension();
           $final_name=$reImage.'.'.$ext;
           $request->file('image')->move('image',$final_name);


           $sale-> name = $request->name;
           $sale-> image =  $final_name;
           $sale-> price_old = $request->price_old;
           $sale-> price_new =$request->price_new;
           $sale->save();
           return view('adminindex');
        }
}

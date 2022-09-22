import 'dart:convert';

import 'package:alaatest1/Choice/login_choice.dart';
import 'package:alaatest1/constants.dart';
import 'package:alaatest1/models/Login_user.dart';
import 'package:alaatest1/screens/rigister.dart';
import 'package:alaatest1/Choice/user_choice.dart';

import 'package:alaatest1/widgets/custom_button.dart';
import 'package:alaatest1/widgets/custom_input.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../services/api_services.dart';
import '../tabs/home_tab.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool is_logged_in=false;
  api_services a= api_services();
  String _loginEmail="";
  String _loginpassword="";
  bool _loginformloading=false;
  FocusNode _passfocusnode=FocusNode();
  bool logged_in=false;
  Future<void> _alertDialogBuilder(String error) async
  {
    return showDialog(context: context, barrierDismissible: false, builder: (context) {
      return AlertDialog(
        content: Container(
          child: Text(error),
        ),
        actions: [
          TextButton(onPressed: () {Navigator.pop(context);}, child: Text("close dialog"))
        ],
      );
    }
    );
  }
  Future<dynamic> loginAccount()async{
    var response = await http.post(
        Uri.parse(a.base_url+"api/login/"), body: ({
      'email': _loginEmail,
      'password': _loginpassword
    }));

    var data= jsonDecode(response.body);
    if (response.statusCode == 200) {
      is_logged_in=true;


      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeTab()));
      SaveData s = SaveData();
      s.setId(data['id']);
      return  ;



    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("invalid credintials")));
      return "error";
    }


  }

  save(String token) async
  {
    final prefs=await SharedPreferences.getInstance();
    final key="token";
    final value=token;
    prefs.setString(key, value);
  }
  save_id(String id) async
  {
    final prefs=await SharedPreferences.getInstance();
    final key="id";
    final value=id;
    prefs.setString(key, value);
  }

  read() async
  {
    final prefs=await SharedPreferences.getInstance();
    final key="token";

    return prefs.get(key) ?? 0;
  }
  read_id() async
  {
    final prefs=await SharedPreferences.getInstance();
    final key="id";

    return prefs.get(key) ?? 0;
  }
  void _submitform() async{
    setState(() {
      _loginformloading=true;
    });
    String _signinfeedback = await loginAccount();
    if (_signinfeedback !=null)
    {
      _alertDialogBuilder(_signinfeedback);
      setState(() {
        _loginformloading=false;
      });
    }

  }
  @override
  void initState()
  {
    _passfocusnode=FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Loginchoice.background_color,
      body: SafeArea(
        child:Container(
          width:double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                Container(padding: EdgeInsets.only(top: 24.0),
                    child: Text("wellcome USER, \n login to your account",textAlign: TextAlign.center,style: TextStyle(fontSize: Loginchoice.font_size,color: Loginchoice.font_color),)),
                Column(
                    children: [Custominput(hinttext: "Email", onchanged:(value){_loginEmail=value;},onsubmit: (value){_passfocusnode.requestFocus();},textInputAction: TextInputAction.next,ispasswordfield: false,),
                      Custominput(hinttext: "password",onchanged: (value){_loginpassword=value;},focusNode: _passfocusnode, onsubmit: (value){_submitform();},textInputAction: TextInputAction.done,ispasswordfield: true,),
                      Custombtn(c:Loginchoice.Button,text: "Login",onpressed:(){_submitform();  setState(() {
                        _loginformloading=true;
                      });},
                        outlinebtn: false,loading:_loginformloading ,) ]),
                Padding(
                    padding: const EdgeInsets.only(bottom: 16.0,),
                    child:MaterialButton(child:Text("Create New Account",style: TextStyle(fontSize: Loginchoice.font_size)),color: Loginchoice.Button,  onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Rigisterpage()));})),
              ]
          ),
        ),
      ),
    );
  }
}

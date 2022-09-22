
import 'package:alaatest1/Choice/register_choice.dart';
import 'package:alaatest1/constants.dart';
import 'package:alaatest1/tabs/home_tab.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Choice/login_choice.dart';
import '../constants.dart';
import '../services/api_services.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_input.dart';
import 'package:http/http.dart' as http;

import 'login_page.dart';

class Rigisterpage extends StatefulWidget {

  @override
  State<Rigisterpage> createState() => _RigisterpageState();
}

class _RigisterpageState extends State<Rigisterpage> {
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passcontroller=TextEditingController();
  Future<void> _alertDialogBuilder(String error) async
  {
    return showDialog(context: context, barrierDismissible: false, builder: (context) {
      return AlertDialog(
        content: Container(
          //child: Text(error),
        ),
        actions: [
          TextButton(onPressed: () {Navigator.pop(context);}, child: Text("close dialog"))
        ],
      );
    }
    );
  }
  Future<void>register() async {
    api_services a=api_services();
    var response = await http.post(
        Uri.parse(a.base_url+"api/register/"), body: ({
      'email': emailcontroller.text,
      'password': passcontroller.text
    }));
    if (response.statusCode == 200) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeTab()));
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("invalid credintials")));
    }

  }

  bool _rigisterformloading=false;
  FocusNode _passfocusnode=FocusNode();
  @override
  void initState()
  {
    _passfocusnode=FocusNode();
    super.initState();
  }
  @override
  void dispose()
  {
    _passfocusnode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Registerchoice.background_color,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(padding: EdgeInsets.only(top: 24.0),
                    child: Text(
                      "Create New Account", textAlign: TextAlign.center,
                      style: TextStyle(fontSize: Registerchoice.font_size,color: Registerchoice.font_color),)),
                Column(
                  children: [Custominput( hinttext: "Email", onchanged:(value){emailcontroller.text=value;},onsubmit: (value){_passfocusnode.requestFocus();},textInputAction: TextInputAction.next,ispasswordfield: false,),
                    Custominput(hinttext: "password",onchanged: (value){passcontroller.text=value;},focusNode: _passfocusnode, onsubmit: (value){},textInputAction: TextInputAction.done,ispasswordfield: true,),
                    Custombtn(c:Registerchoice.Button,text: "Rigister",onpressed:(){register(); setState(() {
                      _rigisterformloading=true;
                    });},
                      outlinebtn: false,loading:_rigisterformloading ,)
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.only(bottom: 16.0,),
                    child:MaterialButton(child:Text("back to login",style: TextStyle(fontSize: Registerchoice.font_size),),color:Registerchoice.font_color,onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));},)
                ),
              ]
          ),
        ),
      ),
    );
  }}

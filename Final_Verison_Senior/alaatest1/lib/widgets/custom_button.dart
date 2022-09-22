

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Custombtn extends StatelessWidget {
  final String? text;
  Function onpressed;
  final bool? outlinebtn;
  final bool? loading;
  Color? c=Colors.black;

  Custombtn({this.text, this.outlinebtn, this.loading, required this.onpressed, this.c});

  @override
  Widget build(BuildContext context) {
    bool _outlinebtn = outlinebtn ?? false;
    bool _loading = loading ?? false;
    return GestureDetector(
        child: Container(
          height: 65.0,
          decoration: BoxDecoration(
            color: _outlinebtn ? Colors.transparent : c,
            border: Border.all(color: Colors.black, width: 2.0),
            borderRadius: BorderRadius.circular(12.0),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          child: Stack(children: [
            Visibility(
              visible: _loading ? false : true,
              child: Center(
                child:MaterialButton(onPressed:(){onpressed();},child:Text(
                  text ?? 'text',
                  style: TextStyle(
                      fontSize: 16.0,
                      color: _outlinebtn ? Colors.black : Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                ),

              ),

            ),
            Visibility(
                visible: _loading,
                child: const Center(
                    child: SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator()))),
          ]),
        ));
  }
}

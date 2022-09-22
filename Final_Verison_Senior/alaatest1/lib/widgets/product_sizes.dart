import 'package:alaatest1/Choice/user_choice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductSizes extends StatefulWidget {
  final List productsize;
  final Function(String) onselected;
  ProductSizes({required this.productsize, required this.onselected});

  @override
  State<ProductSizes> createState() => _ProductSizesState();
}

class _ProductSizesState extends State<ProductSizes> {
  int _selected=0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        children: [
          for(var i=0; i<widget.productsize.length;i++)

            GestureDetector(onTap: (){
              setState(() {
                widget.onselected("${widget.productsize[i]}");
                _selected=i;
              });

            },
              child: Container(
                width: 42,
                height: 42,

                decoration: BoxDecoration(color:_selected ==i ? Userchoice.selected_size_color :Userchoice.un_selected_size_color ,borderRadius: BorderRadius.circular(1)),
                alignment: Alignment.center,
                child: Text("${widget.productsize[i]}",style: TextStyle(fontWeight: FontWeight.w600,color:_selected==i? Colors.white: Userchoice.size_color,fontSize: 16),),
                margin: EdgeInsets.symmetric(horizontal: 4),
              ),
            )
        ],
      ),
    );

  }
}

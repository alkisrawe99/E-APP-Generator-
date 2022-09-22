import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mb_contact_form/mb_contact_form.dart';

class Contact_us extends StatelessWidget {
  const Contact_us({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact"),
        elevation: 0,
      ),

      body: const MBContactForm(
        hasHeading: false,
        withIcons: true,
        destinationEmail: "email@gmail.com",
      ),
    );
  }
}

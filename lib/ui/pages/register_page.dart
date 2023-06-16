import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:inventory_flutter/helper/shared_pref.dart';
import 'package:inventory_flutter/model/response_login.dart';
import 'package:inventory_flutter/model/response_register.dart';
import 'package:inventory_flutter/service/auth_services.dart';
import 'package:inventory_flutter/ui/pages/home_page.dart';
import 'package:inventory_flutter/ui/pages/login_page.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../style/text_input.dart';

class RegisterPage extends StatefulWidget {
 static const String route = "/register";
 const RegisterPage({super.key});

 @override
 State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
 
 final _formKey = GlobalKey<FormState>();
 late String name;
 late String email;
 late String phone;
 late String password;
 bool isLoading = false;
 final AuthServices _auth = AuthServices();
 final SharedPref _sHaredPref = SharedPref();

 @override
 Widget build(BuildContext context) {
   return ModalProgressHUD(
     inAsyncCall: isLoading,
     child: Scaffold(
       backgroundColor: Colors.white,
       body: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 24.0),
         child: Form(
           key: _formKey,
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.stretch,
             children: [
               Flexible(
                 child: SizedBox(
                   height: 200.0,
                   child: Image.network(
                     'https://github.com/tbadhit/MovieCatalogue-iOS/assets/75456232/01a33156-ef88-49be-9afb-d93e8a8e136b',
                     color: Colors.red,
                   ),
                 ),
               ),
               const SizedBox(
                 height: 24,
               ),
               TextFormField(
                 keyboardType: TextInputType.name,
                 style: const TextStyle(color: Colors.black),
                 textAlign: TextAlign.center,
                 decoration: loginTextInputDecoration('Enter your name..'),
                 validator: validator,
                 onChanged: (newValue) {
                   name = newValue;
                 },
               ),              
               TextFormField(
                 keyboardType: TextInputType.emailAddress,
                 style: const TextStyle(color: Colors.black),
                 textAlign: TextAlign.center,
                 decoration: loginTextInputDecoration('Enter your email..'),
                 validator: validator,
                 onChanged: (newValue) {
                   email = newValue;
                 },
               ),
               const SizedBox(
                 height: 8.0,
               ),
               TextFormField(
                 obscureText: true,
                 style: const TextStyle(color: Colors.black),
                 textAlign: TextAlign.center,
                 decoration: loginTextInputDecoration('Enter your password..'),
                 validator: validator,
                 onChanged: (newValue) {
                   password = newValue;
                 },
               ),
                TextFormField(
                 keyboardType: TextInputType.text,
                 style: const TextStyle(color: Colors.black),
                 textAlign: TextAlign.center,
                 decoration: loginTextInputDecoration('Enter your phone..'),
                 validator: validator,
                 onChanged: (newValue) {
                   phone = newValue;
                 },
               ),
               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 16),
                 child: Material(
                   color: Colors.red,
                   borderRadius: BorderRadius.circular(30),
                   elevation: 5.0,
                   child: MaterialButton(
                     onPressed: () async {
                          final isValidate = _formKey.currentState!.validate();
                          if(isValidate) {
                            setState(() {
                              isLoading = true;
                            });
                            ResponseRegister? registerStatus = await _auth.register(name,email, password,phone);
                            final isSukses = registerStatus!.sukses ?? false;
                            if(isSukses) {
                              await _sHaredPref.save('Login',true);
                              if(!mounted) return ;
                              // Login sukses dan navigasi ke halaman home
                              Navigator.pushReplacementNamed(context,HomePage.route);
                            } else {
                              Fluttertoast.showToast(msg: registerStatus.pesan ?? "error gagal daftar");
                            }
                            setState(() {
                              isLoading = false;                              
                            });
                          }
                         },
                     minWidth: 200.0,
                     height: 42,
                     child: const Text(
                       'Register',
                       style: TextStyle(color: Colors.white),
                     ),
                   ),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.only(top: 10),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     const Text("Already have account?"),
                     const SizedBox(
                       width: 5,
                     ),
                     GestureDetector(
                         onTap: () {
                          final route = MaterialPageRoute(builder: (context) => const LoginPage());
                          Navigator.push(context, route);
                         },
                         child: const Text(
                           "Login",
                           style: TextStyle(
                               color: Colors.red, fontWeight: FontWeight.bold),
                         ))
                   ],
                 ),
               ),
             ],
           ),
         ),
       ),
     ),
   );
 }

 String? validator(String? value) =>
     value!.isEmpty ? "Please enter field" : null;
}



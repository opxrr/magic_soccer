import 'package:flutter/material.dart';
import '../validation_utils.dart';
import 'custome_form_field.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  var formKey = GlobalKey<FormState>();

  var nameController = TextEditingController(text: 'Yasso elgyar');

  var mailController = TextEditingController(text: 'yasso@power.com');

  var passwordController = TextEditingController(text: '123456');

  var rePasswordController = TextEditingController(text: '123456');
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/magic_bg.png'),
            fit: BoxFit.fill
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title:const Text('Register'),
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.25,
                  ),
                  CustomFormField(
                    controller: nameController,
                    label: 'Full Name',
                    validator: (text){
                      if(text == null || text.trim().isEmpty){
                        return 'Please enter full name';
                      }
                    },
                  ),
                  SizedBox(height: 10,),
                  CustomFormField(
                    controller: mailController,
                    label: 'E-Mail',
                    validator: (text){
                      if(text == null || text.trim().isEmpty){
                        return 'Please enter valid e-mail';
                      }
                      if (!ValidationUtils.isValidEmail(text)){
                        return 'Please enter a valid e-mail';
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 10,),
                  CustomFormField(
                      controller: passwordController,
                      label: 'Password',
                      validator: (text){
                        if(text == null || text.trim().isEmpty){
                          return 'Please enter password';
                        }
                        if(text.length<6){
                          return 'Password should be at least 6 characters';
                        }
                      },
                      isPassword: true,
                      keyboardType: TextInputType.text
                  ),
                  SizedBox(height: 10,),
                  CustomFormField(
                      controller: rePasswordController,
                      label: 'Password Confirmation',
                      validator: (text){
                        if(text == null || text.trim().isEmpty){
                          return 'Please enter password-confirmation';
                        }
                        if(passwordController.text != text){
                          return "Password doesn't match";
                        }

                      },
                      isPassword: true,
                      keyboardType: TextInputType.text
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 5),
                        backgroundColor: Colors.yellow
                      ),
                      onPressed: (){
                      //  Register();
                      },
                      child:const Text('Register',
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.black
                        ),)
                  ),
                  TextButton(onPressed: (){
                    Navigator.pushReplacementNamed(context, Login.routeName);
                  }, child: Text("Already  Have Account ?",
                  style: TextStyle(
                    color: Colors.white
                  ),))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

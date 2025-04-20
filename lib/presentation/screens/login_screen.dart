import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:primer_parcial/domain/user.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  final loginFormKey = GlobalKey<FormState>();
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: loginFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            _CustomFormField(
              labelText: 'Username',
              icon: Icon(Icons.person), 
              validator: validateUser, 
              controller: userController,
            ),
            
            const SizedBox(height: 20),
            
            _CustomFormField(
              labelText: 'Password',
              icon: Icon(Icons.lock),  
              validator: validatePassword, 
              controller: passController,
              isPassword: true,
            ),
            
            const SizedBox(height: 20),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: (){}, 
                    child: const Text('Sign Up'),
                  ),
                  
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 1)),
                  
                  FilledButton(
                    onPressed: onLoginButtonPressed,
                    child: const Text('Login'),
                  ),
              ],),
            ),
        ],),
      ),
    );
  }

  String? validateUser (String? value) {
    
    if (value == null || value.isEmpty) {
      return 'Username is required';
    }
    else if (value.isNotEmpty && value.length > 3) {
      return null;
    }
    return 'Invalid username';
  }

  String? validatePassword (String? value) {

    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    else if (value.isNotEmpty && value.length > 3) {
      return null;
    }
    return 'Invalid password';
  }

  void onLoginButtonPressed() {
    
    if(loginFormKey.currentState!.validate()){
      final user = userList.firstWhere(
        (user) => (user.email == userController.text) && (user.password == passController.text),
        orElse: () => User(email:'', password:''),
      );
      
      if (user.email.isNotEmpty && user.password.isNotEmpty){
        context.go('/home/${user.email}');
      }

      else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: const Text('Invalid credentials')),
        );
      }
    }
  }
}

class _CustomFormField extends StatefulWidget {
  
  final bool isPassword;
  final String labelText;
  final String? Function(String?) validator;
  final TextEditingController controller;
  final Icon icon;
  
  const _CustomFormField({
    required this.labelText,
    required this.validator,
    required this.controller,
    required this.icon,
    this.isPassword = false,
  });

  @override
  State<_CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<_CustomFormField> {
  
  bool toggle = true;

  @override
  Widget build(BuildContext context) {
    return Padding( 
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextFormField(
        controller: widget.controller,
        validator : widget.validator,
        obscureText: widget.isPassword ? toggle : false,
        
        decoration: InputDecoration(
          labelText: widget.labelText,
          hintText:  widget.labelText,
          border: OutlineInputBorder(),
          prefixIcon: widget.icon,
          suffixIcon: widget.isPassword 
            ? IconButton(
              icon: toggle ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
              onPressed: () => setState(() {toggle = !toggle;})
            ) 
            : null,
        ),
      ),
    );
  }
}
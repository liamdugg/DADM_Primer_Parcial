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
            
            const SizedBox(height: 20),
            _UserFieldView(
              controller: userController,
            ),
            
            const SizedBox(height: 20),
            _PasswordFieldView(
              controller: passController,
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 20.0
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  
                  TextButton(
                    child: const Text('Sign Up'),
                    onPressed: (){}, 
                  ),
                  
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 1)),
                  
                  FilledButton(
                    child: const Text('Login'),
                    onPressed: () {
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
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* ------------ UserFieldView ------------ */

class _UserFieldView extends StatefulWidget {

  final TextEditingController controller;
  const _UserFieldView({
    required this.controller
  });

  @override
  State<_UserFieldView> createState() => _UserFieldViewState();
}

class _UserFieldViewState extends State<_UserFieldView> {
  
  @override
  Widget build(BuildContext context) {
    return Padding( 
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextFormField(
        controller: widget.controller,
        validator: validateUser,
        decoration: const InputDecoration(
          labelText: 'Username',
          hintText: 'Username',
          border: OutlineInputBorder(),
          icon: Icon(Icons.person),
        ),
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
}

/* ------------ PasswordFieldView ------------ */

class _PasswordFieldView extends StatefulWidget {
  
  final TextEditingController controller;
  const _PasswordFieldView({
    required this.controller
  });

  @override
  State<_PasswordFieldView> createState() => _PasswordFieldViewState();
}

class _PasswordFieldViewState extends State<_PasswordFieldView> {
 
  @override
  Widget build(BuildContext context) {
    return Padding( 
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextFormField(
        controller: widget.controller,
        validator: validatePassword,
        decoration: const InputDecoration(
          labelText: 'Password',
          hintText: 'Enter your password',
          border: OutlineInputBorder(),
          icon: Icon(Icons.lock),
        ),
      ),
    );
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
}
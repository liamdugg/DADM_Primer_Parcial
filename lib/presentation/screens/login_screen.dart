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
  //final TextEditingController userController = TextEditingController();
  //final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: loginFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            const SizedBox(height: 20,),
            _UserFieldView(),
            
            const SizedBox(height: 20),
            _PasswordFieldView(),
            
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
                  
                  FilledButton(
                    onPressed: () {
                      if(loginFormKey.currentState!.validate()){
                        context.push('/home');
                      }
                      else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('email or password incorrect')
                          ),
                        );
                      }
                    },
                    child: const Text('Filled'),
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
  @override
  State<_UserFieldView> createState() => _UserFieldViewState();
}

class _UserFieldViewState extends State<_UserFieldView> {
  
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding( 
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextFormField(
        controller: controller,
        validator: validateUser,
        decoration: const InputDecoration(
          labelText: 'Username',
          hintText: 'Enter your username',
          border: OutlineInputBorder(),
          icon: Icon(Icons.person),
        ),
      ),
    );
  }

  String? validateUser (String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }

    else if (value.isNotEmpty) {
      for(var user in userList) {
        if(user.email == value) {
          return null;
        }
      }
    }

    return 'Please enter a valid email';
  }
}

/* ------------ PasswordFieldView ------------ */

class _PasswordFieldView extends StatefulWidget {
  @override
  State<_PasswordFieldView> createState() => _PasswordFieldViewState();
}

class _PasswordFieldViewState extends State<_PasswordFieldView> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding( 
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextFormField(
        controller: controller,
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
      return 'Please enter your password';
    }

    else if (value.isNotEmpty) {
      for (var user in userList) {
        if (controller.text == user.password) {
          return null;
        }
      }
    }
    return 'Invalid password';
  }
}
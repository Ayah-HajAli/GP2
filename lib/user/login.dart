import 'package:flutter/material.dart';
import 'package:flutter_application_33/Botton_nav_bar.dart';
import 'package:flutter_application_33/components/my_text_field.dart';
import 'package:flutter_application_33/project_logo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
 
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  void login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill in both fields")),
      );
      return;
    }

    try {
     
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

     
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();

      if (userDoc.exists) {
        final userData = userDoc.data();
        print("User Logged In:");
        print("Username: ${userData?['username']}");
        print("Mobile: ${userData?['mobile']}");
      }

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login successful")),
      );
    } on FirebaseAuthException catch (e) {
      String message = "Login failed";
      if (e.code == 'user-not-found') {
        message = "No user found with this email.";
      } else if (e.code == 'wrong-password') {
        message = "Wrong password provided.";
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                width: 200,
                child: logo(),
              ),
            
              Column(
                children: [
                  SizedBox(height: 50),
                  Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 45,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 40),
                  
                
                            
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: MyTextField
                    (controller: emailController,
                     hintText: "Email", 
                     obscureText: false),
                  ),
                 
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: MyTextField
                    (controller: passwordController,
                     hintText: "Password", 
                     obscureText: true),
                  ),
                 
                
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 5),
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {},
                          child: Text("Register"),
                        )
                      ],
                    ),
                  ),
                 
                  ElevatedButton(
                    onPressed: () {
                      login();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 192, 228, 194),
                      padding: EdgeInsets.symmetric(horizontal: 150, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_application_33/components/my_text_field.dart';
import 'package:flutter_application_33/project_logo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final usernameController= TextEditingController();
  final MOBcontroller = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  void SignUp() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmpasswordController.text.trim();
    final username = usernameController.text.trim();
    final mobile = MOBcontroller.text.trim();

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Passwords do not match")),
      );
      return;
    }

    try {

      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);


      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'username': username,
        'email': email,
        'mobile': mobile,
        'createdAt': Timestamp.now(),
      });

      // Navigate to login or home
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      String message = "Something went wrong";
      if (e.code == 'email-already-in-use') {
        message = "Email is already in use";
      } else if (e.code == 'weak-password') {
        message = "Password should be at least 6 characters";
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              width: 150,
              child: logo(),
            ),
            
            Column(
              children: [
               
                Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 45,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              
                        
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: MyTextField(controller: usernameController, hintText: "Username", obscureText: false),
                ),
                 Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: MyTextField(controller: emailController, hintText: "Email", obscureText: false),
                ),
                
                 Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: MyTextField(controller: passwordController, hintText: "Password", obscureText: true),
                ),Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: MyTextField(controller: confirmpasswordController, hintText: "Confirm Password", obscureText: true),
                ),
              
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    SignUp();
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
    );
  }
}

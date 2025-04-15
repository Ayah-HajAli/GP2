import 'package:flutter/material.dart';
import 'package:flutter_application_33/project_logo.dart';

class select extends StatefulWidget {
  const select({super.key});

  @override
  State<select> createState() => _selectState();
}

class _selectState extends State<select> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.white,
body: Padding(
  padding: const EdgeInsets.all(80.0),
  child: Column(
   
    children: [
 Container(
              height: 80,
              width: 80,
              child: logo(),
            ),

    SizedBox(height: 40,),
    Text("Service providers near you",style: TextStyle(fontSize: 20,color:const Color.fromARGB(255, 192, 228, 194),fontWeight: FontWeight.bold),),

    ],
  ),
),

    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_application_33/project_logo.dart';
import 'package:lottie/lottie.dart';

class laoding extends StatefulWidget {
  const laoding({super.key});

  @override
  State<laoding> createState() => _laodingState();
}

class _laodingState extends State<laoding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.white,
body: Column(
  children: [
SizedBox(height: 50,),

 Container(
              height: 60,
              width: 60,
              child: logo(),
            ),

           SizedBox(height: 150,),


Center(
child: LottieBuilder.network('https://lottie.host/b91cb2f2-1934-4dcd-aca4-30b2f675ccfd/PeSIiXLeX2.json',width: 350,height: 350,),
),



//Text("Connecting you...",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color:const Color.fromARGB(255, 192, 228, 194) ),)

  ],
),

    );
  }
}
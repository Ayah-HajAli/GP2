import 'package:flutter/material.dart';
import 'package:flutter_application_33/project_logo.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_application_33/user/select_service_provider.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ServiceProviderPage()), 
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 50),
          SizedBox(
            height: 60,
            width: 60,
            child: logo(),
          ),
          SizedBox(height: 150),
          Center(
            child: LottieBuilder.network(
              'https://lottie.host/b91cb2f2-1934-4dcd-aca4-30b2f675ccfd/PeSIiXLeX2.json',
              width: 350,
              height: 350,
            ),
          ),
          // Optional loading text
          // Text("Connecting you...", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 192, 228, 194))),
        ],
      ),
    );
  }
}

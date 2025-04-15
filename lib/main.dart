import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_33/components/ver_code.dart';
import 'package:flutter_application_33/service_provider/profile_SP.dart';
import 'package:flutter_application_33/service_provider/Pricing.dart';
import 'package:flutter_application_33/service_provider/upload_profile_photo.dart';
import 'package:flutter_application_33/user/Payment.dart';
import 'package:flutter_application_33/user/PhoneNumber.dart';
import 'package:flutter_application_33/user/Users_details.dart';
import 'package:flutter_application_33/user/Users_profile.dart';
import 'package:flutter_application_33/user/invoice_user.dart';

import 'package:flutter_application_33/user/service_history.dart';

import 'firebase_options.dart';
import 'package:flutter_application_33/Botton_nav_bar.dart';
import 'package:flutter_application_33/circles/battery_circle.dart';
import 'package:flutter_application_33/circles/gas_circle_.dart';
import 'package:flutter_application_33/circles/tile_circle.dart';
import 'package:flutter_application_33/google_maps/map.dart';
import 'package:flutter_application_33/pop_ups/cancel_1.dart';
import 'package:flutter_application_33/pop_ups/confirm_1.dart';
import 'package:flutter_application_33/pop_ups/confirm_2.dart';
import 'package:flutter_application_33/pop_ups/received_popup.dart';
import 'package:flutter_application_33/pop_ups/rating.dart';
import 'package:flutter_application_33/service_provider/apply.dart';
import 'package:flutter_application_33/service_provider/invoice_SP.dart';
import 'package:flutter_application_33/user/Register.dart';
import 'package:flutter_application_33/loading.dart';
import 'package:flutter_application_33/user/login.dart';
import 'package:flutter_application_33/project_logo.dart';
import 'package:flutter_application_33/user/search_for_service.dart';
import 'package:flutter_application_33/user/select_service_provider.dart';
import 'package:flutter_application_33/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '3l tareeq',
      debugShowCheckedModeBanner: false,
      
      home:users_profile(), 
    );
  }
}

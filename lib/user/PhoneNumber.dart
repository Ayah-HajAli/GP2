import 'package:flutter/material.dart';
import 'package:flutter_application_33/project_logo.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PN extends StatefulWidget {
  @override
  _PNState createState() => _PNState();
}

class _PNState extends State<PN> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final FocusNode focusNode = FocusNode();

  final Color customGreen = const Color.fromARGB(255, 192, 228, 194); // Custom green color

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 30),

               Container(
         width: 100,
         height: 100
         ,
         child: logo(),
       ),
       SizedBox(height: 100,),

          Text("Enter your phone number",style: TextStyle(fontSize: 28,color: Colors.grey,fontWeight: FontWeight.bold),),
           Text("we'll send you a 4-digit verification code",style: TextStyle(fontSize: 13,color: Colors.grey,),),
           SizedBox(height: 80,),
              IntlPhoneField(
                focusNode: focusNode,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  labelStyle: TextStyle(color: customGreen),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: const Color.fromARGB(255, 192, 228, 194), width: 2.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: const Color.fromARGB(255, 192, 228, 194), width: 1.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: const Color.fromARGB(255, 192, 228, 194)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                languageCode: "en",
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
                onCountryChanged: (country) {
                  print('Country changed to: ${country.name}');
                },
              ),
              SizedBox(height: 50),
             MaterialButton(
  minWidth: double.infinity, 
  height: 55, 
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10), 
  ),
  color: customGreen,
  textColor: Colors.white,
  onPressed: () {
    _formKey.currentState?.validate();
  },
  child: Text(
    'Submit',
    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold), 
  ),
),

            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_33/project_logo.dart';

class Apply extends StatefulWidget {
  const Apply({super.key});

  @override
  State<Apply> createState() => _ApplyState();
}

class _ApplyState extends State<Apply> {
  String? selectedService;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 15),
                Container(
                  height: 60,
                  width: 60,
                  child: logo(),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "join us and become a part of our community ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 192, 228, 194),
                        ),
                      )
                    ],
                  ),
                ),
               
                SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  child: Container(
                    width: double.infinity,
                    color: Color.fromRGBO(22, 121, 171, 1.0),
                    child: Column(
                      children: [
                        SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 40),
                            Text(
                              "Services",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 40),
                            Text(
                              "min 1,max 6",
                              style: TextStyle(
                                fontSize: 15,
                                color: const Color.fromARGB(255, 7, 40, 89),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 6),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                for (var service in [
                                  "Flat Tire Change",
                                  "Towing Service",
                                  "Fuel Delivery",
                                  "Battery Jump-Start",
                                  "Lockout Assistance",
                                  "Other"
                                ])
                                  RadioListTile(
                                    activeColor:  const Color.fromARGB(255, 192, 228, 194),
                                    fillColor: MaterialStateProperty.all(Colors.white),
                                    title: Text(
                                      service,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    value: service,
                                    groupValue: selectedService,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedService = value.toString();
                                      });
                                    },
                                  ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width: 40),
                                Text(
                                  "Attach portfolio:",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),

                            Center(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
             height: 130,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: IconButton(
                 onPressed: () {
   
                  },
                 icon: Icon(
                  Icons.upload,
                    color: const Color.fromARGB(255, 192, 228, 194),
                  size: 120,
                  ),
                 ),

              ),
            ),
          ],
        ),
      ),
    ),
                           
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(255, 7, 40, 89),
                                padding: EdgeInsets.symmetric(horizontal: 150, vertical: 25),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Text(
                                'Submit',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),

                            SizedBox(height: 60,),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_33/project_logo.dart';

class SearchForService extends StatefulWidget {
  const SearchForService({super.key});

  @override
  State<SearchForService> createState() => _SearchForServiceState();
}

class _SearchForServiceState extends State<SearchForService> {
  String? selectedService;
  String? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
                SizedBox(height: 20),
              Container(
                height: 80,
                width: 80,
                child: logo(),
              ),
            SizedBox(height: 50,),
              Column(
                children: [
                
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 40,),
                      Text(
                        "Services",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
               
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
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
                                 fillColor: MaterialStateProperty.all(Colors.grey),
                                activeColor: const Color.fromARGB(255, 7, 40, 89),
                                title: Text(
                                  service,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
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
                        SizedBox(height: 30),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                             SizedBox(width: 10,),
                            Text(
                              "Near by me:",
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Column(
                          children: [
                            for (var time in ["0-10 min", "10-20 min"])
                              RadioListTile(
                                 fillColor: MaterialStateProperty.all(Colors.grey),
                                activeColor: const Color.fromARGB(255, 7, 40, 89),
                                title: Text(
                                  time,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                value: time,
                                groupValue: selectedTime,
                                onChanged: (value) {
                                  setState(() {
                                    selectedTime = value.toString();
                                  });
                                },
                              ),
                          ],
                        ),
                        SizedBox(height: 40),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor:const Color.fromARGB(255, 192, 228, 194),
                            padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Confirm Service',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
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
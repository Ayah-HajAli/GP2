import 'package:flutter/material.dart';
import 'package:flutter_application_33/project_logo.dart';

class Services extends StatefulWidget {
  const Services({super.key});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  String? selectedPayment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                height: 60,
                width: 60,
                child: logo(),
              ),
              const SizedBox(height: 20),
                      Text(
                              "Service History",
                              style: TextStyle(
                                fontSize: 25,
                                color:const Color.fromARGB(255, 192, 228, 194),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
              
             SizedBox(height: 10,),
              

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  
                 height: 170,
                 width: 400,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(22, 121, 171, 1.0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                    
                     Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                          SizedBox(width: 20,),
                         Icon(Icons.replay,size: 45,color:Colors.white),
                       ],
                     ),
                      
                      Column(
                        
                        
                        children: [
                          
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                             
                              const Text(
                                '"Last Service"',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color:Colors.white,
                                ),
                              ),
                              
                            ],
                          ),
                          const SizedBox(height: 6),
                         
                         Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                          const Text(
                                '"Details"',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 7, 40, 89),
                                ),
                              ),
                         ],)
                        ],
                      ),
                    ],
                  ),
                ),
              ),


               Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  
                 height: 170,
                 width: 400,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 7, 40, 89),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                    
                     Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                          SizedBox(width: 20,),
                         Icon(Icons.replay,size: 45,color:Colors.white),
                       ],
                     ),
                      
                      Column(
                        
                        
                        children: [
                          
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                             
                              const Text(
                                '"Last Service"',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color:Colors.white,
                                ),
                              ),
                              
                            ],
                          ),
                          const SizedBox(height: 6),
                         
                         Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                          const Text(
                                '"Details"',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(22, 121, 171, 1.0),
                                ),
                              ),
                         ],)
                        ],
                      ),
                    ],
                  ),
                ),
              ),


 Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  
                 height: 170,
                 width: 400,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(22, 121, 171, 1.0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                    
                     Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                          SizedBox(width: 20,),
                         Icon(Icons.replay,size: 45,color:Colors.white),
                       ],
                     ),
                      
                      Column(
                        
                        
                        children: [
                          
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                             
                              const Text(
                                '"Last Service"',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color:Colors.white,
                                ),
                              ),
                              
                            ],
                          ),
                          const SizedBox(height: 6),
                         
                         Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                          const Text(
                                '"Details"',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 7, 40, 89),
                                ),
                              ),
                         ],)
                        ],
                      ),
                    ],
                  ),
                ),
              ),


   Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  
                 height: 170,
                 width: 400,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 7, 40, 89),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                    
                     Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                          SizedBox(width: 20,),
                         Icon(Icons.replay,size: 45,color:Colors.white),
                       ],
                     ),
                      
                      Column(
                        
                        
                        children: [
                          
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                             
                              const Text(
                                '"Last Service"',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color:Colors.white,
                                ),
                              ),
                              
                            ],
                          ),
                          const SizedBox(height: 6),
                         
                         Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                          const Text(
                                '"Details"',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(22, 121, 171, 1.0),
                                ),
                              ),
                         ],)
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
    );
  }
}

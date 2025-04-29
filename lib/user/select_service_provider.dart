import 'package:flutter/material.dart';
import 'package:flutter_application_33/user/service_prodiver_details.dart';


import 'package:flutter_application_33/user/provider_reviews.dart';

void main() => runApp(MaterialApp(home: ServiceProviderPage()));

class ServiceProviderPage extends StatefulWidget {
  const ServiceProviderPage({super.key});

  @override
  _ServiceProviderPageState createState() => _ServiceProviderPageState();
}

class _ServiceProviderPageState extends State<ServiceProviderPage> {
  int selectedIndex = 1;

  final List<Map<String, dynamic>> serviceProviders = [
    {
      'name': 'Rami Al-Khatib',
      'rating': 3,
      'time': '2 min away',
    },
    {
      'name': 'Tariq Al-Rashid',
      'rating': 5,
      'time': '14 min away',
    },
    {
      'name': 'Tariq Al-Rashid',
      'rating': 5,
      'time': '14 min away',
    },
    {
      'name': 'Tariq Al-Rashid',
      'rating': 5,
      'time': '14 min away',
    },
    {
      'name': 'Tariq Al-Rashid',
      'rating': 5,
      'time': '14 min away',
    },
    {
      'name': 'Tariq Al-Rashid',
      'rating': 5,
      'time': '14 min away',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Image.asset(
              'lib/images/logo2.png',
              width: 60,
              height: 60,
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 40),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  textAlign: TextAlign.left,
                  "Service providers near you",
                  style: TextStyle(
                      color: const Color.fromARGB(255, 144, 223, 170),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: serviceProviders.length,
                itemBuilder: (context, index) {
                  final provider = serviceProviders[index];
                  final isSelected = selectedIndex == index;

                  return GestureDetector(
                    onTap: () => setState(() {
                      selectedIndex = index;
                    }),
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      padding: EdgeInsets.all(10),
                      width: 190,
                      height: 190,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(248, 243, 243, 243),
                        borderRadius: BorderRadius.circular(15),
                        border: isSelected
                            ? Border.all(color: Colors.blue, width: 2)
                            : Border.all(color: Colors.transparent),
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5),
                        ],
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                              provider['image'] ??
                                  'https://via.placeholder.com/150', // Fallback
                            ),
                            radius: 55,
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 25),
                                Text(
                                  provider['name'],
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 7, 65, 115),
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 15),
                                Row(
                                  children: List.generate(5, (i) {
                                    return Icon(
                                      Icons.star,
                                      color: i < provider['rating']
                                          ? Colors.amber
                                          : Colors.grey[300],
                                      size: 18,
                                    );
                                  }),
                                ),
                                SizedBox(height: 15),
                                Row(
                                  children: [
                                    Icon(Icons.access_time,
                                        size: 14, color: Colors.grey),
                                    SizedBox(width: 5),
                                    Text(
                                      provider['time'],
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProviderReviewsPage(),
                                ),
                              );
                            },
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Row(
                                children: [
                                  Text("Reviews",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 7, 65, 115),
                                          fontWeight: FontWeight.bold)),
                                  Icon(Icons.keyboard_arrow_right)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              width: 350,
              padding: EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  final selectedProvider = serviceProviders[selectedIndex];
                  print("Selected: ${selectedProvider['name']}");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ServiceProviderDetailsPage(
                        provider: {
                          ...selectedProvider,
                          'services': {
                            'Flat Tire Change': 10,
                            'Fuel Delivery': 53,
                            'Battery Jump-Start': 100,
                            'Lockout Assistance': 40,
                          }
                        },
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 22, 121, 171),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                child: Text(
                  "Select",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

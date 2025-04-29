import 'package:flutter/material.dart';
import 'package:flutter_application_33/project_logo.dart';

class Service {
  final String title;
  String price;

  Service({
    required this.title,
    required this.price,
  });
}

class Pricing extends StatefulWidget {
  const Pricing({super.key});

  @override
  State<Pricing> createState() => _PricingState();
}

class _PricingState extends State<Pricing> {
  final List<Service> services = [
    Service(title: 'Flat Tire Change', price: '10\$'),
    Service(title: 'Fuel Delivery', price: '53\$'),
    Service(title: 'Battery Jump-Start', price: '100\$'),
    Service(title: 'Lockout Assistance', price: '40\$'),
  ];

  void _editPriceDialog(Service service) {
    final tempController =
        TextEditingController(text: service.price.replaceAll('\$', ''));

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Price for ${service.title}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.grey),),
          content: TextField(
            controller: tempController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: "Enter new price in dollars"),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style:  ElevatedButton.styleFrom(  backgroundColor:  const Color.fromARGB(255, 192, 228, 194),
                  shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
                  ),
                  onPressed: () {
                    setState(() {
                      service.price = "${tempController.text}\$";
                    });
                    Navigator.pop(context);
                  },
                  child: Text("Save",style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildServiceItem(Service service) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Card(
        color: Color.fromRGBO(22, 121, 171, 1.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                service.title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                service.price,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.edit,
              color: const Color.fromARGB(255, 7, 40, 89),
              size: 30,
            ),
            onPressed: () => _editPriceDialog(service),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
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
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      " we are happy to inform \n that you're a part of our community",
                      style: TextStyle(
                        fontSize: 20,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          "Please price your \nservices below:",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Column(
                        children: services.map(_buildServiceItem).toList(),
                      ),
                      SizedBox(height: 200),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 7, 40, 89),
                            padding: EdgeInsets.symmetric(
                                horizontal: 150, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Done',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
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

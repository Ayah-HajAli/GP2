import 'package:flutter/material.dart';
import 'package:flutter_application_33/user/provider_reviews.dart';
import 'package:flutter_application_33/project_logo.dart';

class ServiceProviderDetailsPage extends StatefulWidget {
  final Map<String, dynamic> provider;

  const ServiceProviderDetailsPage({super.key, required this.provider});

  @override
  State<ServiceProviderDetailsPage> createState() =>
      _ServiceProviderDetailsPageState();
}

class _ServiceProviderDetailsPageState
    extends State<ServiceProviderDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final services = widget.provider['services'] as Map<String, int>? ?? {};

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(
          color: Color.fromARGB(255, 144, 223, 170),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              SizedBox(
                height: 60,
                width: 60,
                child: logo(),
              ),
              const SizedBox(height: 20),
              const Text(
                "Service providers near you",
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 144, 223, 170),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 180,
                  width: 400,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F7FA),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 60,
                       
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.provider['name'] ?? 'Unknown',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: List.generate(
                                5,
                                (i) => Icon(
                                  Icons.star,
                                  size: 18,
                                  color: i < (widget.provider['rating'] ?? 0)
                                      ? Colors.orange
                                      : Colors.grey[300],
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(Icons.access_time,
                                    size: 14, color: Colors.grey),
                                const SizedBox(width: 6),
                                Text(
                                  widget.provider['time'] ?? '',
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => ProviderReviewsPage()),
                        ),
                        child: Row(
                          children: const [
                            Text(
                              "Reviews",
                              style: TextStyle(
                                color: Color.fromARGB(255, 7, 65, 115),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(Icons.keyboard_arrow_right),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                child: Container(
                  width: double.infinity,
                  color: const Color.fromARGB(255, 192, 228, 194),
                  padding: const EdgeInsets.symmetric(
                      vertical: 30, horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Usual Services Costs",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ...services.entries.map(
                        (entry) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                entry.key,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${entry.value}\$",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                      ),
                      const SizedBox(height: 150),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF072859),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 100, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Contact',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
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

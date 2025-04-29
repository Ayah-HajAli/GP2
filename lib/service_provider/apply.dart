import 'package:flutter/material.dart';
import 'package:flutter_application_33/project_logo.dart';

class Apply extends StatefulWidget {
  const Apply({super.key});

  @override
  State<Apply> createState() => _ApplyState();
}

class _ApplyState extends State<Apply> {
 
  final TextEditingController flatTireController = TextEditingController(text: "Flat Tire Change");
  final TextEditingController towingController = TextEditingController(text: "Towing Service");
  final TextEditingController fuelController = TextEditingController(text: "Fuel Delivery");
  final TextEditingController batteryController = TextEditingController(text: "Battery Jump-Start");
  final TextEditingController lockoutController = TextEditingController(text: "Lockout Assistance");
  final TextEditingController otherController = TextEditingController(text: "Other");

  bool flatTireSelected = false;
  bool towingSelected = false;
  bool fuelSelected = false;
  bool batterySelected = false;
  bool lockoutSelected = false;
  bool otherSelected = false;

  @override
  void dispose() {
   
    flatTireController.dispose();
    towingController.dispose();
    fuelController.dispose();
    batteryController.dispose();
    lockoutController.dispose();
    otherController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 15),
              SizedBox(height: 60, width: 60, child: logo()),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    "join us and become a part of our community ",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 192, 228, 194),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                child: Container(
                  width: double.infinity,
                  color: const Color.fromRGBO(22, 121, 171, 1.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      const Padding(
                        padding: EdgeInsets.only(left: 40),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Services",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 40),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "min 1, max 6",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 7, 40, 89),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),

                      _buildCheckboxTile(flatTireController, flatTireSelected, (val) {
                        setState(() => flatTireSelected = val ?? false);
                      }),
                      _buildCheckboxTile(towingController, towingSelected, (val) {
                        setState(() => towingSelected = val ?? false);
                      }),
                      _buildCheckboxTile(fuelController, fuelSelected, (val) {
                        setState(() => fuelSelected = val ?? false);
                      }),
                      _buildCheckboxTile(batteryController, batterySelected, (val) {
                        setState(() => batterySelected = val ?? false);
                      }),
                      _buildCheckboxTile(lockoutController, lockoutSelected, (val) {
                        setState(() => lockoutSelected = val ?? false);
                      }),
                      _buildCheckboxTile(otherController, otherSelected, (val) {
                        setState(() => otherSelected = val ?? false);
                      }),

                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.only(left: 40),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Attach portfolio:",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Container(
                          height: 130,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: IconButton(
                              onPressed: () {
                                // Upload logic
                              },
                              icon: const Icon(
                                Icons.upload,
                                color: Color.fromARGB(255, 192, 228, 194),
                                size: 120,
                              ),
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          final selected = <String>[];
                          if (flatTireSelected) selected.add(flatTireController.text);
                          if (towingSelected) selected.add(towingController.text);
                          if (fuelSelected) selected.add(fuelController.text);
                          if (batterySelected) selected.add(batteryController.text);
                          if (lockoutSelected) selected.add(lockoutController.text);
                          if (otherSelected) selected.add(otherController.text);

                          print("Selected services: $selected");
                         
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 7, 40, 89),
                          padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
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

  Widget _buildCheckboxTile(TextEditingController controller, bool isChecked, Function(bool?) onChanged) {
    return CheckboxListTile(
      activeColor: const Color.fromARGB(255, 192, 228, 194),
      title: TextField(
        controller: controller,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
      ),
      value: isChecked,
      onChanged: onChanged,
    );
  }
}

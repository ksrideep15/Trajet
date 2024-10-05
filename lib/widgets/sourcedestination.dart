import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart'; // date formatting
import 'package:trajet/pages/signup_page.dart';

class SourceDestination extends StatefulWidget {
  const SourceDestination({super.key});

  @override
  SourceDestinationState createState() => SourceDestinationState();
}

class SourceDestinationState extends State<SourceDestination> {
  String source = 'MAR';
  String destination = 'THVM'; //
  String selectedDate = 'Select Date'; //
  List<String> places = ['MAR', 'THVM', 'NDLS', 'CSTM', 'SBC']; // sample list

  // Function to check if all fields are filled
  bool get _isFormValid {
    return source.isNotEmpty &&
        destination.isNotEmpty &&
        selectedDate != 'Select Date';
  }

  // Function to display the source picker
  void _selectSource() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: places.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(places[index]),
              onTap: () {
                setState(() {
                  source = places[index];
                });
                Navigator.pop(context);
              },
            );
          },
        );
      },
    );
  }

  void _selectDestination() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: places.length,
          itemBuilder: (BuildContext context, int index) {
            if (places[index] == source) {
              return Container(); // Skip if same as source
            }
            return ListTile(
              title: Text(places[index]),
              onTap: () {
                setState(() {
                  destination = places[index];
                });
                Navigator.pop(context);
              },
            );
          },
        );
      },
    );
  }

  //func to select only future date
  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(), // only
      lastDate: DateTime(2100), // Limit to a reasonable future date
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        selectedDate = DateFormat('dd MMMM yyyy')
            .format(picked); // Format the selected date
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      height: 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'From',
                    style: TextStyle(
                      color: Color(0xFF004B5F),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: _selectSource, // Open source selection
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: 140,
                        height: 55,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 186, 219, 227),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            source, // Display selected source
                            style: const TextStyle(
                              color: Color(0xFF004B5F),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  SvgPicture.asset(
                    'assets/icons/arrow_swap_icon_224520.svg',
                    height: 35,
                    width: 35,
                    color: const Color(0xFF004B5F),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'To',
                    style: TextStyle(
                      color: Color(0xFF004B5F),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: _selectDestination, // Open destination selection
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: 140,
                        height: 55,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 186, 219, 227),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            destination, // Display selected destination
                            style: const TextStyle(
                              color: Color(0xFF004B5F),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              Text(
                'Date',
                style: TextStyle(
                  color: Color(0xFF004B5F),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              const SizedBox(height: 8.0),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    _selectDate(context); // Open the calendar pop-up
                  },
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: 319,
                    height: 75,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 186, 219, 227),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                            width: 15), // Spacing between border and icon
                        const Icon(
                          Icons.calendar_today, // Calendar icon
                          color: Color(0xFF004B5F),
                        ),
                        const SizedBox(
                            width: 15), // Spacing between icon and text
                        Text(
                          selectedDate, // Display selected date
                          style: const TextStyle(
                            color: Color(0xFF004B5F),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30.0),
          Row(
            children: [
              const SizedBox(height: 8.0),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: _isFormValid
                      ? () {
                          // Navigate to SignUpPage when button is pressed
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpPage(),
                            ),
                          );
                        }
                      : null, // Do nothing if form is not valid
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    width: 319,
                    height: 70,
                    decoration: BoxDecoration(
                      color: _isFormValid
                          ? const Color(0xFF004B5F)
                          : Colors.grey, // Change color based on validity
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Center(
                      child: Text(
                        'Book Now',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

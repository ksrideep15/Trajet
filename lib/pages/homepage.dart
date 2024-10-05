import 'package:flutter/material.dart';
import 'package:trajet/pages/background.dart';
import 'package:trajet/widgets/appbar.dart';
import 'package:trajet/widgets/sourcedestination.dart';
import 'package:trajet/widgets/whychoseus.dart';
import 'package:trajet/widgets/faq.dart';

// Creates a stateful widget called Homepage
class Homepage extends StatefulWidget {
  // And below line defines a constructor to create an instance/object of the Homepage class
  const Homepage({super.key});

  @override
  // creates an instance of the HomepageState class
  HomepageState createState() => HomepageState();
}

class HomepageState extends State<Homepage> {
  int _selectedIndex = 0; // counter for the bottom navigation bar

  // A list of widgets for the bottom navigation bar
  static const List<Widget> _widgetOptions = <Widget>[
    HomeContent(),
    Text('Status Page'),
    Text('My Ticket Page'),
    Text('My Profile Page'),
  ];

  // logic for changing the bottom navigation bar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use the custom app bar directly
      appBar: const TrajetAppBar(),
      // Define the drawer for the scaffold
      drawer: const Drawer(
        // Add content to the drawer if needed
        child: Center(
          child: Text('Drawer Content Here'),
        ),
      ),
      // Body of the app
      // Calls the widget based on the index of _widgetOptions
      body: _widgetOptions.elementAt(_selectedIndex),

      // Items of the bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.train),
            label: 'Status',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_number),
            label: 'My Ticket',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'My Profile',
          ),
        ],
        // currentIndex is the current index of the bottom navigation bar
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        // Name of the unselected labels are not shown
        showSelectedLabels: true,
        showUnselectedLabels: false,
        // Called when a bottom navigation bar item is pressed
        onTap: _onItemTapped,
      ),
    );
  }
}

// HomeContent widget
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SourceDestination(),
                  SizedBox(height: 20),
                  WhyChoseUs(),
                  SizedBox(height: 20),
                  FAQ(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

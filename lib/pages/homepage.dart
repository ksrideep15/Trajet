import 'package:flutter/material.dart';
import 'package:trajet/pages/background.dart';
import 'package:trajet/util/collapsedmenu.dart';
import 'package:trajet/util/profile.dart';
import 'package:trajet/widgets/sourcedestination.dart';
import 'package:trajet/widgets/whychoseus.dart';
import 'package:trajet/widgets/faq.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  HomepageState createState() => HomepageState();
}

class HomepageState extends State<Homepage> {
  //counter for the bottom navigation bar
  int _selectedIndex = 0;

  //A list of widgets for the bottom navigation bar
  static const List<Widget> _widgetOptions = <Widget>[
    HomeContent(),
    Text('Status Page'),
    Text('My Ticket Page'),
    Text('My Profile Page'),
  ];

  //logic for changing the bottom navigation bar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App Bar
      appBar: AppBar(
        leading: const MenuIcon(),
        backgroundColor: const Color(0xFF004B5F),
        toolbarHeight: 120,
        title: const Center(
          child: Column(
            children: [
              Text(
                "Welcome to Trajet",
                style: TextStyle(
                  letterSpacing: .75,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
              Text("Let's book you a train ticket!",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  )),
            ],
          ),
        ),

        //Profile Icon
        actions: const [
          ProfileIcon(),
        ],
      ),

      drawer: const Drawer(
          // Empty Drawer
          ),

      //Body of the app
      // calls the widget based on the index of _widgetOptions
      body: _widgetOptions.elementAt(_selectedIndex),

      //items of the bottom navigation bar
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
        //currentIndex is the current index of the bottom navigation bar
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        //name of the unselected labels are not shown
        showSelectedLabels: true,
        showUnselectedLabels: false,
        //called when an bottom navigation bar item is pressed
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

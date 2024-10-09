import 'package:flutter/material.dart';
import 'package:trajet/pages/background.dart';
import 'package:trajet/pages/profilepage.dart';
import 'package:trajet/widgets/appbar.dart';
import 'package:trajet/widgets/sourcedestination.dart';
import 'package:trajet/widgets/whychoseus.dart';
import 'package:trajet/widgets/faq.dart';
import 'package:trajet/services/authservice.dart';

class Homepage extends StatefulWidget {
  final bool isLoggedIn;

  const Homepage({super.key, required this.isLoggedIn});

  @override
  HomepageState createState() => HomepageState();
}

class HomepageState extends State<Homepage> {
  int _selectedIndex = 0;
  bool _isLoggedIn = false;
  final AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    bool isLoggedIn = await _authService.isLoggedIn();
    setState(() {
      _isLoggedIn = isLoggedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = <Widget>[
      HomeContent(isLoggedIn: _isLoggedIn),
      const Text('Status Page'),
      const Text('My Ticket Page'),
      ProfilePage(),
    ];

    return Scaffold(
      appBar: const TrajetAppBar(),
      drawer: const Drawer(
        child: Center(
          child: Text('Drawer Content Here'),
        ),
      ),
      body: widgetOptions[_selectedIndex],
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
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  final bool isLoggedIn;

  const HomeContent({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SourceDestination(isLoggedIn: isLoggedIn),
                  const SizedBox(height: 20),
                  const WhyChoseUs(),
                  const SizedBox(height: 20),
                  const FAQ(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

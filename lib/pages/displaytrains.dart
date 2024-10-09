import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DisplayTrainsPage extends StatelessWidget {
  final String source;
  final String destination;
  final DateTime date;
  final String travelClass;
  final int passengers;

  const DisplayTrainsPage({
    super.key,
    required this.source,
    required this.destination,
    required this.date,
    required this.travelClass,
    required this.passengers,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title:
            const Text('Search Ticket', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF004B5F),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              // TODO: Implement menu functionality
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _buildSearchSummary(),
          _buildDateSelector(),
          Expanded(
            child: ListView(
              children: [
                _buildTrainCard('Goa Express'),
                _buildTrainCard('MangalaLakshimi Express'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchSummary() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(source,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              const Icon(Icons.train, color: Color(0xFF004B5F)),
              Text(destination,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Type: One Way',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600])),
              Text('Class: $travelClass',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600])),
              Text('Passenger: $passengers Adults',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600])),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDateSelector() {
    return Container(
      height: 80,
      color: Colors.grey[200],
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context, index) {
          final currentDate = date.add(Duration(days: index));
          final isSelected =
              index == 3; // Assuming the 4th day (index 3) is selected
          return _buildDateCard(currentDate, isSelected);
        },
      ),
    );
  }

  Widget _buildDateCard(DateTime date, bool isSelected) {
    return Container(
      width: 60,
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF004B5F) : Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            DateFormat('dd').format(date),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
          Text(
            DateFormat('E').format(date),
            style: TextStyle(
              fontSize: 14,
              color: isSelected ? Colors.white : Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrainCard(String trainName) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(trainName,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(source, style: const TextStyle(fontSize: 16)),
                    Text('08:30 AM',
                        style:
                            TextStyle(fontSize: 14, color: Colors.grey[600])),
                    Text('27 Aug 2024',
                        style:
                            TextStyle(fontSize: 12, color: Colors.grey[400])),
                  ],
                ),
                Column(
                  children: [
                    const Icon(Icons.access_time, color: Color(0xFF004B5F)),
                    Text('Duration: 1h 30m',
                        style:
                            TextStyle(fontSize: 12, color: Colors.grey[600])),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(destination, style: const TextStyle(fontSize: 16)),
                    Text('10:00 AM',
                        style:
                            TextStyle(fontSize: 14, color: Colors.grey[600])),
                    Text('27 Aug 2024',
                        style:
                            TextStyle(fontSize: 12, color: Colors.grey[400])),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

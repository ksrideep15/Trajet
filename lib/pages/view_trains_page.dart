import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'displaytrains.dart';

class ViewTrainsPage extends StatefulWidget {
  final String initialSource;
  final String initialDestination;
  final String initialDate;

  const ViewTrainsPage({
    super.key,
    required this.initialSource,
    required this.initialDestination,
    required this.initialDate,
  });

  @override
  _ViewTrainsPageState createState() => _ViewTrainsPageState();
}

class _ViewTrainsPageState extends State<ViewTrainsPage> {
  late String _source;
  late String _destination;
  late DateTime _selectedDate;
  String _selectedClass = '2A';
  String _selectedQuota = 'General';
  bool _isOneWay = true;

  @override
  void initState() {
    super.initState();
    _source = widget.initialSource;
    _destination = widget.initialDestination;
    _selectedDate = DateFormat('dd MMMM yyyy').parse(widget.initialDate);
  }

  void _swapSourceAndDestination() {
    setState(() {
      final temp = _source;
      _source = _destination;
      _destination = temp;
    });
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 90)),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _searchTrain() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DisplayTrainsPage(
          source: _source,
          destination: _destination,
          date: _selectedDate,
          travelClass: _selectedClass,
          passengers:
              2, // You might want to add a passenger selector in the search page
        ),
      ),
    );

    // print('Searching for trains:');
    // print('From: $_source');
    // print('To: $_destination');
    // print('Date: ${DateFormat('dd MMMM yyyy').format(_selectedDate)}');
    // print('Class: $_selectedClass');
    // print('Quota: $_selectedQuota');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Search For Trains',
            style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF004B5F),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTripTypeSelector(),
            const SizedBox(height: 16),
            _buildSourceDestinationSelector(),
            const SizedBox(height: 16),
            _buildDateSelector(),
            const SizedBox(height: 16),
            _buildClassSelector(),
            const SizedBox(height: 16),
            _buildQuotaSelector(),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _searchTrain,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF004B5F),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Search Train', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTripTypeSelector() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildTripTypeButton(
                'One-way', _isOneWay, () => setState(() => _isOneWay = true)),
          ),
          Expanded(
            child: _buildTripTypeButton('Round-trip', !_isOneWay,
                () => setState(() => _isOneWay = false)),
          ),
        ],
      ),
    );
  }

  Widget _buildTripTypeButton(
      String text, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF004B5F) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildSourceDestinationSelector() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('From',
                    style: TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 4),
                Text(_source,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.swap_horiz, color: Color(0xFF004B5F)),
            onPressed: _swapSourceAndDestination,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('To',
                    style: TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 4),
                Text(_destination,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateSelector() {
    return GestureDetector(
      onTap: _selectDate,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Date',
                    style: TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 4),
                Text(
                  DateFormat('dd MMMM yyyy').format(_selectedDate),
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Icon(Icons.calendar_today, color: Color(0xFF004B5F)),
          ],
        ),
      ),
    );
  }

  Widget _buildClassSelector() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Select Class', style: TextStyle(fontSize: 16)),
          DropdownButton<String>(
            value: _selectedClass,
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Color(0xFF004B5F), fontSize: 16),
            underline: Container(
              height: 2,
              color: const Color(0xFF004B5F),
            ),
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  _selectedClass = newValue;
                });
              }
            },
            items: <String>['1A', '2A', '3A', 'SL', '2S', 'CC']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildQuotaSelector() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Select Quota', style: TextStyle(fontSize: 16)),
          DropdownButton<String>(
            value: _selectedQuota,
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Color(0xFF004B5F), fontSize: 16),
            underline: Container(
              height: 2,
              color: const Color(0xFF004B5F),
            ),
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  _selectedQuota = newValue;
                });
              }
            },
            items: <String>['General', 'Ladies', 'Tatkal', 'Premium Tatkal']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

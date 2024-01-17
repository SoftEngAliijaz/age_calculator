import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  DateTime _selectedDate = DateTime.now();
  DateTime _selectedBirthDate = DateTime.now();
  String _age = '';
  String _nextBirthday = '';

  void _showDatePicker() {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(1900, 1, 1),
      maxTime: DateTime.now(),
      onConfirm: (date) {
        setState(() {
          _selectedDate = date;
          _calculateAge();
        });
      },
      currentTime: _selectedDate,
      locale: LocaleType.en,
    );
  }

  void _showBirthDatePicker() {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(1900, 1, 1),
      maxTime: DateTime.now(),
      onConfirm: (date) {
        setState(() {
          _selectedBirthDate = date;
          _calculateAge();
        });
      },
      currentTime: _selectedBirthDate,
      locale: LocaleType.en,
    );
  }

  void _calculateAge() {
    final age = _selectedDate.difference(_selectedBirthDate).inDays;
    final nextBirthday =
        _selectedBirthDate.add(Duration(days: (age / 365).ceil() * 365));
    final DateFormat() = DateFormat('yyyy-MM-dd');
    setState(() {
      _age =
          'Years: ${(age / 365).floor()} Months: ${((age % 365) / 30).floor()} Days: ${(age % 365) % 30}';
      _nextBirthday = 'Month: ${nextBirthday.month} Days: ${nextBirthday.day}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Caclculator App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _showDatePicker,
                  child: const Text('Date Of Today'),
                ),
                ElevatedButton(
                  onPressed: _showBirthDatePicker,
                  child: const Text('Date Of Birth'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Total Age',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              _age,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Next Birthday',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              _nextBirthday,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Total Life Of',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            const Text(
              'Years: 29 Months: 358 Days: 10914 Weeks: 1559 Hours: 261957',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

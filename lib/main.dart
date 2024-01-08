import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  TextEditingController dobController = TextEditingController();
  DateTime currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Age Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              title: Text('Current Date'),
              subtitle: Text(formatDate(currentDate, [yyyy, '-', mm, '-', dd])),
            ),
            TextFormField(
              controller: dobController,
              decoration: InputDecoration(labelText: 'Enter Date of Birth'),
              keyboardType: TextInputType.datetime,
              onTap: () => _selectDate(context),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _calculateAge(context),
              child: Text('Calculate Age'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(1900),
      lastDate: currentDate,
    );

    if (picked != null && picked != currentDate) {
      setState(() {
        currentDate = picked;
      });
    }
  }

  void _calculateAge(BuildContext context) {
    DateTime dob = DateTime.parse(dobController.text);
    Duration difference = currentDate.difference(dob);

    int years = (difference.inDays / 365).floor();
    int days = difference.inDays;
    int months = (difference.inDays / 30).floor();
    int minutes = difference.inMinutes;
    int seconds = difference.inSeconds;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Age Calculation Result'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Years: $years'),
              Text('Months: $months'),
              Text('Days: $days'),
              Text('Minutes: $minutes'),
              Text('Seconds: $seconds'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

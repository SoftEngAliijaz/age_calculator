import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

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
        title: const Text('Age Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              title: const Text('Current Date'),
              subtitle: Text(formatDate(currentDate, [dd, '-', mm, '-', yyyy])),
            ),
            TextFormField(
              controller: dobController,
              decoration:
                  const InputDecoration(labelText: 'Enter Date of Birth'),
              keyboardType: TextInputType.datetime,
              onTap: () => _selectDate(context),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _calculateAge(context),
              child: const Text('Calculate Age'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
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
        return Dialog(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Years: $years'),
                Text('Months: $months'),
                Text('Days: $days'),
                Text('Minutes: $minutes'),
                Text('Seconds: $seconds'),
                SizedBox(height: 16.0),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

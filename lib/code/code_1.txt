import 'package:age_calculator/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String myAge = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title:
            const Text("Age Calculator", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).primaryColor,
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ListTile(
              title: Text('Your Age is',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            AppUtils.sizedBox,
            Text(myAge.isEmpty ? 'Not Selected Yet!' : myAge,
                style: const TextStyle(fontSize: 18)),
            AppUtils.sizedBox,
            ElevatedButton(
              onPressed: () {
                AppUtils.dateOfBirthPicker(context, (pickedDate) {
                  setState(() {
                    final age = DateTime.now().difference(pickedDate);
                    myAge =
                        ' ${age.inDays ~/ 365} years, ${(age.inDays % 365) ~/ 30} months, ${(age.inDays % 365) % 30} days';
                  });
                });
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blueGrey,
              ),
              child: const Text('Pick Your Date of Birth'),
            ),
          ],
        ),
      ),
    );
  }
}

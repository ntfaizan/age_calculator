import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime? pickedDoB, pickedAgeAt;

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
            Lottie.asset(
              'assets/lottie/waiting.json',
              fit: BoxFit.contain,
            ),
            Lottie.network(
                'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'),
            Row(
              children: [
                InkWell(
                  onTap: () async {
                    pickedDoB = await _selectDate(context);
                    if (pickedDoB != null) {
                      setState(() {});
                    }
                  },
                  child: const Text(
                    'Date of Birth: ',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(pickedDoB != null ? pickedDoB.toString() : ''),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                GestureDetector(
                  onTap: () async {
                    pickedAgeAt = await _selectDate(context);
                    if (pickedAgeAt != null) {
                      setState(() {});
                    }
                  },
                  child: const Text(
                    'Age at the Date of: ',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(pickedAgeAt != null ? pickedAgeAt.toString() : '')
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<DateTime?> _selectDate(BuildContext context) async {
    return await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990, 1),
      lastDate: DateTime.now(),
    );
  }
}

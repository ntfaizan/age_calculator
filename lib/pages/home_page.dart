import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime? pickedDoB, pickedAgeAt;
  String? o1;
  String? o2;

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
            Lottie.asset('assets/lottie/cycle.json'),
            Row(
              children: [
                InkWell(
                  onTap: () async {
                    pickedDoB = await _selectDate(context);
                    setState(() {});
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
                    setState(() {});
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
            ElevatedButton(
              onPressed: () {
                if (pickedDoB != null && pickedAgeAt != null) {
                  calculateAge(pickedAgeAt!, pickedDoB!);
                }
              },
              child: const Text('Calculate'),
            ),
            Text(o1 ?? ''),
            Text(o2 ?? ''),
          ],
        ),
      ),
    );
  }

  void calculateAge(DateTime dt1, DateTime dt2) {
    Duration diff = dt1.difference(dt2);

    o1 = '${diff.inDays} days';
    o2 = '${diff.inHours} hours';

    print('${diff.inDays ~/ 7} weeks');
    print('${diff.inDays} days');
    print('${diff.inHours} hours');

    print("${diff.inMinutes} minutes");

    print("${diff.inSeconds} seconds");
    setState(() {});

// 3 years 4 months 5 days
// or 40 months 5 days
// or 174 weeks 4 days
// or 1,222 days
// or 29,328 hours
// or 1,759,680 minutes
// or 105,580,800 seconds
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

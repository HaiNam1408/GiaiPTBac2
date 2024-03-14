import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController aCtrl = TextEditingController();
  TextEditingController bCtrl = TextEditingController();
  TextEditingController cCtrl = TextEditingController();

  String result = '';

  double? a;
  double? b;
  double? c;

  void updateResult(String val) {
    setState(() {
      result = val;
    });
  }

  void updateValue(String key, double? val) {
    if (key == 'a') {
      setState(() {
        a = val;
      });
    } else if (key == 'b') {
      setState(() {
        b = val;
      });
    } else if (key == 'c') {
      setState(() {
        c = val;
      });
    }
  }

  void solve(double? a, double? b, double? c) {
    if (a == null || b == null || c == null) {
      updateResult('Hệ số không hợp lệ!');
      return;
    }
    double delta = b * b - 4 * a * c;
    double x1, x2;

    if (a == 0) {
      if (b == 0) {
        updateResult('Phương trình có vô số nghiệm!');
        return;
      } else {
        updateResult('Phương trình vô nghiệm!');
        return;
      }
    }

    if (delta > 0) {
      x1 = (-b + sqrt(delta)) / (2 * a);
      x2 = (-b - sqrt(delta)) / (2 * a);
      updateResult('Nghiệm của phương trình là: \nx1 = $x1, x2 = $x2');
      return;
    } else if (delta == 0) {
      x1 = -b / (2 * a);
      updateResult('Phương trình có 1 nghiệm kép là: \nx = $x1');
      return;
    } else {
      updateResult('Phương trình vô nghiệm!');
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Giải Phương Trình Bậc 2',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          backgroundColor: Colors.deepPurple),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(
              'Phương trình của bạn:\n${a ?? 'a'}x^2 + ${b ?? 'b'}x + ${c ?? 'c'} = 0'),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 50,
            margin: const EdgeInsets.all(8),
            child: TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) => updateValue('a', double.tryParse(value)),
              controller: aCtrl,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(14),
                labelText: 'Nhập hệ số a',
                labelStyle: TextStyle(color: Colors.grey),
                floatingLabelStyle: TextStyle(color: Colors.blue),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.blue)),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 50,
            margin: const EdgeInsets.all(8),
            child: TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) => updateValue('b', double.tryParse(value)),
              controller: bCtrl,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(14),
                labelText: 'Nhập hệ số b',
                labelStyle: TextStyle(color: Colors.grey),
                floatingLabelStyle: TextStyle(color: Colors.blue),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.blue)),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 50,
            margin: const EdgeInsets.all(8),
            child: TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) => updateValue('c', double.tryParse(value)),
              controller: cCtrl,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(14),
                labelText: 'Nhập hệ số c',
                labelStyle: TextStyle(color: Colors.grey),
                floatingLabelStyle: TextStyle(color: Colors.blue),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.blue)),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                solve(a, b, c);
              },
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 8))),
              child: const Text('Giải')),
          const SizedBox(height: 40),
          Text(result)
        ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../components/compound_input.dart';
import '../components/enter_princ.dart';
import '../components/interest_enter.dart';
import '../components/years.dart';

class CalculatorActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compound Interest Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InterestEnter(),
            PrincipalEnter(),
            CompoundInput(),
            Years(),
            // Add output component here
          ],
        ),
      ),
    );
  }
}

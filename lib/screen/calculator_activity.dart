import 'package:flutter/material.dart';

class CalculatorActivity extends StatefulWidget {
  @override
  _CalculatorActivityState createState() => _CalculatorActivityState();
}

class _CalculatorActivityState extends State<CalculatorActivity> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController principalController;
  late TextEditingController rateController;
  late TextEditingController compoundFreqController;
  late TextEditingController yearsController;

  double compoundInterest = 0.0;

  @override
  void initState() {
    super.initState();
    principalController = TextEditingController();
    rateController = TextEditingController();
    compoundFreqController = TextEditingController();
    yearsController = TextEditingController();
  }

  @override
  void dispose() {
    principalController.dispose();
    rateController.dispose();
    compoundFreqController.dispose();
    yearsController.dispose();
    super.dispose();
  }

  void calculateCompoundInterest() {
    double principal = double.tryParse(principalController.text) ?? 0.0;
    double rate = double.tryParse(rateController.text) ?? 0.0;
    int compoundFreq = int.tryParse(compoundFreqController.text) ?? 1;
    int years = int.tryParse(yearsController.text) ?? 1;

    double compound = principal *
        (1 + rate / compoundFreq) *
        (compoundFreq * years);
    setState(() {
      compoundInterest = compound;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compound Interest Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: principalController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Principal Amount'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter principal amount';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: rateController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Rate of Interest (%)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter rate of interest';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: compoundFreqController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Compound Frequency'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter compound frequency';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: yearsController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Number of Years'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter number of years';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    calculateCompoundInterest();
                  }
                },
                child: Text('Calculate'),
              ),
              SizedBox(height: 20),
              Text(
                'Compound Interest: $compoundInterest',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

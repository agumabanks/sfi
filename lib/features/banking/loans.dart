import 'package:Sanaa/features/banking/loans/loansPage.dart';
import 'package:flutter/material.dart';

import 'loans/widget/loanCard.dart';


class LoansPage extends StatefulWidget {
  @override
  _LoansPageState createState() => _LoansPageState();
}

class _LoansPageState extends State<LoansPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _loanType = 'Business Loan';
  double _loanAmount = 0;
  double _interestRate = 0;
  int _loanTerm = 0;
  double _monthlyPayment = 0;

  void _calculateLoan() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        // double monthlyInterestRate = _interestRate / 12 / 100;
        // int numberOfPayments = _loanTerm * 12;
        // _monthlyPayment = (_loanAmount * monthlyInterestRate) /
        //     (1 - ).pow()      
            
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sanaa Loans'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LoanApp()
      ),
    );
  }
}







// Text(
//                 'Available Loan Types',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               ListTile(
//                 title: Text('Business Loan'),
//                 leading: Radio<String>(
//                   value: 'Business Loan',
//                   groupValue: _loanType,
//                   onChanged: (String? value) {
//                     setState(() {
//                       _loanType = value!;
//                     });
//                   },
//                 ),
//               ),
//               ListTile(
//                 title: Text('Personal Loan'),
//                 leading: Radio<String>(
//                   value: 'Personal Loan',
//                   groupValue: _loanType,
//                   onChanged: (String? value) {
//                     setState(() {
//                       _loanType = value!;
//                     });
//                   },
//                 ),
//               ),
//               ListTile(
//                 title: Text('Home Loan'),
//                 leading: Radio<String>(
//                   value: 'Home Loan',
//                   groupValue: _loanType,
//                   onChanged: (String? value) {
//                     setState(() {
//                       _loanType = value!;
//                     });
//                   },
//                 ),
//               ),
//               Divider(),
//               Form(
//                 key: _formKey,
//                 child: Column(
//                   children: <Widget>[
//                     TextFormField(
//                       decoration: InputDecoration(labelText: 'Loan Amount'),
//                       keyboardType: TextInputType.number,
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'Please enter a loan amount';
//                         }
//                         return null;
//                       },
//                       onSaved: (value) {
//                         _loanAmount = double.parse(value!);
//                       },
//                     ),
//                     TextFormField(
//                       decoration: InputDecoration(labelText: 'Interest Rate (%)'),
//                       keyboardType: TextInputType.number,
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'Please enter an interest rate';
//                         }
//                         return null;
//                       },
//                       onSaved: (value) {
//                         _interestRate = double.parse(value!);
//                       },
//                     ),
//                     TextFormField(
//                       decoration: InputDecoration(labelText: 'Loan Term (years)'),
//                       keyboardType: TextInputType.number,
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'Please enter a loan term';
//                         }
//                         return null;
//                       },
//                       onSaved: (value) {
//                         _loanTerm = int.parse(value!);
//                       },
//                     ),
//                     SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: _calculateLoan,
//                       child: Text('Calculate'),
//                     ),
//                     SizedBox(height: 20),
//                     Text(
//                       'Monthly Payment: \$${_monthlyPayment.toStringAsFixed(2)}',
//                       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ),
            

import 'package:Sanaa/features/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../domain/network_service.dart';
import '../domain/userLoan.dart';
// import 'network_service.dart';
// import 'user_loan.dart';



class UserLoansScreen extends StatefulWidget {
  @override
  _UserLoansScreenState createState() => _UserLoansScreenState();
}

class _UserLoansScreenState extends State<UserLoansScreen> {
  late Future<List<UserLoan>> futureUserLoans;

  @override
  void initState() {
    super.initState();
    futureUserLoans = Get.find<AuthController>().getUserLoans();// NetworkService().fetchUserLoans(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Loans'),
      ),
      body: FutureBuilder<List<UserLoan>>(
        future: futureUserLoans,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No loans found.'));
          }

          final loans = snapshot.data!;

          return ListView.builder(
            itemCount: loans.length,
            itemBuilder: (context, index) {
              final loan = loans[index];
              return ListTile(
                title: Text('Loan ID: ${loan.id}'),
                subtitle: Text('Amount: ${loan.amount}'),
                trailing: Text('Status: ${loan.status}'),
              );
            },
          );
        },
      ),
    );
  }
}
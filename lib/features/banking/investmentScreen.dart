import 'package:flutter/material.dart';

class InvestmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Investments'),
      ),
      body: Column(
        children: [
          SavingsBalancesWidget(),
          SavingsOverviewWidget(),
          GoalBudgetingWidget(),
          SavingsGraphWidget(),
        ],
      ),
    );
  }
}

class SavingsBalancesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // Widget 1: Savings Balances
      child: Text('Savings Balances'),
    );
  }
}

class SavingsOverviewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // Widget 2: Savings Overview
      child: Text('Savings Overview'),
    );
  }
}

class GoalBudgetingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // Widget 3: Goal Budgeting
      child: Text('Goal Budgeting'),
    );
  }
}

class SavingsGraphWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // Widget 4: Savings Graph
      child: Text('Savings Graph'),
    );
  }
}
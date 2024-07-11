import 'package:Sanaa/features/banking/savings/widget/investCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class InvestmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      body: Stack(
        children: [
        SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                  height: 50,
                ),
              // Sacco Share Value
              SaccoShareValue(),
              const SizedBox(height: 16.0),
        
              // Investment Summary
              InvestmentSummary(),
              const SizedBox(height: 16.0),
        
              // Available Investment Plans
              const Text(
                "Available Investment Plans",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              AvailableInvestmentPlans(),
              const SizedBox(height: 16.0),
        
              // Upgrade Plan Section
              const Text(
                "Upgrade Your Plan",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              UpgradePlanSection(),
              const SizedBox(height: 16.0),
        
              // My Investments
              const Text(
                "My Investments",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              MyInvestments(),
              const SizedBox(height: 16.0),
        
              // Recent Transactions
              const Text(
                "Recent Transactions",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              RecentTransactions(),
             
            ],
          ),
        ),
       header()
        ]
        
         ),
       
    );
  }

  // Text("Sanaa Invest")
  Widget header() {
    return Positioned(
      top: 0,
      child: Container(
          // height: 83,
          width: Get.width,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 226, 226, 226),
            
          ),
          child: Padding(
            padding:  const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                
                // 
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(result: false),
                          child: const Icon(Icons.arrow_back_ios, size:25)),
                        // Text('Cards', style: TextStyle(fontSize: 20),),
                      ],
                    ),
                  ),
                   
                  const Text("Sanaa Invest"),
      
                   const Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: Icon(Icons.notifications, size:27),
                  ),
                ],),
              ],
            ),
          )
          ),
    );
  }
  
}


class SaccoShareValue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Sacco Share Value",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text("Current Value: \105,000/="),
          ],
        ),
      ),
    );
  }
}

class InvestmentSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IvestCard() ;
  }
}

class AvailableInvestmentPlans extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          InvestmentPlanCard(
            planName: "Sacco Shares",
            minInvestment: 100000,
            description: "Invest in Sacco shares and earn annual dividends.",
          ),
          const SizedBox(width: 10.0),
          InvestmentPlanCard(
            planName: "Fixed Deposits",
            minInvestment: 500000,
            description: "Secure investment with fixed returns.",
          ),
          const SizedBox(width: 10.0),
          InvestmentPlanCard(
            planName: "Real Estate Fund",
            minInvestment: 1000000,
            description: "Invest in real estate and earn rental income.",
          ),
        ],
      ),
    );
  }
}

class InvestmentPlanCard extends StatelessWidget {
  final String planName;
  final int minInvestment;
  final String description;

  InvestmentPlanCard({required this.planName,required this.minInvestment,required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              planName,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text("Minimum Investment: ${minInvestment.toString()} /="),
            const SizedBox(height: 8.0),
            Text(description),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Invest Now"),
            ),
          ],
        ),
      ),
    );
  }
}

class UpgradePlanSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          UpgradePlanCard(
            planName: "Plus",
            price: 39900,
            description: "Enjoy extra perks like priority in-app support and everyday spending protection.",
          ),
          const SizedBox(width: 10.0),
          UpgradePlanCard(
            planName: "Premium",
            price: 79900,
            description: "Discover flexible benefits that fit your life at home, and take you all over the globe.",
          ),
          const SizedBox(width: 10.0),
          UpgradePlanCard(
            planName: "Ultra",
            price: 95000,
            description: "Experience the exceptional, featuring exclusive lifestyle benefits, world-class travel, and a precision engineered, platinum-plated card.",
          ),
        ],
      ),
    );
  }
}

class UpgradePlanCard extends StatelessWidget {
  final String planName;
  final double price;
  final String description;

  UpgradePlanCard({required this.planName,required this.price,required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: Get.width * 0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                planName,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Text("Price: ${price.toStringAsFixed(2)}/= /month"),
              const SizedBox(height: 8.0),
              Text(description),
              const SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Upgrade Now"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyInvestments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          MyInvestmentCard(
            investmentName: "Sacco Shares",
            investedAmount: 100000,
            currentValue: 105000,
          ),
          const SizedBox(width: 10.0),
          MyInvestmentCard(
            investmentName: "Fixed Deposits",
            investedAmount: 500000,
            currentValue: 535000,
          ),
        ],
      ),
    );
  }
}

class MyInvestmentCard extends StatelessWidget {
  final String investmentName;
  final int investedAmount;
  final int currentValue;

  MyInvestmentCard({required this.investmentName,required  this.investedAmount,required  this.currentValue});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              investmentName,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text("Invested Amount: ${investedAmount.toString()}/="),
            Text("Current Value: ${currentValue.toString()}/="),
          ],
        ),
      ),
    );
  }
}

class RecentTransactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
              width: Get.width, // Adjust the width as needed
              height: 400, // Adjust the height as needed
              decoration: BoxDecoration(
                color: Color.fromARGB(61, 0, 255, 229),
                borderRadius: BorderRadius.circular(10),
              ),
              // ch
      child: SingleChildScrollView(
        child: Column(
          children: [
            RecentTransactionCard(
              date: "2024-07-01",
              investmentName: "Sacco Shares",
              amount: 1000,
              status: "Success",
            ),
            RecentTransactionCard(
              date: "2024-07-02",
              investmentName: "Fixed Deposit",
              amount: 500,
              status: "Pending",
            ),
            RecentTransactionCard(
              date: "2024-07-02",
              investmentName: "Fixed Deposit",
              amount: 500,
              status: "Pending",
            ),
            RecentTransactionCard(
              date: "2024-07-02",
              investmentName: "Fixed Deposit",
              amount: 500,
              status: "Pending",
            ),
          ],
        ),
      ),
    );
  }
}

class RecentTransactionCard extends StatelessWidget {
  final String date;
  final String investmentName;
  final int amount;
  final String status;

  RecentTransactionCard({required this.date,required  this.investmentName,required  this.amount,required  this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
              width: Get.width, // Adjust the width as needed
              // height: 400, // Adjust the height as needed
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(10),
              ),
              // ch
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text("Status: $status"),
              ],
            ),
            const SizedBox(height: 8.0),
            Text("Investment: $investmentName"),
            Text("Amount: ${amount.toString()}/="),
            
          ],
        ),
      ),
    );
  }
}

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.grey[200],
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Terms of Service"),
          Text("Privacy Policy"),
          Text("Contact Us"),
        ],
      ),
    );
  }
}

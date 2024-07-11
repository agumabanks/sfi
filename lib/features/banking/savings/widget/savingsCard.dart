
import 'package:Sanaa/features/banking/savings/widget/voultCard.dart';
import 'package:Sanaa/util/images.dart';
import 'package:flutter/material.dart';



class savingsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 120),
        VaultCard(),
        
        ],
    );
  }
}
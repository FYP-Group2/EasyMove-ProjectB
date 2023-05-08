import 'package:easymove_merchant/models/merchant.dart';
import 'package:flutter/material.dart';

class MerchantDetail extends StatelessWidget {
  MerchantDetail({super.key, required this.screenWidth, required this.screenHeight});

  final Merchant merchant = Merchant();
  final double screenWidth;
  final double screenHeight;
  final TextStyle boldText = const TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: Color(0xFFB09A73));
  final TextStyle normalText = const TextStyle(fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 25, right: 25, bottom: 25),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(200, 200, 200, 1.0),
                spreadRadius: 2,
                blurRadius: 5),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: const EdgeInsets.only(bottom: 5),child: Text("Username", style: boldText,)),
            Text(merchant.username, style: normalText,),
            const SizedBox(width: double.infinity, height: 15,),
            Padding(padding: const EdgeInsets.only(bottom: 5),child: Text("Company", style: boldText,)),
            Text(merchant.companyName, style: normalText,),
            const SizedBox(width: double.infinity, height: 15,),
            Padding(padding: const EdgeInsets.only(bottom: 5),child: Text("Branch", style: boldText,)),
            Text(merchant.branchName, style: normalText,),
          ],
        ),
      )
    );
  }
}

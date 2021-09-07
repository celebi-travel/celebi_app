import 'package:celebi_project/extensions/context_extension.dart';
import 'package:celebi_project/pages/auth/custom/custom_button.dart';
import 'package:celebi_project/pages/main/payment/service/payment.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    StripeServices.init();
  }

  int amount = 450;
  void payNow(String amount) async {
    //the amount must be transformed to cents
    var response =
        await StripeServices.payNowHandler(amount: amount, currency: 'USD');
    print('response message ${response.message}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      leading: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset('asset/images/logo.jpg')),
                      title: Text(
                        'Ankara Rehberliği',
                        style: context.textTheme.headline4,
                      ),
                      subtitle: Text('Malik Enes',
                          style: context.textTheme.headline6!
                              .copyWith(fontWeight: FontWeight.normal)),
                      trailing: Text('$amount USD',
                          style: context.textTheme.headline5!
                              .copyWith(color: context.colors.primary)),
                    ),
                  );
                },
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20)),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        child: Text('$amount USD')),
                  ),
                ),
                Expanded(
                  child: CustomButton(
                      onPressed: () {
                        payNow(amount.toString());
                      },
                      text: 'Ödemeyi Onaylayın'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

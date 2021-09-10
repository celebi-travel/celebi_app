import 'dart:convert';
import '../../auth/custom/custom_button.dart';
import 'credit_card_form.dart';
import 'credit_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:http/http.dart' as http;
import 'package:stripe_payment/stripe_payment.dart';

class WalletView extends StatefulWidget {
  const WalletView({Key? key}) : super(key: key);

  @override
  _WalletViewState createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double costPrice = 10.0; //dolar
  int amount = 0;

  @override
  void initState() {
    super.initState();
    StripePayment.setOptions(StripeOptions(
        publishableKey:
            'pk_test_51JSn1lEyyn034QBvit65I8zeF5aT7Bm4iOjfJNTEIEZtOkfTNV79UrSHetoMTZ3Xe6iCJUubFDmDexgej365YePS00VJCOI1Gs'));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Credit Card View Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Color(0xffE5E5E5),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              CreditCardWidget(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                showBackView: isCvvFocused,
                obscureCardNumber: true,
                obscureCardCvv: true,
                cardBgColor: Color(0XFF1A4170),
              ),
              buildCardForm(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20)),
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            child: Text('1500 TL')),
                      ),
                    ),
                    Expanded(
                      child: CustomButton(
                          onPressed: () {
                            /*  if (formKey.currentState!.validate()) {
                                    print('valid!');
                                  } else {
                                    print('invalid!');
                                  } */
                          },
                          text: 'Ödemeyi Onaylayın'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded buildCardForm() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CreditCardForm(
              formKey: formKey,
              obscureCvv: true,
              obscureNumber: true,
              cardNumber: cardNumber,
              cvvCode: cvvCode,
              cardHolderName: cardHolderName,
              expiryDate: expiryDate,
              themeColor: Colors.blue,
              cardNumberDecoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  ),
                  hintText: 'XXXX XXXX XXXX XXXX',
                  labelText: 'Number'),
              expiryDateDecoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  borderSide: BorderSide.none,
                ),
                labelText: 'Expired Date',
                hintText: 'XX/XX',
              ),
              cvvCodeDecoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                ),
                labelText: 'CVV',
                hintText: 'XXX',
              ),
              cardHolderDecoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  ),
                  labelText: 'Card Holder Name',
                  hintText: 'Label Smith'),
              onCreditCardModelChange: onCreditCardModelChange,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> startPayment() async {
    StripePayment.setStripeAccount('');
    amount = (10 * 100).toInt();
    PaymentMethod paymentMethod = PaymentMethod();
    paymentMethod = await StripePayment.paymentRequestWithCardForm(
      CardFormPaymentRequest(),
    )
        .then((PaymentMethod paymentMethod) => paymentMethod)
        .catchError((e) => print(e));
    startDirectCharge(paymentMethod);
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}

Future<void> startDirectCharge(PaymentMethod paymentMethod) async {
  print('payment charge started');
  final http.Response response = await http.post(Uri.parse('uri'));
  if (response.body != null) {
    final paymentIntent = jsonDecode(response.body);
    final status = paymentIntent['paymentIntent']['status'];
    final acct = paymentIntent['stripeAccount'];
    if (status == 'succeded') {
      print('payment done');
    } else {
      StripePayment.setStripeAccount(acct);
      await StripePayment.confirmPaymentIntent(
        PaymentIntent(
          paymentMethodId: paymentIntent['paymentIntent']['payment_method'],
          clientSecret: paymentIntent['paymentIntent']['client_secret'],
        ),
      ).then((PaymentIntentResult paymentIntentResult) {
        final paymentStatus = paymentIntentResult.status;
        if (paymentStatus == 'succeded') {
          print('payment done');
        }
      });
    }
  }
}

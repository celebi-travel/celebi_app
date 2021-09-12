import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stripe_payment/stripe_payment.dart';

class PaymentView extends StatefulWidget {
  PaymentView({Key? key}) : super(key: key);

  @override
  _PaymentViewState createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  Token? _paymentToken;
  PaymentMethod? _paymentMethod;
  String? _error;

  //this client secret is typically created by a backend system
  //check https://stripe.com/docs/payments/payment-intents#passing-to-client
  final String? _paymentIntentClientSecret = null;

  PaymentIntentResult? _paymentIntent;
  Source? _source;

  ScrollController _controller = ScrollController();

  final CreditCard testCard = CreditCard(
    number: '4000002760003184',
    expMonth: 12,
    expYear: 21,
    name: 'Test User',
    cvc: '133',
    addressLine1: 'Address 1',
    addressLine2: 'Address 2',
    addressCity: 'City',
    addressState: 'CA',
    addressZip: '1337',
  );

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  initState() {
    super.initState();

    StripePayment.setOptions(StripeOptions(
        publishableKey: "pk_test_aSaULNS8cJU6Tvo20VAXy6rp",
        merchantId: "Test",
        androidPayMode: 'test'));
  }

  void setError(dynamic error) {
    _scaffoldKey.currentState!
        // ignore: deprecated_member_use
        .showSnackBar(SnackBar(content: Text(error.toString())));
    setState(() {
      _error = error.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        key: _scaffoldKey,
        appBar: new AppBar(
          title: new Text('Plugin example app'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                setState(() {
                  _source = null;
                  _paymentIntent = null;
                  _paymentMethod = null;
                  _paymentToken = null;
                });
              },
            )
          ],
        ),
        body: ListView(
          controller: _controller,
          padding: const EdgeInsets.all(20),
          children: <Widget>[
            // ignore: deprecated_member_use
            RaisedButton(
              child: Text("Create Source"),
              onPressed: () {
                StripePayment.createSourceWithParams(SourceParams(
                  type: 'ideal',
                  amount: 1099,
                  currency: 'eur',
                  returnURL: 'example://stripe-redirect',
                )).then((source) {
                  // ignore: deprecated_member_use
                  _scaffoldKey.currentState!.showSnackBar(
                      SnackBar(content: Text('Received ${source.sourceId}')));
                  setState(() {
                    _source = source;
                  });
                  // ignore: invalid_return_type_for_catch_error
                }).catchError(setError);
              },
            ),
            Divider(),
            // ignore: deprecated_member_use
            RaisedButton(
              child: Text("Create Token with Card Form"),
              onPressed: () {
                StripePayment.paymentRequestWithCardForm(
                        CardFormPaymentRequest())
                    .then((paymentMethod) {
                  // ignore: deprecated_member_use
                  _scaffoldKey.currentState!.showSnackBar(
                      SnackBar(content: Text('Received ${paymentMethod.id}')));
                  setState(() {
                    _paymentMethod = paymentMethod;
                  });
                  // ignore: invalid_return_type_for_catch_error
                }).catchError(setError);
              },
            ),
            // ignore: deprecated_member_use
            RaisedButton(
              child: Text("Create Token with Card"),
              onPressed: () {
                StripePayment.createTokenWithCard(
                  testCard,
                ).then((token) {
                  // ignore: deprecated_member_use
                  _scaffoldKey.currentState!.showSnackBar(
                      SnackBar(content: Text('Received ${token.tokenId}')));
                  setState(() {
                    _paymentToken = token;
                  });
                  // ignore: invalid_return_type_for_catch_error
                }).catchError(setError);
              },
            ),
            Divider(),
            // ignore: deprecated_member_use
            RaisedButton(
              child: Text("Create Payment Method with Card"),
              onPressed: () {
                StripePayment.createPaymentMethod(
                  PaymentMethodRequest(
                    card: testCard,
                  ),
                ).then((paymentMethod) {
                  // ignore: deprecated_member_use
                  _scaffoldKey.currentState!.showSnackBar(
                      SnackBar(content: Text('Received ${paymentMethod.id}')));
                  setState(() {
                    _paymentMethod = paymentMethod;
                  });
                  // ignore: invalid_return_type_for_catch_error
                }).catchError(setError);
              },
            ),
            // ignore: deprecated_member_use
            RaisedButton(
              child: Text("Create Payment Method with existing token"),
              onPressed: _paymentToken == null
                  ? null
                  : () {
                      StripePayment.createPaymentMethod(
                        PaymentMethodRequest(
                          card: CreditCard(
                            token: _paymentToken!.tokenId,
                          ),
                        ),
                      ).then((paymentMethod) {
                        // ignore: deprecated_member_use
                        _scaffoldKey.currentState!.showSnackBar(SnackBar(
                            content: Text('Received ${paymentMethod.id}')));
                        setState(() {
                          _paymentMethod = paymentMethod;
                        });
                        // ignore: invalid_return_type_for_catch_error
                      }).catchError(setError);
                    },
            ),
            Divider(),
            // ignore: deprecated_member_use
            RaisedButton(
              child: Text("Confirm Payment Intent"),
              onPressed:
                  _paymentMethod == null || _paymentIntentClientSecret == null
                      ? null
                      : () {
                          StripePayment.confirmPaymentIntent(
                            PaymentIntent(
                              clientSecret: _paymentIntentClientSecret,
                              paymentMethodId: _paymentMethod!.id,
                            ),
                          ).then((paymentIntent) {
                            // ignore: deprecated_member_use
                            _scaffoldKey.currentState!.showSnackBar(SnackBar(
                                content: Text(
                                    'Received ${paymentIntent.paymentIntentId}')));
                            setState(() {
                              _paymentIntent = paymentIntent;
                            });
                            // ignore: invalid_return_type_for_catch_error
                          }).catchError(setError);
                        },
            ),
            // ignore: deprecated_member_use
            RaisedButton(
              child: Text(
                "Confirm Payment Intent with saving payment method",
                textAlign: TextAlign.center,
              ),
              onPressed:
                  _paymentMethod == null || _paymentIntentClientSecret == null
                      ? null
                      : () {
                          StripePayment.confirmPaymentIntent(
                            PaymentIntent(
                              clientSecret: _paymentIntentClientSecret,
                              paymentMethodId: _paymentMethod!.id!,
                              isSavingPaymentMethod: true,
                            ),
                          ).then((paymentIntent) {
                            // ignore: deprecated_member_use
                            _scaffoldKey.currentState?.showSnackBar(SnackBar(
                                content: Text(
                                    'Received ${paymentIntent.paymentIntentId}')));
                            setState(() {
                              _paymentIntent = paymentIntent;
                            });
                            // ignore: invalid_return_type_for_catch_error
                          }).catchError(setError);
                        },
            ),
            // ignore: deprecated_member_use
            RaisedButton(
              child: Text("Authenticate Payment Intent"),
              onPressed: _paymentIntentClientSecret == null
                  ? null
                  : () {
                      StripePayment.authenticatePaymentIntent(
                              clientSecret: _paymentIntentClientSecret!)
                          .then((paymentIntent) {
                        // ignore: deprecated_member_use
                        _scaffoldKey.currentState!.showSnackBar(SnackBar(
                            content: Text(
                                'Received ${paymentIntent.paymentIntentId}')));
                        setState(() {
                          _paymentIntent = paymentIntent;
                        });
                        // ignore: invalid_return_type_for_catch_error
                      }).catchError(setError);
                    },
            ),
            Divider(),
            // ignore: deprecated_member_use
            RaisedButton(
              child: Text("Native payment"),
              onPressed: () {
                if (Platform.isIOS) {
                  _controller.jumpTo(450);
                }
                StripePayment.paymentRequestWithNativePay(
                  androidPayOptions: AndroidPayPaymentRequest(
                    totalPrice: "1.20",
                    currencyCode: "EUR",
                  ),
                  applePayOptions: ApplePayPaymentOptions(
                    countryCode: 'DE',
                    currencyCode: 'EUR',
                    items: [
                      ApplePayItem(
                        label: 'Test',
                        amount: '13',
                      )
                    ],
                  ),
                ).then((token) {
                  setState(() {
                    // ignore: deprecated_member_use
                    _scaffoldKey.currentState!.showSnackBar(
                        SnackBar(content: Text('Received ${token.tokenId}')));
                    _paymentToken = token;
                  });
                  // ignore: invalid_return_type_for_catch_error
                }).catchError(setError);
              },
            ),
            // ignore: deprecated_member_use
            RaisedButton(
              child: Text("Complete Native Payment"),
              onPressed: () {
                StripePayment.completeNativePayRequest().then((_) {
                  // ignore: deprecated_member_use
                  _scaffoldKey.currentState!.showSnackBar(
                      SnackBar(content: Text('Completed successfully')));
                  // ignore: invalid_return_type_for_catch_error
                }).catchError(setError);
              },
            ),
            Divider(),
            Text('Current source:'),
            Text(
              JsonEncoder.withIndent('  ').convert(_source?.toJson() ?? {}),
              style: TextStyle(fontFamily: "Monospace"),
            ),
            Divider(),
            Text('Current token:'),
            Text(
              JsonEncoder.withIndent('  ')
                  .convert(_paymentToken?.toJson() ?? {}),
              style: TextStyle(fontFamily: "Monospace"),
            ),
            Divider(),
            Text('Current payment method:'),
            Text(
              JsonEncoder.withIndent('  ')
                  .convert(_paymentMethod?.toJson() ?? {}),
              style: TextStyle(fontFamily: "Monospace"),
            ),
            Divider(),
            Text('Current payment intent:'),
            Text(
              JsonEncoder.withIndent('  ')
                  .convert(_paymentIntent?.toJson() ?? {}),
              style: TextStyle(fontFamily: "Monospace"),
            ),
            Divider(),
            Text('Current error: $_error'),
          ],
        ),
      ),
    );
  }
}

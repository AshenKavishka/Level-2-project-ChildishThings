import "package:flutter/material.dart";
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:mypart/item_page.dart';
import 'package:mypart/app_bar.dart';
enum MenuItem{
  item1,
  item2,
  item3,
  item4,
}

class CreditCardPage extends StatefulWidget {
  const CreditCardPage({Key? key}) : super(key: key);

  @override
  State<CreditCardPage> createState() => _CreditCardPageState();
}

class _CreditCardPageState extends State<CreditCardPage> {
  void visbility(){
    setState(() {
      cvcState=!cvcState;

    });
  }
  bool cvcState=false;
  String cardNumber='';
  String expirydate='';
  String cardHolderName='';
  String cvcCode='';
  bool isCvvFocused=false;
  final GlobalKey<FormState> formkey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Payment',
      ),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            CreditCardWidget(
                cardNumber:cardNumber,
                expiryDate: expirydate,
                cardHolderName: cardHolderName,
                cvvCode: cvcCode,
                showBackView:isCvvFocused,
                obscureCardNumber: true,
                obscureCardCvv: true,
                cardBgColor: Colors.blue,
                cardType:CardType.visa ,



            ),
            Expanded(child: SingleChildScrollView(
              child: Column(
                children: [
                  CreditCardForm(
                      cardNumber: cardNumber,
                      expiryDate: expirydate,
                      cardHolderName: cardHolderName,
                      cvvCode: cvcCode,obscureCvv:cvcState ,
                      onCreditCardModelChange:onCreditCardModelChange,
                      themeColor: Colors.lightBlue,
                      formKey: formkey,
                      cardNumberDecoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Number',
                        hintText: 'xxxx xxxx xxxx xxxx',
                      ),
                      expiryDateDecoration: InputDecoration(

                        border: OutlineInputBorder(),
                        labelText: 'ExpiryDate',
                        hintText: 'MM/YY',
                      ),
                      cvvCodeDecoration: InputDecoration(

                        border: OutlineInputBorder(),
                        labelText: 'CVC',
                        hintText: 'xxx',
                        prefixIcon: IconButton(
                            padding: EdgeInsets.only(bottom: 5),
                            icon: Icon(Icons.remove_red_eye),
                            onPressed: visbility),
                      ),
                      cardHolderDecoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Card Holder',
                        hintText: 'xxxxx xxxxx',
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 100),
                    child: ElevatedButton(onPressed: (){
                      if(formkey.currentState!.validate()){
                        print('valid');
                      }
                      else{
                        print('invalid');
                      }
                    },
                        style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)
                        ),
                        primary: Color(0xFF2196F3)
                        ),
                        child: Container(
                          margin: EdgeInsets.all(8.0),
                          child: Text(
                            'Validate',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'halter',
                              fontSize: 14,
                              package: 'flutter_credit_card'
                            ),
                          ),

                        ),
                    ),
                  )

                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
  void onCreditCardModelChange(CreditCardModel creditCardModel){
    setState(() {
      cardNumber=creditCardModel.cardNumber;
      expirydate=creditCardModel.expiryDate;
      cardHolderName=creditCardModel.cardHolderName;
      cvcCode=creditCardModel.cvvCode;
      isCvvFocused=creditCardModel.isCvvFocused;
    });
  }
}

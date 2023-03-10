// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, avoid_print, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/signup_screen.dart';

class LoginScreen extends StatefulWidget{

    @override
    _LoginScreenState createState() => _LoginScreenState();
    
}





class _LoginScreenState extends State<LoginScreen> {

    bool isRememberMe = false;
    Widget buildEmail(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Email',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),
      ),
      SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0,2)
            )
          ]
          ),
          height: 60,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black87
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.email,
                color: Color(0xff0048ba),
              ),
              hintText: 'Email',
              hintStyle: TextStyle(
                color: Colors.black38
              )
            ),
          ),
      )
    ],
  );
}

    Widget buildPassword(){
   return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Password',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),
      ),
      SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0,2)
            )
          ]
          ),
          height: 60,
          child: TextField(
            obscureText: true,
            style: TextStyle(
              color: Colors.black87
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.lock,
                color: Color(0xff0048ba),
              ),
              hintText: 'Password',
              hintStyle: TextStyle(
                color: Colors.black38
              )
            ),
          ),
      )
    ],
  );
}

    Widget buildForgotPassBtn(){
  return Container(
    alignment: Alignment.centerRight,
    child: TextButton(
      onPressed: () => print("Forgot Password pressed"),
      style: TextButton.styleFrom(
        minimumSize: Size.zero,
        padding: EdgeInsets.all(0),
      ),
      child: Text(
        'Forgot Password?',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
      ),
    ),
  );
}

    Widget buildRememberCb(){
  return Container(
    height: 20,
    child: Row(
      children: <Widget>[
        Theme(
          data: ThemeData(unselectedWidgetColor: Colors.white), 
          child: Checkbox(
            value: isRememberMe,
            checkColor: Colors.blue,
            activeColor: Colors.white,
            onChanged: (value){
              setState(() {
                isRememberMe = value!;
              });
            },
            ),
          ),
          Text(
            'Remember me',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          )
      ],
    ),
  );
}

    Widget buildLoginBtn(){
      return Container(
          padding: EdgeInsets.symmetric(vertical: 25),
          width: double.infinity,
          child: ElevatedButton(
                  onPressed: () => print('Login Pressed'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    )
                  ),
                  child: Text(
                      'LOGIN',
                      style: TextStyle(
                        color: Color.fromARGB(255, 3, 44, 110),
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                ),
      );
    }

    Widget buildSignupBtn(){
      return GestureDetector(
          onTap: () => {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => SignUpScreen()))
          },
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Don\'t have an Account? ',
                  style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500
                )
                ),
                TextSpan(
                  text: 'Sign Up',
                  style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                  ) 
                )
              ]
          ),
        ),
      );
    }
    @override
    Widget build(BuildContext context){
        return Scaffold(
            body: AnnotatedRegion<SystemUiOverlayStyle>(
                value:SystemUiOverlayStyle.light,
                child:GestureDetector(
                    child:Stack(
                        children: <Widget>[
                            Container(
                                height: double.infinity,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end:Alignment.bottomCenter,
                                        colors:[
                                            Color(0x660048ba),
                                            Color(0x990048ba),
                                            Color(0xcc0048ba),
                                            Color(0xff0048ba),
                                        ]
                                    )
                                ),
                               child: SingleChildScrollView(
                                physics: AlwaysScrollableScrollPhysics(),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 25,
                                  vertical: 120
                                ),
                                 child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:<Widget>[
                                        Text(
                                            'SignIn',
                                            style:TextStyle(
                                               color: Colors.white,
                                               fontSize: 40,
                                               fontWeight: FontWeight.bold     
                                            ),
                                        ),
                                        SizedBox(height: 50),
                                        buildEmail(),
                                        SizedBox(height: 20),
                                        buildPassword(),
                                        SizedBox(height: 10),
                                        buildForgotPassBtn(),
                                        buildRememberCb(),
                                        buildLoginBtn(),
                                        buildSignupBtn(),
                                    ],
                                ),
                               ),
                            ),
                        ],
                    ),
                ),
            ),
        );
    
    }


}
import 'package:bartaaapp/front/VerifyNo.dart';
import 'package:bartaaapp/frontpage_animation/core/viewmodels/home_model.dart';
import 'package:bartaaapp/frontpage_animation/ui/shared/globals.dart';
import 'package:bartaaapp/frontpage_animation/ui/widgets/textfield_widget.dart';
import 'package:bartaaapp/frontpage_animation/ui/widgets/wave_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  var verificationID;
  String phone = "";
  String code;
  String name="";
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    final model = Provider.of<HomeModel>(context);

    return Scaffold(
      backgroundColor: Global.white,
      body:Stack(
        children: <Widget>[
          Container(
            height: size.height - 200,
            color: Colors.deepPurple,
            //color: Colors.black,
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeOutQuad,
            top: keyboardOpen ? -size.height / 3.7 : 0.0,
            child: WaveWidget(
              size: size,
              yOffset: size.height / 3.0,
              color: Global.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Welcome to Barta ',
                  style: TextStyle(
                    color: Global.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextFieldWidget(
                  hintText: 'Name',
                  obscureText: false,
                  prefixIconData: Icons.perm_identity,
                  suffixIconData: model.isValid ? Icons.check : null,
                  onChanged: (value) {
                    model.isValidEmail(value);
                  },
                ),
                TextFieldWidget(
                  hintText: 'Mobile Number',
                  obscureText: false,
                  prefixIconData: Icons.phone_android,
                  suffixIconData: model.isValid ? Icons.check : null,
                  onChanged: (value) {
                    setState(() {
                      phone=value;
                    });
                  },
                ),

                SizedBox(
                  height: 10.0,
                ),
//                Column(
//                  crossAxisAlignment: CrossAxisAlignment.end,
//                  children: <Widget>[
//                    TextFieldWidget(
//                      hintText: 'Password',
//                      obscureText: model.isVisible ? false : true,
//                      prefixIconData: Icons.lock_outline,
//                      suffixIconData: model.isVisible
//                          ? Icons.visibility
//                          : Icons.visibility_off,
//                    ),
//                    SizedBox(
//                      height: 10.0,
//                    ),
//                    clickableText(),
//                  ],
//                ),
////                SizedBox(
////                  height: 20.0,
////                ),
                RaisedButton(

                  onPressed:_auth,
//                  {
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(builder: (context) => VerifyNo()),
//
                  child: Text('Continue', style: TextStyle(fontSize: 16)),
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _auth( ) async {
    print(phone);
    String phoneNumber ="+91"+phone;
    firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: Duration(seconds: 60),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSend,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout
    );
  }

  codeSend(String verificationId, [int forceResendingToken]) async {
    print("codeSend");
    print(verificationId);
    setState(() {
      verificationID = verificationId;
    });
  }
  codeAutoRetrievalTimeout(String verificationId) async {
    print("codeAutoRetrievalTimeout");
    print(verificationId);
    pageChange(verificationId);
  }


//  final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout = (String verificationId) {
//    print("codeAutoRetrievalTimeout");
//    print(verificationId);
//  };
  verificationFailed(AuthException authException) async {
    print("verificationFailed");
    print(authException);
    // pageChange(verificationID);
    print(authException.code);
    print(authException.message);
  }

//  final PhoneVerificationFailed verificationFailed = (AuthException authException) {
//    print("verificationFailed");
//    print(authException);
//  };

  verificationCompleted(AuthCredential auth) async {
    print("verificationCompleted");
    print(auth);
    final result = await firebaseAuth.signInWithCredential(auth);
    print(result.user.uid);


    //final credential = await PhoneAuthProvider.getCredential(verificationId: verificationId, smsCode: smsCode);
    //return "";
  }

//  __login() async {
//
//    print(verificationID);
//    final credential = await PhoneAuthProvider.getCredential(verificationId: verificationID, smsCode: code);
//    try {
//      final result = await firebaseAuth.signInWithCredential(credential);
//      print(result);
//    } catch (e ){
//      print(e);
//    }
//  }
pageChange(verificationId){
   // var obj = VerifyNo();
  Navigator.push(context, MaterialPageRoute(builder:(context)=> VerifyNo(verificationID)) );
}
}

//}

clickableText() {
  return GestureDetector(
      child: RichText(
        text: TextSpan(
          text: "Forgot Password ",
          style: TextStyle(color: Colors.blue, fontSize: 15),
        ),
      ),
      onTap: () {
        print("printed");
      });
}

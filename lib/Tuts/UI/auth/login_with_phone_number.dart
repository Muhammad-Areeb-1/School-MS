import 'package:cld_frstr/Tuts/UI/Widgets/round_button.dart';
import 'package:cld_frstr/Tuts/UI/auth/verify_code.dart';
import 'package:cld_frstr/Tuts/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginWithPhoneNumber extends StatefulWidget {
  const LoginWithPhoneNumber({super.key});

  @override
  State<LoginWithPhoneNumber> createState() => _LoginWithPhoneNumberState();
}

class _LoginWithPhoneNumberState extends State<LoginWithPhoneNumber> {

  final auth = FirebaseAuth.instance;
  final phoneNumberController = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Login with phone number'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 50,),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: phoneNumberController,
              decoration: const InputDecoration(
                hintText: '11 2222 333 444'
              ),
            ),
            const SizedBox(height: 30,),
            RoundButton(
              title: 'Login',
              loading: loading,
              onTap: (){
                setState(() {
                  loading = true;
                });
                auth.verifyPhoneNumber(
                  phoneNumber: "+${phoneNumberController.text}",
                  verificationCompleted: (_){
                    setState(() {
                      loading = false;
                    });
                  },
                  verificationFailed: (e){
                    setState(() {
                      loading = false;
                    });
                    Utils().toastMessage(e.toString());
                  },
                  codeSent: (verificationId, forceResendingToken) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VerifyCodeScreen(verificationId: verificationId,)
                      )
                    );
                    setState(() {
                      loading = false;
                    });
                  },
                  codeAutoRetrievalTimeout: (e){
                    Utils().toastMessage(e.toString());
                    setState(() {
                      loading = false;
                    });
                  }
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}
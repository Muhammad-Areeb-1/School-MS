import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

// import 'package:cld_frstr/Tuts/UI/posts/post_screen.dart';
import 'package:cld_frstr/Tuts/UI/FireStore/firestore_list_screen.dart';
import '../Widgets/round_button.dart';

class VerifyCodeScreen extends StatefulWidget {
  final String verificationId;

  const VerifyCodeScreen({super.key, required this.verificationId});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  
  final auth = FirebaseAuth.instance;
  final verifyCodeController = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Verify phone number'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 50,),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: verifyCodeController,
              decoration: const InputDecoration(
                hintText: '6 Digit Code'
              ),
            ),
            const SizedBox(height: 30,),
            RoundButton(
              title: 'Verify',
              loading: loading,
              onTap: () async {
                setState(() {
                  loading = true;
                });
                final credential = PhoneAuthProvider.credential(
                  verificationId: widget.verificationId,
                  smsCode: verifyCodeController.text.toString()
                );

                final currentContext = context;

                try {
                  await auth.signInWithCredential(credential);

                  // ignore: use_build_context_synchronously
                  Navigator.push(
                    currentContext, MaterialPageRoute(
                      builder: (context) => const FirestoreScreen()));
                } catch (e) {
                    setState(() {
                    loading = false;
                  });
                }
              }
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:cld_frstr/Tuts/UI/Widgets/round_button.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Landing Page'),
      ),
      body: Column(
        children: [
          RoundButton(
            onTap: (){},
            title: 'Sign In'
          ),
          RoundButton(
            onTap: (){},
            title: 'Sign Up'
          ),
        ],
      ),
    );
  }
}
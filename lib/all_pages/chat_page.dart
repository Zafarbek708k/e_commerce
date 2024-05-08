import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
            const Text("He does not have a temporary job",style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700)),
            Lottie.asset('assets/lotties/in_progress.json'),
          ],
        ),
      ),
    );
  }
}

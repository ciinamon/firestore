import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Username List'),
          backgroundColor: Colors.cyan,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(onPressed: () {}, child: const Text('C')),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () async {
                  final result = await FirebaseFirestore.instance.collection('username').get();
                  debugPrint(result.toString());
                  debugPrint(result.docs.toString());
                  debugPrint(result.docs[0].toString());
                  debugPrint(result.docs[0].id.toString());
                  debugPrint(result.docs[0].data().toString());
                  debugPrint(result.docs[0].data()['nama'].toString());
                  debugPrint(result.docs[0].data()['umur'].toString());
                },
                child: const Text('R'),
              ),
              const SizedBox(height: 20),
              OutlinedButton(onPressed: () {}, child: const Text('U')),
              const SizedBox(height: 20),
              OutlinedButton(onPressed: () {}, child: const Text('D')),
              const SizedBox(height: 20),
            ],
          ),
        ));
  }
}

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
              OutlinedButton(
                onPressed: () async {
                  await FirebaseFirestore.instance.collection('username').doc('aaa').set({
                    'nama': 'coco',
                    'umur': 12,
                  });
                },
                child: const Text('C'),
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () async {
                  final collectionResult = await FirebaseFirestore.instance.collection('username').get();
                  debugPrint(collectionResult.docs.toString());
                },
                child: const Text('R Collection'),
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () async {
                  final documentResult = await FirebaseFirestore.instance.collection('username').doc('aaa').get();
                  debugPrint(documentResult.data().toString());
                  debugPrint(documentResult.data()!['nama'].toString());
                  debugPrint(documentResult.data()!['umur'].toString());
                  debugPrint(documentResult.id.toString());
                },
                child: const Text('R Document'),
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () async {
                  await FirebaseFirestore.instance.collection('username').doc('aaa').update({
                    'nama': 'cucu',
                    'umur': 31,
                  });
                },
                child: const Text('U'),
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () async {
                  await FirebaseFirestore.instance.collection('username').doc('aaa').delete();
                },
                child: const Text('D'),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ));
  }
}

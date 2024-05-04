import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cld_frstr/Tuts/UI/Widgets/round_button.dart';
import 'package:cld_frstr/Tuts/utils/utils.dart';

class AddFirestorePostScreen extends StatefulWidget {
  const AddFirestorePostScreen({super.key});

  @override
  State<AddFirestorePostScreen> createState() => _AddFirestorePostScreenState();
}

class _AddFirestorePostScreenState extends State<AddFirestorePostScreen> {
  final firestoreRef = FirebaseFirestore.instance.collection('user');

  final postController = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Firestore Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              maxLines: 4,
              controller: postController,
              decoration: const InputDecoration(
                hintText: "What's on your mind?",
                border: OutlineInputBorder()
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            RoundButton(
              title: 'Add',
              loading: loading,
              onTap: (){
                setState(() {
                  loading = true;
                });
                String id = DateTime.now().millisecondsSinceEpoch.toString();

                firestoreRef.doc(id).set({
                  'title' : postController.text.toString(),
                  'id' : id,
                }).then((value) {
                  Utils().toastMessage('Post added!');
                  setState(() {
                    loading = false;
                  });
                }).onError((error, stackTrace) {
                  Utils().toastMessage(error.toString());
                  setState(() {
                    loading =false;
                  });
                });
              }
            ),
          ],
        ),
      ),
    );
  }

}
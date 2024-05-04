import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../utils/utils.dart';
import '../auth/login_screen.dart';
import 'student_details_screen.dart';

class FirestoreScreen extends StatefulWidget {
  const FirestoreScreen({super.key});

  @override
  State<FirestoreScreen> createState() => _FirestoreScreenState();
}

class _FirestoreScreenState extends State<FirestoreScreen> {

  final auth = FirebaseAuth.instance;
  final firestoreRef = FirebaseFirestore.instance.collection('Students').snapshots();
  CollectionReference ref = FirebaseFirestore.instance.collection('Students');

  final searchFilterController = TextEditingController();
  final editController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text('Firestore List'),
        actions: [
          IconButton(
            onPressed: () {
              auth.signOut()
              .then((value) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen()));
              }).onError((error, stackTrace) {
                Utils().toastMessage(error.toString());
              });
            },
            icon: const Icon(Icons.logout_outlined)
          ),
          const SizedBox(width: 10,)
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: TextFormField(
              controller: searchFilterController,
              decoration: const InputDecoration(
                hintText: 'Search',
                border: OutlineInputBorder()
              ),
              onChanged: (value) {
                setState(() {
                  
                });
              },
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          StreamBuilder<QuerySnapshot>(
            stream: firestoreRef,
            builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
          
              if (snapshot.hasError) {
                return const Text('Error Occured');
              }
              return Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index){
                    
                    final name = snapshot.data!.docs[index]['name'].toString();
                    final id = snapshot.data!.docs[index]['id'].toString();
                    // final std_class = snapshot.data!.docs[index]['class'].toString();
                    // final dob = snapshot.data!.docs[index]['dob'].toString();
                    
                    if (searchFilterController.text.isEmpty) {
                      return ListTile(
                      title: Text(name),
                      subtitle: Text(id),
                      onTap: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => StudentDetailScreen(id)));
                      },
                    );
                    } else if (name.toString().toLowerCase().contains(searchFilterController.text.toLowerCase())) {
                      return ListTile(
                      title: Text(name),
                      subtitle: Text(id),
                    );
                    } else {
                      return Container();
                    }
                  }
                )
              );
          })
        ],
      ),
    );
  }

  Future<void> showUpdateDialog(String title, String id)async {
    editController.text = title;
    
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Update'),
          content: TextField(
            controller: editController,
          ),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: const Text('Cancel')
            ),
            TextButton(
              onPressed: (){
                Navigator.pop(context);
                ref.doc(id).update({
                  'title' : editController.text
                }).then((value) {
                  Utils().toastMessage('Post edited!');
                }).onError((error, stackTrace) {
                  Utils().toastMessage(error.toString());
                });
              },
              child: const Text('Update')
            ),
          ],
        );
      }
    );
  }

  Future<void> showDeleteDialog(String title, String id)async {
    editController.text = title;
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Deletion'),
          content: const Text('You are about to delete a post!'),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: const Text('Cancel')
            ),
            TextButton(
              onPressed: (){
                Navigator.pop(context);
                ref.doc(id).delete()
                .then((value) {
                  Utils().toastMessage('Post deleted!');
                }).onError((error, stackTrace) {
                  Utils().toastMessage(error.toString());
                });
              },
              child: const Text('Confirm')
            ),
          ],
        );
      }
    );
  }
  
}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import 'package:cld_frstr/Tuts/UI/auth/login_screen.dart';
import 'package:cld_frstr/Tuts/UI/posts/add_posts.dart';
import 'package:cld_frstr/Tuts/utils/utils.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  final auth = FirebaseAuth.instance;
  final dbRef = FirebaseDatabase.instance.ref('Post');

  final searchFilterController = TextEditingController();
  final editController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Post Screen'),
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
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: TextFormField(
              controller: searchFilterController,
              decoration: const InputDecoration(
                hintText: 'Search',
                border: OutlineInputBorder()
              ),
              onChanged: ((value) {
                setState(() {
                  
                });
              }),
            ),
          ),
          Expanded(
            child: FirebaseAnimatedList(
              query: dbRef,
              defaultChild: const Text('Loading'),
              itemBuilder: (context, dataSnapshot, animation, index){
                
                final title = dataSnapshot.child('title').value.toString();
                final id  = dataSnapshot.child('id').value.toString();

                if (searchFilterController.text.isEmpty) {
                  return ListTile(
                    title: Text(title),
                    subtitle: Text(id),
                    trailing: PopupMenuButton<int>(
                      icon: const Icon(Icons.more_vert),
                      itemBuilder: (context) {
                        return <PopupMenuEntry<int>>[
                          PopupMenuItem<int>(
                            value: 1,
                            child: ListTile(
                              onTap: () {
                                Navigator.pop(context);
                                showUpdateDialog(title, id);
                              },
                              leading: const Icon(Icons.edit),
                              title: const Text('Edit'),
                            ),
                          ),
                          PopupMenuItem<int>(
                            value: 1,
                            child: ListTile(
                              leading: const Icon(Icons.delete),
                              title: const Text('Delete'),
                              onTap: (){
                                Navigator.pop(context);
                                showDeleteDialog(title, id);
                              },
                            ),
                          ),
                        ];
                      },
                    ),
                  );
                } else if(title.toString().toLowerCase().contains(searchFilterController.text.toLowerCase())){
                  return ListTile(
                    title: Text(title),
                    subtitle: Text(id),
                    trailing: PopupMenuButton<int>(
                      icon: const Icon(Icons.more_vert),
                      itemBuilder: (context) {
                        return <PopupMenuEntry<int>>[
                          PopupMenuItem<int>(
                            value: 1,
                            child: ListTile(
                              onTap: () {
                                Navigator.pop(context);
                                showUpdateDialog(title, id);
                              },
                              leading: const Icon(Icons.edit),
                              title: const Text('Edit'),
                            ),
                          ),
                          PopupMenuItem<int>(
                            value: 1,
                            child: ListTile(
                              leading: const Icon(Icons.delete),
                              title: const Text('Delete'),
                              onTap: (){
                                Navigator.pop(context);
                                showDeleteDialog(title, id);
                              },
                            ),
                          ),
                        ];
                      },
                    ),
                  );
                } else {
                  return Container();
                }
              }
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddPostScreen()));
        },
        child: const Icon(Icons.add),
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
                dbRef.child(id).update({
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
                dbRef.child(id).remove()
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

          // Expanded(
          //   child: StreamBuilder(
          //     stream: ref.onValue,
          //     builder: (context, AsyncSnapshot<DatabaseEvent> snapshot){
                

          //       if (!snapshot.hasData) {
          //         return const CircularProgressIndicator();
          //       }else{
          //         Map<dynamic, dynamic> map = snapshot.data!.snapshot.value as dynamic;
          //         List<dynamic> list  = [];
          //         list.clear();
          //         list = map.values.toList();
          //         return ListView.builder(
          //           itemCount: snapshot.data!.snapshot.children.length,
          //           itemBuilder: (context, index) {
          //             return ListTile(
          //               title: Text(list[index]['title']),
          //               subtitle: Text(list[index]['id']),
          //             );
          //           },
          //         );
          //       }
          //     },
          //   )
          // ),
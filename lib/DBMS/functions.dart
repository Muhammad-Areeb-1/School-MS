//   final firestoreInstance = FirebaseFirestore.instance;

//   _onPressed() {
//     firestoreInstance.collection("users").add(
//     {
//       "name" : "john",
//       "age" : "25",
//       "email" : "abc@example.com",
//       "address" : {
//         "street" : "street 24",
//         "city" : "new york",
//       }
//     }).then((value) {
//       print(value.id);
//     });
//   }

//   void _onPressedAuth() {
//     var firebaseUser = FirebaseAuth.instance.currentUser;
//     firestoreInstance.collection("users").doc(firebaseUser?.uid).set(
//       {
//         "username" : "userX",
//       },SetOptions(merge: true)).then((_) {
//         print("Auth Success!");
//       });
//   }

//   void _onPressedUpdateField() {
//     var firebaseUser = FirebaseAuth.instance.currentUser;
//     firestoreInstance.collection("users")
//         .doc(firebaseUser?.uid)
//         .update({
//           "age": 60, 
//           "familyname": "anderson"
//         }).then((_) {
//           print("Update Success!");
//         });
//   }

//   void _onPressedUpdateMap() {
//     var firebaseUser = FirebaseAuth.instance.currentUser;
//     firestoreInstance.collection("users")
//         .doc(firebaseUser?.uid)
//         .update({
//           "address.street": "street 50"
//           ,"address.country": "USA"
//         }).then((_) {
//           print("Add Success!");
//         });
//   }

//   void _onPressedArray() {
//     var firebaseUser = FirebaseAuth.instance.currentUser;
//     firestoreInstance.collection("users")
//         .doc(firebaseUser?.uid).update({
//           "characteristics": FieldValue.arrayUnion(["generous", "loving", "loyal"])
//         }).then((value) {
//           print("Array Added Successfully!");
//         });
//   }

//   void _onPressedSubcollection() {
//     var firebaseUser = FirebaseAuth.instance.currentUser;
//     firestoreInstance.collection("users")
//       .doc(firebaseUser?.uid)
//       .collection("pets")
//       .add({
//         "petName": "blacky",
//         "petType": "dog",
//         "petAge": 1
//       });
//   }

//   void _onPressedDeleteDoc() {
//     var firebaseUser = FirebaseAuth.instance.currentUser;
//     firestoreInstance.collection("users")
//       .doc(firebaseUser?.uid).delete()
//       .then((value) {
//         print("Deleted Succesfully!");
//     });
//   }

//   void _onPressedDeleteField() {
//     var firebaseUser = FirebaseAuth.instance.currentUser;
//     firestoreInstance.collection("users")
//       .doc(firebaseUser?.uid).update({
//         "username": FieldValue.delete()
//       })
//       .then((value) {
//         print("Deleted Succesfully!");
//     });
//   }

//   void _onPressedGetAll() {
//   firestoreInstance.collection("users").get().then((QuerySnapshot) {
//       QuerySnapshot.docs.forEach((result) {
//         print(result.data());
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Rgister Pet",
//           style: TextStyle(
//             color: Colors.white
//           ),
//           ),
//         backgroundColor: const Color.fromARGB(255, 53, 77, 214),
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               const Text(
//                 'Try the Firestore',
//                 style: TextStyle(
//                     fontWeight: FontWeight.w200,
//                     fontSize: 30,
//                     fontFamily: 'Roboto',
//                     fontStyle: FontStyle.italic),
//               ),
//               ElevatedButton(
//                 onPressed: _onPressed,
//                 child: const Text("Add Users")
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

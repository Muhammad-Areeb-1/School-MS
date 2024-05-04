// // import 'package:flutter/material.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';

// class Student {
//   final String displayName;
//   final String id;
//   final String rollNo;
//   final String mobileNo;
//   final List<String> enrolledCourses;

//   // Map<String, dynamic> connection;
//   var connection; 

//   Student({ 
//     required this.displayName,
//     required this.id,
//     required this.rollNo,
//     required this.mobileNo,
//     this.enrolledCourses = const [],
//   });
// }

// // class Students extends StatefulWidget {
// //   const Students({super.key});

// //   @override
// //   State<Students> createState() => _StudentsState();
// // }


// // class _StudentsState extends State<Students> {

// //   @override
// //   Widget build(BuildContext context) {
// //     return  Scaffold(
// //       body: SingleChildScrollView(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             const Padding(
// //               padding: EdgeInsets.all(18.0),
// //               child: Text('Student Section'),
// //             ),
// //             const Padding(
// //               padding: EdgeInsets.all(8.0),
// //               child: ElevatedButton(
// //                 onPressed: null,
// //                 child: Text('Show Record')
// //               ),
// //             ),
// //             Padding(
// //               padding: const EdgeInsets.all(8.0),
// //               child: ElevatedButton(
// //                 onPressed: () {
// //                   const AddStudent();
// //                 },
// //                 child: const Text('Add Student')
// //               ),
// //             ),
// //             const Padding(
// //               padding: EdgeInsets.all(8.0),
// //               child: ElevatedButton(
// //                 onPressed: null,
// //                 child: Text('Update Student')
// //               ),
// //             ),
// //             const Padding(
// //               padding: EdgeInsets.all(8.0),
// //               child: ElevatedButton(
// //                 onPressed: null,
// //                 child: Text('Delete Student')
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// // }

// // class AddStudent extends StatefulWidget {
// //   const AddStudent({super.key});

// //   @override
// //   State<AddStudent> createState() => AddStudentState();
// // }

// // class AddStudentState extends State<AddStudent> {
// //   final _formKey = GlobalKey<FormState>();

// //   final nameController = TextEditingController();
// //   final ageController = TextEditingController();
// //   final idController = TextEditingController();

// //   final studentsCollection = FirebaseFirestore.instance.collection('students');
  
// //   Future<void> addStudent(String name, int age, String studentId) async {
// //     await studentsCollection.add({
// //       'name': name,
// //       'age': age,
// //       'studentId': studentId,
// //     });
// //   }
  
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Enter Details'),
// //       ),
// //       body: Form(
// //         key: _formKey,
// //         child: Column(
// //           children: <Widget>[
// //             TextFormField(
// //               controller: nameController,
// //               decoration: const InputDecoration(
// //                 border: OutlineInputBorder(),
// //                 labelText: 'Enter student name'
// //               ),
// //               validator: (value) {
// //                 if (value == null || value.isEmpty) {
// //                   return 'Please enter some text';
// //                 }
// //                 return null;
// //               },
// //             ),
// //             TextFormField(
// //               keyboardType: TextInputType.number,
// //             controller: ageController,
// //               decoration: const InputDecoration(
// //                 border: OutlineInputBorder(),
// //                 labelText: 'Enter student age'
// //               ),
// //               validator: (value) {
// //                 if (value == null || value.isEmpty) {
// //                   return 'Please enter some text';
// //                 }
// //                 return null;
// //               }
// //             ),
// //             TextFormField(
// //               controller: idController,
// //               decoration: const InputDecoration(
// //                 border: OutlineInputBorder(),
// //                 labelText: 'Enter student ID'
// //               ),
// //               validator: (value) {
// //                 if (value == null || value.isEmpty) {
// //                   return 'Please enter some text';
// //                 }
// //                 return null;
// //               }
// //             ),
// //             ElevatedButton(
// //               onPressed: () {
// //                 if (_formKey.currentState!.validate()) {
// //                   addStudent(
// //                     nameController.text,
// //                     int.tryParse(ageController.text) ?? 0,
// //                     idController.text
// //                   ).then((_) {
// //                     ScaffoldMessenger.of(context).showSnackBar(
// //                       const SnackBar(content: Text('Student Added!'))
// //                     );
// //                     nameController.clear();
// //                     ageController.clear();
// //                     idController.clear();
// //                   }).catchError((onError) {
// //                     ScaffoldMessenger.of(context).showSnackBar(
// //                       SnackBar(content: Text(onError))
// //                     );
// //                   });
// //                 }
// //               },
// //               child: const Text('Submit')
// //             ),
// //             ElevatedButton(
// //               onPressed: () {},
// //               child: const Text('Show Students')
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   @override
// //   void dispose() {
// //     nameController.dispose();
// //     ageController.dispose();
// //     idController.dispose();
// //     super.dispose();
// //   }
// // }
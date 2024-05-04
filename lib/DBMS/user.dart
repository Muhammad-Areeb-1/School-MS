// // import 'dart:collection';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class User {
//   late String displayName;
//   late String id;
//   late String standard;
//   late String enrollNo;
//   late String mobileNo;
//   late String email;
//   late String firebaseUid;

//   // Map<String, dynamic> connection;
//   var connection; 

//   User({
//     this.displayName = '',
//     this.id = '',
//     this.standard = '',
//     this.enrollNo = '',
//     this.mobileNo = '',
//     this.email = '',
//     this.firebaseUid = '',
//   });

//   bool isEmpty() {
//     if (standard =='') return true; 

//     return false;
//   }

//   User.fromSnapshot(DocumentSnapshot documentSnapshot) {
//     _fromJson(documentSnapshot.data() as Map<String, dynamic>);
//   }

//   _fromJson(Map<String, dynamic> json) {
//     displayName = json['displayName'] ?? '';
//     id = json['id'] ?? '';
//     standard = json['standard'] ?? '';
//     enrollNo = json['enrollNo'] ?? '';
//     mobileNo = json['mobileNo'] ?? '';
//     email = json['email'] ?? '';
//     firebaseUid = json['firebaseUid'] ?? '';
//     connection = json['connection'] ?? {};
//   }

//   User.fromJson(Map<String, dynamic> json) {
//     _fromJson(json);
//   }
  
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['displayName'] = displayName;
//     data['id'] = id;
//     data['standard'] = standard;
//     data['enrollNo'] = enrollNo;
//     data['mobileNo'] = mobileNo;
//     data['email'] = email;
//     data['firebaseUid'] = firebaseUid;
//     data['connection'] = connection;
//     return data;
//   }
// }
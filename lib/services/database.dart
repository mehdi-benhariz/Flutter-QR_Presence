import 'package:QR_Presence/models/presences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference presenceCollection = FirebaseFirestore.instance.collection('presences');

  Future<void> updateUserData( String worker) async {
    return await presenceCollection.add({
      'worker': worker,
      'date': DateFormat('yyyy-MM-dd').format(DateTime.now())   ,
    });
  }
// brew list from snapshot
  List<Presence> _presenceListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc){
      //print(doc.data);
      return Presence(
        worker: doc.data()['worker'] ?? '',
        date: doc.data()['date'] ?? ''
      );
    }).toList();
  }
  Stream<List<Presence>> get presences {
    return presenceCollection.snapshots()
      .map(_presenceListFromSnapshot);
  }

}

// class DatabaseService {
//   final String uid;
//   DatabaseService({this.uid});

//   final CollectionReference presencesCollection =
//       FirebaseFirestore.instance.collection('presences');

//   Future<void> updateUserData(DateTime date, String name) async {
//     return await presencesCollection.doc(uid).set({
//       'date': date,
//       'name': name,
//     });
//   }

//   Future _presenceListFromSnapshot(QuerySnapshot snapshot)async {

//  await presencesCollection.get().then((querySnapshot) async {
//     return snapshot.docs.map((doc){
//       return Presence(
//         date: doc.data()['date'] ,
//         worker: doc.data()['worker'],  );
//     }).toList();

//   });
//   }

//   //get presences stream

//   //get user stream
//     Stream<DocumentSnapshot> get userData {
//     return presencesCollection.doc(uid).snapshots();
//   }
// }

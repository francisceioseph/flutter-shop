import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_shop/models/personal_information.dart';
import 'package:rxdart/rxdart.dart';

class PersonalInformationRepository {
  Stream<PersonalInformation> loadPersonalInformation() {
    return _user
        .switchMap(
          (FirebaseUser user) =>
              _personalInformations.document(user.uid).snapshots(),
        )
        .switchMap(_ensurePersonalInformationExistence)
        .map(
      (DocumentSnapshot snapshot) {
        return PersonalInformation.fromSnapshot(snapshot);
      },
    );
  }

  savePersonalInformation(PersonalInformation personalInformation) {
    _user
        .switchMap(
          (FirebaseUser user) => _personalInformations
              .document(user.uid)
              .updateData(personalInformation.toMap())
              .asStream(),
        )
        .take(1)
        .listen(print);
  }

  Stream<DocumentSnapshot> _ensurePersonalInformationExistence(
    DocumentSnapshot snapshot,
  ) {
    if (snapshot.exists) {
      return Stream.value(snapshot);
    }

    return _personalInformations
        .document(snapshot.documentID)
        .setData({})
        .asStream()
        .switchMap<DocumentSnapshot>(
          (_) =>
              _personalInformations.document(snapshot.documentID).snapshots(),
        );
  }

  Stream<FirebaseUser> get _user =>
      FirebaseAuth.instance.currentUser().asStream();

  CollectionReference get _personalInformations =>
      Firestore.instance.collection('personal_informations');
}

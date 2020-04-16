import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_shop/models/shipping.dart';
import 'package:rxdart/rxdart.dart';

class ShippingRepository {
  Stream<Shipping> get shippingInformation {
    return _user
        .switchMap(
          (FirebaseUser user) => Firestore.instance
              .collection('shippings')
              .document(user.uid)
              .snapshots(),
        )
        .switchMap(_ensureShippingExistence)
        .map(
      (DocumentSnapshot snapshot) {
        return Shipping.fromSnapshot(snapshot);
      },
    );
  }

  void saveShippingInformation(Shipping shipping) {
    _user
        .switchMap(
          (FirebaseUser user) => _shippings
              .document(user.uid)
              .updateData(shipping.toMap())
              .asStream(),
        )
        .take(1)
        .listen((_) {});
  }

  Stream<DocumentSnapshot> _ensureShippingExistence(DocumentSnapshot snapshot) {
    if (snapshot.exists) {
      return Stream.value(snapshot);
    }

    return _shippings
        .document(snapshot.documentID)
        .setData({})
        .asStream()
        .switchMap<DocumentSnapshot>(
          (_) => _shippings.document(snapshot.documentID).snapshots(),
        );
  }

  Stream<FirebaseUser> get _user =>
      FirebaseAuth.instance.currentUser().asStream();

  CollectionReference get _shippings =>
      Firestore.instance.collection('shippings');
}

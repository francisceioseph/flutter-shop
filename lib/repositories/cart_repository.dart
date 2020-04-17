import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_shop/models/cart_item.dart';
import 'package:flutter_shop/models/product.dart';

class CartRepository {
  Stream<Map<String, CartItem>> getUserCart() {
    final userStream = FirebaseAuth.instance.currentUser().asStream();

    return userStream
        .switchMap(
          (FirebaseUser user) {
            return _cartsCollection.document(user.uid).snapshots();
          },
        )
        .switchMap(_ensureCartExistence)
        .switchMap(_mapToCartItems)
        .map(_mapToCart);
  }

  void addItemToCart(String productId) {
    final userStream = FirebaseAuth.instance.currentUser().asStream();

    userStream.switchMap((user) {
      return _cartsCollection.document(user.uid).snapshots().take(1);
    }).switchMap((cartDoc) {
      final cartData = cartDoc.data;
      final productExists = cartData[productId] != null;

      if (!productExists) {
        return _cartsCollection.document(cartDoc.documentID).updateData({
          '$productId': {'amount': 1}
        }).asStream();
      }

      return _cartsCollection.document(cartDoc.documentID).updateData({
        '$productId': {'amount': cartData[productId]['amount'] + 1}
      }).asStream();
    }).listen((_) {});
  }

  void cleanCart() {
    final userStream = FirebaseAuth.instance.currentUser().asStream();

    userStream.switchMap((FirebaseUser user) {
      return _cartsCollection.document(user.uid).setData({}).asStream();
    }).listen((_) {});
  }

  CollectionReference get _cartsCollection =>
      Firestore.instance.collection('carts');

  Stream<DocumentSnapshot> _ensureCartExistence(DocumentSnapshot cartSnapshot) {
    if (cartSnapshot.exists) {
      return Stream.value(cartSnapshot);
    }

    return _cartsCollection
        .document(cartSnapshot.documentID)
        .setData({})
        .asStream()
        .switchMap<DocumentSnapshot>(
          (_) {
            return _cartsCollection
                .document(cartSnapshot.documentID)
                .snapshots();
          },
        );
  }

  Stream<List<CartItem>> _mapToCartItems(DocumentSnapshot doc) {
    final data = doc.data;

    if (data.isEmpty) {
      return Stream.value([]);
    }

    final streams = data.keys.map(
      (String key) {
        return Firestore.instance
            .collection('products')
            .document(key)
            .snapshots()
            .map(
          (product) {
            return CartItem(
              product: Product.fromSnapshot(product),
              amount: data[key]['amount'],
            );
          },
        );
      },
    );

    return Rx.combineLatestList(streams);
  }

  Map<String, CartItem> _mapToCart(List<CartItem> cartItems) {
    if (cartItems.isEmpty) {
      return {};
    }

    return cartItems.fold({}, (acc, cartItem) {
      return {...acc, '${cartItem.product.id}': cartItem};
    });
  }
}

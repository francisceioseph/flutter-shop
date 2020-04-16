import 'package:flutter_shop/models/shipping.dart';
import 'package:flutter_shop/services/singleton.dart';
import 'package:rxdart/rxdart.dart';

class ShippingState {
  BehaviorSubject<Shipping> _shipping = BehaviorSubject.seeded(Shipping());
  Stream<Shipping> get shipping => _shipping.stream;

  void loadShippingData() {
    Singleton.shippingRepository.shippingInformation.listen(_shipping.add);
  }

  void saveShipping(Shipping shipping) {
    Singleton.shippingRepository.saveShippingInformation(shipping);
  }

  dispose() {
    _shipping.close();
  }
}

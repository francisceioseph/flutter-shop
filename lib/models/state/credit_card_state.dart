import 'package:flutter_shop/models/credit_card.dart';
import 'package:flutter_shop/services/singleton.dart';
import 'package:rxdart/rxdart.dart';

class CreditCardState {
  BehaviorSubject<CreditCard> _creditCard =
      BehaviorSubject.seeded(CreditCard());
  Stream<CreditCard> get creditCard => _creditCard.stream;

  void loadCreditCardData() {
    Singleton.creditCardRepository.loadCreditCard().listen(_creditCard.add);
  }

  void saveCreditCard(CreditCard creditCard) {
    Singleton.creditCardRepository.saveCreditCard(creditCard);
  }

  dispose() {
    _creditCard.close();
  }
}

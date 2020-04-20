import 'package:flutter_shop/models/personal_information.dart';
import 'package:flutter_shop/services/singleton.dart';
import 'package:rxdart/rxdart.dart';

class PersonalInfoState {
  BehaviorSubject<PersonalInformation> _personalInfo =
      BehaviorSubject.seeded(PersonalInformation());

  Stream<PersonalInformation> get personalInfo => _personalInfo.stream;

  loadPersonalInfo() {
    Singleton.personalInformationRepository
        .loadPersonalInformation()
        .listen(_personalInfo.add);
  }

  setPersonalInfo(PersonalInformation info) {
    Singleton.personalInformationRepository.savePersonalInformation(info);
  }

  dispose() {
    _personalInfo.close();
  }
}

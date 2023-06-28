import 'package:flutter_appexp/login/domain/auth_model.dart';
import 'package:flutter_appexp/login/domain/user_model.dart';
import 'package:faker/faker.dart' as ffaker;
import 'package:flutter_appexp/login/domain/user_token_model.dart';

class FakeUser {
  ffaker.Faker faker = ffaker.Faker();

  late final UserModel userModel;
  late final AuthModel authModel;

  UserTokenModel? userTokenModel;

  FakeUser() {
    userModel = UserModel(
      accountType: "member",
      accountStatus: 1,
      name: faker.person.firstName(),
      lastName: faker.person.lastName(),
      fullName: faker.person.name(),
      gender: "M",
      birthDate: "30/09/1996",
      emailAddress: faker.internet.email(),
      storedPassword: faker.internet.password(length: 6),
      profilePhoto: "http",
      bannerProfilePhoto: "http",
      contact: Contact(areaCode: "81", phoneNumber: "95559444"),
      address: Address(
        zipCode: "9841989",
        addressLine: "Rua do Futuro",
        neighborhood: "Bairro do Presente",
        addressComplement: "-",
        city: "Camaragibe",
        state: "PE",
        number: "0",
      ),
      deviceId: "d6a584s6d5a",
      premium: false,
    );

    authModel = AuthModel(
      emailAddress: userModel.emailAddress,
      storedPassword: userModel.storedPassword!,
    );
  }
}

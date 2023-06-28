// import 'package:flutter_appexp/user_auth/domain/user_model.dart';
// import 'package:flutter_appexp/user_auth/domain/user_token_model.dart';
// import 'package:flutter_appexp/user_auth/services/auth_service.dart';
// import 'package:flutter_appexp/webclient/webclient.dart';
// import 'package:flutter_test/flutter_test.dart';

// import 'helpers/fake_user.dart';

// void main() {
//   //TODO: Garantir independencia dos testes unitário
//   FakeUser fakeUser = FakeUser();
//   WebClient webClient = WebClient();

//   test("Serviço de Autenticação deve CRIAR NOVO USUÁRIO", () async {
//     AuthService authService = AuthService(webClient: webClient);
//     bool response = await authService.createUser(
//       model: fakeUser.userModel,
//     );
//     expect(response, true);
//   });

//   test("Serviço de Autenticação deve AUTENTICAR USUÁRIO EXISTENTE", () async {
//     AuthService authService = AuthService(webClient: webClient);
//     UserTokenModel userTokenModel =
//         await authService.authenticateUser(model: fakeUser.authModel);
//     expect(userTokenModel.authentication, true);

//     fakeUser.userTokenModel = userTokenModel;
//   });

//   test(
//       "Serviço de Autenticação deve CONFIGURAR INTERCEPTADOR PARA ADICIONAR TOKEN NAS REQUISIÇÕES",
//       () {
//     AuthService authService = AuthService(webClient: webClient);
//     bool result =
//         authService.webClient.addTokenToHeader(fakeUser.userTokenModel!.token);
//     expect(result, true);
//   });

//   test(
//       "Serviço de Autenticação deve OBTER INFORMAÇÕES DO USUÁRIOS (Autorizada)",
//       () async {
//     AuthService authService = AuthService(webClient: webClient);
//     UserModel userModel =
//         await authService.getUserDetails(userId: fakeUser.userTokenModel!.id);
//     expect(
//       userModel.id,
//       fakeUser.userTokenModel!.id,
//     );
//   });
// }

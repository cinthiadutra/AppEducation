import 'response_error_model.dart';

/// O servidor recupera diversas informações que sobre um erro, os quais formam
/// um [ ResponseErrorModel ] e essa função recupera apenas a String dessa informação.
///
/// Caso não queira usar a mensagem vinda da API, customize-a passando o [customMessage]
String getErrorMessage({
  required Map<String, dynamic> mapOfResponseErro,
  String? customMessage,
}) {
  ResponseErrorModel responseErro =
      ResponseErrorModel.fromMap(mapOfResponseErro);
  if (customMessage != null) {
    responseErro = responseErro.copyWith(message: customMessage);
  }
  String validations = '';

  for (var text in responseErro.validations) {
    validations = '$validations\n• $text';
  }

  String finalText = (responseErro.message) + validations;

  return finalText;
}

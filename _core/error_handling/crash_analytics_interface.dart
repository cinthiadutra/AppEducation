import 'package:flutter_appexp/_core/error_handling/target_exception_models.dart';


abstract class ICrashAnalyticsInterface {
  /// Função responsável por registrar os erros ocorridos no aplicativo.
  /// Recebe o erro em sí que ocorreu no [ erro ], assim como a descrição do
  /// mesmo no [ description ] seguido do conteúdo que ele estava trafegando
  /// quando o erro ocorreu. O rasto do erro do erro [ stackTrace ] e o tipo
  /// [ errorType ] também precisam ser passados. Para passar outras informações
  /// úteis, passe em uma lista [ otherDetailOfError ] a classe [ DetailOfError ]
  /// para mais informações potencialmente relevantes.
  Future<void> sendCrashLogToDatabase({
    required String? erro,
    required String? description,
    required String? data,
    required List<DetailOfError> otherDetailOfError,
    required String? errorType,
    required StackTrace? stackTrace,
  });
}
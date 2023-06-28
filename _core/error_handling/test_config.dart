import 'dart:io';

/// Configurações gerais para o teste unitários,
/// de integração, widgets, etc.
class TestConfig {
  /// Se essa variável de ambiente for `true`, o programa
  /// está rodando um teste e não em emulador/device
  static final bool kEstaRodandoOTeste =
      Platform.environment.containsKey('FLUTTER_TEST');

  /// Retorna `true` se o programa esta rodando no modo de teste
  static bool isTestMode() => TestConfig.kEstaRodandoOTeste == true;

  /// Retorna `true` se o programa NÃO esta rodando no modo de teste
  /// Isto é, se tiver rodando em um emulador/device, retorna false.
  static bool isNotTestMode() => TestConfig.kEstaRodandoOTeste == false;
}
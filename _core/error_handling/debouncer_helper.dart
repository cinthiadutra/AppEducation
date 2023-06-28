import 'dart:async';

class DebouncerHelper {
  /// O que vai ser executado quando o debounce acabar
  final int millisecondsDebounceTime;
  DebouncerHelper({this.millisecondsDebounceTime = 450});

  // Timer para fazer o debounce
  Timer? _debounce;

  void resetarDebounce(FutureOr<void> Function() action) {
    // Vamos acabar com o debounce caso tenha para começar outro
    // cronometro, assim a cada caracter digitado resetamos o timer
    _debounce?.cancel();
    _debounce = null;

    // Vamos colocar o novo timer com um debounce para fazer a pesquisa
    _debounce =
        Timer(Duration(milliseconds: millisecondsDebounceTime), () async {
      await action();
    });
  }
}

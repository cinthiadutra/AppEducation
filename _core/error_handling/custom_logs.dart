import 'dart:developer';
import 'package:flutter/foundation.dart';

void logInRed(Object? object, {Object? error, StackTrace? stackTrace}) {
  if (object == null || kReleaseMode) return;

  return log(
    '\x1B[31m${(object.toString()).trim()}\x1B[0m',
    error: error,
    stackTrace: stackTrace,
  );
}

void logInGreen(Object? object, {Object? error, StackTrace? stackTrace}) {
  if (object == null || kReleaseMode) return;
  return log(
    '\x1B[32m${(object.toString()).trim()}\x1B[0m',
    error: error,
    stackTrace: stackTrace,
  );
}

void logInYellow(Object? object, {Object? error, StackTrace? stackTrace}) {
  if (object == null || kReleaseMode) return;
  return log(
    '\x1B[33m${(object.toString()).trim()}\x1B[0m',
    error: error,
    stackTrace: stackTrace,
  );
}

void logInBlue(Object? object, {Object? error, StackTrace? stackTrace}) {
  if (object == null || kReleaseMode) return;
  return log(
    '\x1B[34m${(object.toString()).trim()}\x1B[0m',
    error: error,
    stackTrace: stackTrace,
  );
}

void logInMagenta(Object? object, {Object? error, StackTrace? stackTrace}) {
  return log(
    '\x1B[35m${(object.toString()).trim()}\x1B[0m',
    error: error,
    stackTrace: stackTrace,
  );
}

void logInCyan(Object? object, {Object? error, StackTrace? stackTrace}) {
  if (object == null || kReleaseMode) return;
  return log(
    '\x1B[36m${(object.toString()).trim()}\x1B[0m',
    error: error,
    stackTrace: stackTrace,
  );
}

void logInWhite(Object? object, {Object? error, StackTrace? stackTrace}) {
  if (object == null || kReleaseMode) return;
  return log(
    '\x1B[37m${(object.toString()).trim()}\x1B[0m',
    error: error,
    stackTrace: stackTrace,
  );
}

// Black:   \x1B[30m
// Red:     \x1B[31m
// Green:   \x1B[32m
// Yellow:  \x1B[33m
// Blue:    \x1B[34m
// Magenta: \x1B[35m
// Cyan:    \x1B[36m
// White:   \x1B[37m
// Reset:   \x1B[0m


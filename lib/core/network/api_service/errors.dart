import 'dart:async';
import 'dart:io';

Map<Type, String> errorMessages = {
  SocketException:
      'Oops! Something went wrong. Please check your internet connection and try again.',
  TimeoutException: 'Sorry, the request timed out. Please try again later.',
  HttpException:
      'Sorry, there was an issue with the request. Please try again later.',
  FormatException:
      "Sorry, there was an issue processing the server's response. Please try again later.",
};

String handleError(dynamic e) {
  // Check if the error type exists in the errorMessages dictionary
  if (errorMessages.containsKey(e.runtimeType)) {
    return errorMessages[e.runtimeType]!;
  } else {
    // If the error type is not found, return a generic error message
    return 'Oops! Something unexpected happened. Please try again later.';
  }
}

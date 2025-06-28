// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Custom action
// This is for managing if users are in web or mobile, otherwise apk can't be built
import 'package:flutter/foundation.dart' show kIsWeb;

Future<String> getEpaycoRef() async {
  // Add your function code here!

  if (kIsWeb) {
    Uri uri = Uri.base; // This gets the current url, my hero

    Map<String, String> queryParams = uri.queryParameters; // Get query params
    String epaycoRef =
        queryParams['invitee_uuid'] ?? ''; // Get the specific one.

    return epaycoRef; // There it is.
  } else {
    return '-'; // Whatever
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!

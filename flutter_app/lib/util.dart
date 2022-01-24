import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

printJson(Map<String, dynamic> data) {
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
  String prettyprint = encoder.convert(data);
  print(prettyprint);
}

String getTime(int unixEpoch) {
  return DateFormat.MMMEd()
      .format(DateTime.fromMillisecondsSinceEpoch(unixEpoch * 1000));
}

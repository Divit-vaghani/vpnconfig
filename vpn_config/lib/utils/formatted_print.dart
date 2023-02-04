import 'dart:convert';

String formattedString(Map<String, dynamic> data) =>
    JsonEncoder.withIndent(" " * 4).convert(data);

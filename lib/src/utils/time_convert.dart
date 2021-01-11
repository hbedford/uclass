import 'package:flutter/material.dart';

class TimeConvert {
  TimeConvert();
  hAndMString(TimeOfDay t) =>
      t.hour.toString().padLeft(2, '0') +
      ':' +
      t.minute.toString().padLeft(2, '0');
}

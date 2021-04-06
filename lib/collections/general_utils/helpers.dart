import 'package:flutter/material.dart';

import 'extension_file.dart';

class Helper {
  static commonText({title = '', size = 16.0, color = ""}) {
    return Text(title,
        style: TextStyle(
            color: color != "" ? HexColor.fromHex(color) : null,
            fontSize: size));
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/foundation.dart' as platform;

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: platform.kIsWeb ? 60 : 20),
        child: Text('Uclass',
            style: GoogleFonts.ubuntu(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w700)));
  }
}

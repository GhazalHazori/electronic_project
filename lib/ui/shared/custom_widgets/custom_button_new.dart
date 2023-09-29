//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/shared/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButtonNew extends StatelessWidget {
  final Color? textcolor;
  final String text;
  final double? textsize;
  final FontWeight? textfontwieght;
  final Color? bordercolor;
  final Color? backgroundcolor;
  final VoidCallback onpressed;
  final String? svgname;

  //final String? svgname;
  const CustomButtonNew({
    super.key,
    this.textcolor,
    required this.text,
    this.textsize,
    this.textfontwieght,
    this.backgroundcolor,
    required this.onpressed,
    this.svgname,
    this.bordercolor,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: () {
        onpressed();
      },
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        if (svgname != null) ...[
          SvgPicture.asset(
            'assets/images/$svgname',
            width: size.width * 0.04,
            height: size.height * 0.04,
          ),
          SizedBox(
            width: size.width * 0.2,
          )
        ],
        Center(
          child: Text(
            text,
            style: TextStyle(
                color: textcolor ?? AppColors.whitecolor,
                fontSize: textsize ?? size.width * 0.55,
                fontWeight: textfontwieght ?? FontWeight.normal),
          ),
        ),
      ])
      // Text(
      //   text,
      //   style: TextStyle(
      //       color: textcolor ?? AppColors.whitecolor,
      //       fontSize: textsize ?? size.width * 0.55,
      //       fontWeight: textfontwieght ?? FontWeight.normal),
      // )
      ,
      style: ElevatedButton.styleFrom(
        side: bordercolor != null
            ? BorderSide(width: 1, color: bordercolor!) //appcolors.whitcolor
            : null,
        backgroundColor: backgroundcolor,
        fixedSize: Size(size.width * 0.9, size.height * 0.06),
        shape: StadiumBorder(),
      ),
    );
  }
}

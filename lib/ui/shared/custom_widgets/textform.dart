import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/shared/colors.dart';

class TextForm extends StatefulWidget {
  const TextForm({
    super.key,
    required this.hinttext,
    this.hintfontsize,
    required this.textfieldhintcolor,
    required this.texteditingcontroller,
    this.validator,
  });
  final String hinttext;
  final TextEditingController texteditingcontroller;
  final double? hintfontsize;
  final Color? textfieldhintcolor;
  final String? Function(String?)? validator;

  @override
  State<TextForm> createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: TextFormField(
        validator: widget.validator,
        controller: widget.texteditingcontroller,
        decoration: InputDecoration(
          errorStyle: TextStyle(color: AppColors.bluecolor),
          fillColor: AppColors.textformgrey.withOpacity(0.5),
          filled: true,
          hintText: widget.hinttext,
          hintStyle: TextStyle(
              color: AppColors.greycolor.withOpacity(0.5),
              fontSize: widget.hintfontsize ?? size.width * 0.04),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(60.0)),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}

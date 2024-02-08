import 'package:e_commerse_pratik/core/consts/color/color_consts.dart';
import 'package:e_commerse_pratik/core/consts/style/text_styles.dart';
import 'package:e_commerse_pratik/core/enums/text_font_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final IconData? icon;
  final TextInputType? textInputType;
  final IconData? suffixIcon;
  final String? upText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final Function? onTap;
  final String? prefixIconPath;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final bool? obsecure;
  final VoidCallback? onTapSuffix;
  final int? maxLength;
  final FocusNode? focusNode;
  final Function(String)? onSubmitted;
  final TextInputAction? textInputAction;
  final double? margin;
  final Color? fillColor;
  final Color? textColor;
  final TextFont? fontSize;
  final bool withLabel = true;
  final Function? onChanged;
  final double? width;
  final double? height;
  final Color focusBorderColor = Colors.blue;
  final List<TextInputFormatter>? inputFormatters;
  final Iterable<String>? autofillHints;

  const CustomTextField({
    Key? key,
    this.hintText,
    this.icon,
    this.textInputType,
    this.suffixIcon,
    this.upText,
    required this.controller,
    this.keyboardType,
    this.onTap,
    this.prefixIconPath,
    this.prefixIconColor,
    this.suffixIconColor,
    this.obsecure,
    this.onTapSuffix,
    this.maxLength,
    this.focusNode,
    this.onSubmitted,
    this.textInputAction,
    this.fillColor,
    this.textColor,
    this.fontSize,
    this.onChanged,
    this.width,
    this.inputFormatters,
    this.autofillHints,
    this.margin,
    this.height,
  }) : super(key: key);

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  String? hintText;
  late IconData? icon;
  late TextInputType? textInputType;
  late IconData? suffixIcon;
  late String? upText;
  late TextEditingController controller;
  late TextInputType? keyboardType;
  late Function? onTap;
  late String? prefixIconPath;
  late Color? prefixIconColor;
  late Color? suffixIconColor;
  late bool? obsecure;
  late VoidCallback? onTapSuffix;
  late int? maxLength;
  late FocusNode? focusNode;
  late Function(String)? onSubmitted;
  late TextInputAction? textInputAction;
  late double margin = 1.h;
  late Color? fillColor;
  late Color? textColor;
  late TextFont? fontSize;
  late bool withLabel = true;
  late Function? onChanged;
  late double? width;
  late double? height;
  late Color focusBorderColor = Colors.blue;
  late List<TextInputFormatter>? inputFormatters;
  late Iterable<String>? autofillHints;

  @override
  void didUpdateWidget(covariant CustomTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.hintText != widget.hintText) hintText = widget.hintText;
    if (oldWidget.icon != widget.icon) icon = widget.icon;
    if (oldWidget.textInputType != widget.textInputType) {
      textInputType = widget.textInputType;
    }
    if (oldWidget.suffixIcon != widget.suffixIcon) {
      suffixIcon = widget.suffixIcon;
    }
    if (oldWidget.upText != widget.upText) upText = widget.upText;
    if (oldWidget.controller != widget.controller) {
      controller = widget.controller;
    }
    if (oldWidget.keyboardType != widget.keyboardType) {
      keyboardType = widget.keyboardType;
    }
    if (oldWidget.onTap != widget.onTap) onTap = widget.onTap;
    if (oldWidget.prefixIconPath != widget.prefixIconPath) {
      prefixIconPath = widget.prefixIconPath;
    }
    if (oldWidget.prefixIconColor != widget.prefixIconColor) {
      prefixIconColor = widget.prefixIconColor;
    }
    if (oldWidget.suffixIconColor != widget.suffixIconColor) {
      suffixIconColor = widget.suffixIconColor;
    }
    if (oldWidget.obsecure != widget.obsecure) obsecure = widget.obsecure;
    if (oldWidget.onTapSuffix != widget.onTapSuffix) {
      onTapSuffix = widget.onTapSuffix;
    }
    if (oldWidget.maxLength != widget.maxLength) maxLength = widget.maxLength;
    if (oldWidget.focusNode != widget.focusNode) focusNode = widget.focusNode;
    if (oldWidget.onSubmitted != widget.onSubmitted) {
      onSubmitted = widget.onSubmitted;
    }
    if (oldWidget.textInputAction != widget.textInputAction) {
      textInputAction = widget.textInputAction;
    }
    if (oldWidget.fillColor != widget.fillColor) fillColor = widget.fillColor;
    if (oldWidget.textColor != widget.textColor) textColor = widget.textColor;
    if (oldWidget.fontSize != widget.fontSize) fontSize = widget.fontSize;
    if (oldWidget.withLabel != widget.withLabel) withLabel = widget.withLabel;
    if (oldWidget.onChanged != widget.onChanged) onChanged = widget.onChanged;
    if (oldWidget.width != widget.width) width = widget.width;
    if (oldWidget.focusBorderColor != widget.focusBorderColor) {
      focusBorderColor = widget.focusBorderColor;
    }
    if (oldWidget.inputFormatters != widget.inputFormatters) {
      inputFormatters = widget.inputFormatters;
    }
    if (oldWidget.autofillHints != widget.autofillHints) {
      autofillHints = widget.autofillHints;
    }
    if (oldWidget.height != widget.height) height = widget.height;
  }

  @override
  void initState() {
    super.initState();
    //radius = 12;
    hintText = widget.hintText;
    icon = widget.icon;
    textInputType = widget.textInputType;
    suffixIcon = widget.suffixIcon;
    upText = widget.upText;
    controller = widget.controller;
    keyboardType = widget.keyboardType;
    onTap = widget.onTap;
    prefixIconPath = widget.prefixIconPath;
    prefixIconColor = widget.prefixIconColor;
    suffixIconColor = widget.suffixIconColor;
    obsecure = widget.obsecure;
    onTapSuffix = widget.onTapSuffix;
    maxLength = widget.maxLength;
    focusNode = widget.focusNode;
    onSubmitted = widget.onSubmitted;
    textInputAction = widget.textInputAction;
    margin = widget.margin ?? 2.h;
    fillColor = widget.fillColor;
    textColor = widget.textColor;
    fontSize = widget.fontSize;
    withLabel = widget.withLabel;
    onChanged = widget.onChanged;
    width = widget.width;
    height = widget.height ?? 6.h;
    focusBorderColor = widget.focusBorderColor;
    inputFormatters = widget.inputFormatters;
    autofillHints = widget.autofillHints;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: margin),
      width: width,
      height: height,
      child: TextField(
        autofillHints: autofillHints,
        inputFormatters: inputFormatters,
        onChanged: onChanged != null
            ? (value) {
                onChanged!.call(value);
              }
            : null,
        cursorColor: Colors.blue,
        controller: controller,
        focusNode: focusNode,
        onTap: () {
          if (onTap != null) onTap!.call();
        },
        obscureText: obsecure ?? false,
        maxLength: maxLength,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        onSubmitted: (value) {
          if (onSubmitted != null) onSubmitted!.call(value);
        },
        style: ProjectTextStyles.get(
          color: Colors.blue,
          font: fontSize ?? TextFont.small,
          weight: TextWeight.medium,
        ),
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          alignLabelWithHint: false,
          labelText: withLabel ? hintText : null,
          labelStyle: ProjectTextStyles.get(
            color: ProjectColors.kSecondaryColor,
            font: fontSize ?? TextFont.small,
            weight: TextWeight.medium,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ProjectColors.kSecondaryColor),
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: focusBorderColor),
            gapPadding: 0,
            borderRadius: BorderRadius.circular(16),
          ),
          counterText: "",
          filled: true,
          fillColor: fillColor ?? Colors.amber,
          hintText: hintText,
          hintStyle: ProjectTextStyles.get(
            color: ProjectColors.kSecondaryColor,
            font: fontSize ?? TextFont.subtitle,
            weight: TextWeight.medium,
          ),
          prefixIconConstraints: prefixIconPath != null
              ? BoxConstraints(maxWidth: 6.h, minWidth: 6.h)
              : BoxConstraints(maxWidth: 1.h, minWidth: 1.h),
          prefixIcon: prefixIconPath != null
              ? SvgPicture.asset(
                  prefixIconPath!,
                  colorFilter: ColorFilter.mode(
                    prefixIconColor ?? Colors.blue,
                    BlendMode.srcIn,
                  ),
                  height: fontSize != null
                      ? fontSize!.getValue()
                      : TextFont.headline.getValue(),
                )
              : const SizedBox(),
          suffixIcon: obsecure != null
              ? GestureDetector(
                  onTap: onTapSuffix,
                  child: obsecure == true
                      ? const Icon(
                          Icons.visibility_off_sharp,
                          color: Colors.grey,
                        )
                      : const Icon(
                          Icons.visibility,
                          color: Colors.blue,
                        ))
              : suffixIcon != null
                  ? GestureDetector(
                      onTap: onTapSuffix,
                      child: Icon(
                        suffixIcon,
                        color: suffixIconColor ?? Colors.blue,
                      ),
                    )
                  : null,
          contentPadding: EdgeInsets.symmetric(
            horizontal: fontSize != null
                ? fontSize!.getValue()
                : TextFont.subtitle.getValue(),
            vertical: 1.h,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            gapPadding: 0,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}

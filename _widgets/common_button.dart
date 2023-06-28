import 'package:flutter_appexp/_core/app_export.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final ButtonShape? shape;

  final ButtonPadding? padding;

  final ButtonVariant? variant;

  final ButtonFontStyle? fontStyle;

  final Alignment? alignment;

  final VoidCallback? onTap;

  final double? width;
  final double? height;

  final EdgeInsetsGeometry? margin;

  final Widget? prefixWidget;

  final Widget? suffixWidget;

  final String? text;

  const CustomButton(
      {super.key,
      this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.onTap,
      this.width,
      this.margin,
      this.prefixWidget,
      this.suffixWidget,
      this.height,
      this.text});

  const CustomButton.light(
      {super.key,
      this.shape,
      this.padding,
      this.variant = ButtonVariant.fillGray400,
      this.fontStyle,
      this.alignment,
      this.onTap,
      this.width,
      this.height,
      this.margin,
      this.prefixWidget,
      this.suffixWidget,
      this.text});

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildButtonWidget(),
          )
        : _buildButtonWidget();
  }

  _buildButtonWidget() {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 37,
        width: getHorizontalSize(width ?? 0),
        margin: margin,
        padding: _setPadding(),
        decoration: _buildDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            prefixWidget ?? const SizedBox(),
            Text(
              text ?? "",
              textAlign: TextAlign.center,
              style: _setFontStyle(),
            ),
            suffixWidget ?? const SizedBox(),
          ],
        ),
      ),
    );
  }

  _buildDecoration() {
    return BoxDecoration(
      color: _setColor(),
      borderRadius: _setBorderRadius(),
    );
  }

  _setPadding() {
    switch (padding) {
      default:
        return getPadding(
          all: 3,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case ButtonVariant.fillGray400:
        return Pallete.gray400;
      case ButtonVariant.fillBlue:
        return Pallete.cyan700;
      default:
        return Pallete.purpleA700;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case ButtonShape.square:
        return BorderRadius.circular(0);
      case ButtonShape.short:
        return BorderRadius.circular(12);
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            30.00,
          ),
        );
    }
  }

  _setFontStyle() {
    switch (fontStyle) {
      default:
        return TextStyle(
          color: Pallete.whiteA700,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        );
    }
  }
}

enum ButtonShape { square, roundedBorder8, short }

enum ButtonPadding {
  paddingAll3,
}

enum ButtonVariant { fillPurpleA700, fillGray400, fillBlue }

enum ButtonFontStyle {
  interMedium14,
}

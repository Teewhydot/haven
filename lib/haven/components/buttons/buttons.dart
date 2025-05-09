import 'package:flutter/cupertino.dart';
import 'package:haven/haven/core/theme/colors.dart';

class HavenButton extends StatefulWidget {
  final String buttonText;
  final double fontSize;
  final Color color;
  final Color textColor;
  final FontWeight fontWeight;
  final MainAxisAlignment alignment;
  final Widget? icon;
  final Function()? onPressed;
  final double height;
  final double width;
  final double borderRadius;
  final double iconSize;
  final Color borderColor;

  const HavenButton({
    super.key,
    required this.buttonText,
    this.fontSize = 16.0,
    this.color = kPrimaryColor,
    this.textColor = kWhiteColor,
    this.fontWeight = FontWeight.bold,
    this.alignment = MainAxisAlignment.center,
    this.icon,
    this.onPressed,
    this.height = 50.0,
    this.width = 200.0,
    this.borderRadius = 20.0,
    this.iconSize = 24.0,
    this.borderColor = kPrimaryColor,
  });

  @override
  State<HavenButton> createState() => _HavenButtonState();
}

class _HavenButtonState extends State<HavenButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        border: Border.all(color: widget.borderColor),
      ),
      child: CupertinoButton(
        onPressed: widget.onPressed,
        padding: EdgeInsets.zero,
        child: Row(
          mainAxisAlignment: widget.alignment,
          children: [
            if (widget.icon != null)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: widget.icon!,
              ),
            Text(
              widget.buttonText,
              style: TextStyle(
                fontSize: widget.fontSize,
                color: widget.textColor,
                fontWeight: widget.fontWeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

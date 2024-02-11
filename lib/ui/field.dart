import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class FieldWidget extends StatefulWidget {
  final String hint;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final bool obscureText;

  final Widget? icon;
  final Widget? prefix;
  final Widget? prefixIcon;
  final BorderRadius? borderRadius;

  final int maxLength;

  final bool Function(String value)? validator;
  final ValueNotifier<bool>? valid;

  const FieldWidget({
    super.key,
    required this.hint,
    required this.textEditingController,
    required this.keyboardType,
    this.obscureText = false,
    this.maxLength = 30,
    this.borderRadius,
    this.prefixIcon,
    this.prefix,
    this.icon,
    this.validator,
    this.valid,
  }) : assert(validator != null && valid != null);

  @override
  State<FieldWidget> createState() => _FieldWidgetState();
}

class _FieldWidgetState extends State<FieldWidget> {
  late var obscure = widget.obscureText;
  late var hintText = widget.hint;
  late final borderRadius = widget.borderRadius ?? BorderRadius.circular(15);

  bool error = false;

  OutlineInputBorder _buildBorder() => OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: error ? Colors.red : Colors.white),
      );

  void _onValidate(String value) {
    if (widget.validator != null && widget.valid != null) {
      widget.valid!.value = widget.validator!(value);

      setState(() {
        error = !widget.valid!.value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: _onValidate,
      onTap: () => setState(() {
        hintText = '';
      }),
      controller: widget.textEditingController,
      keyboardType: widget.keyboardType,
      inputFormatters: [
        LengthLimitingTextInputFormatter(widget.maxLength),
      ],
      cursorColor: Colors.white,
      style: GoogleFonts.roboto(
        color: Colors.white,
      ),
      obscureText: obscure,
      decoration: InputDecoration(
        focusColor: Colors.white,
        icon: widget.icon,
        labelText: widget.hint,
        labelStyle: GoogleFonts.roboto(
          fontSize: 16,
          color: error ? Colors.red : Colors.white,
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.roboto(
          fontSize: 16,
          color: error ? Colors.red : Colors.white,
        ),
        prefix: widget.prefix,
        prefixIcon: widget.prefixIcon,
        suffixIcon: error || widget.obscureText
            ? Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (error)
                      Padding(
                        padding: EdgeInsets.only(
                            right: !widget.obscureText ? 12 : 0),
                        child: const Icon(
                          FluentIcons.error_circle_24_filled,
                          color: Colors.red,
                        ),
                      ),
                    if (widget.obscureText)
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: GestureDetector(
                          child: Icon(
                            obscure
                                ? FluentIcons.eye_24_filled
                                : FluentIcons.eye_off_24_filled,
                            color: Colors.white,
                          ),
                          onTap: () {
                            setState(() {
                              obscure = !obscure;
                            });
                          },
                        ),
                      ),
                  ],
                ),
              )
            : null,
        enabledBorder: _buildBorder(),
        errorBorder: _buildBorder(),
        focusedBorder: _buildBorder(),
        border: _buildBorder(),
      ),
    );
  }
}

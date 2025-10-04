import 'package:blood_link/constants/colors.dart';
import 'package:blood_link/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final String? suffixText;
  final Widget? suffixIcon;
  final IconData? prefixIcon;
  final Widget? prefix;
  final String? prefixText;
  final bool isPassword;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final void Function()? onTap;
  final bool enabled;
  final bool readOnly;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final bool autofocus;
  final TextCapitalization textCapitalization;
  final TextAlign textAlign;
  final EdgeInsetsGeometry? contentPadding;
  final double borderRadius;
  final Color borderColor;
  final Color focusedBorderColor;
  final Color errorBorderColor;
  final Color backgroundColor;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final bool showCharacterCount;
  final double? width;
  final double? height;
  final bool isFilled;
  final Color? fillColor;
  final String? errorText;

  const CustomTextField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.suffixText,
    this.suffixIcon,
    this.prefixIcon,
    this.prefix,
    this.prefixText,
    this.isPassword = false,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.inputFormatters,
    this.focusNode,
    this.nextFocusNode,
    this.autofocus = false,
    this.textCapitalization = TextCapitalization.none,
    this.textAlign = TextAlign.start,
    this.contentPadding,
    this.borderRadius = 5.0,
    this.borderColor = Colors.grey,
    this.focusedBorderColor = primaryRed,
    this.errorBorderColor = Colors.red,
    this.backgroundColor = Colors.transparent,
    this.textStyle,
    this.hintStyle,
    this.showCharacterCount = false,
    this.width,
    this.height = 50,
    this.isFilled = false,
    this.fillColor,
    this.errorText,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;
  late FocusNode _focusNode;
  bool _isInternalFocusNode = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword ? true : widget.obscureText;

    // Check if we need to create an internal focus node
    if (widget.focusNode == null) {
      _focusNode = FocusNode();
      _isInternalFocusNode = true;
    } else {
      _focusNode = widget.focusNode!;
      _isInternalFocusNode = false;
    }

    // Ensure the focus node is properly initialized
    _focusNode.canRequestFocus = true;
  }

  @override
  void didUpdateWidget(CustomTextField oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Handle focus node changes
    if (widget.focusNode != oldWidget.focusNode) {
      if (_isInternalFocusNode) {
        _focusNode.dispose();
      }

      if (widget.focusNode == null) {
        _focusNode = FocusNode();
        _isInternalFocusNode = true;
      } else {
        _focusNode = widget.focusNode!;
        _isInternalFocusNode = false;
      }
    }
  }

  @override
  void dispose() {
    if (_isInternalFocusNode) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _handleSubmitted(String value) {
    if (widget.onSubmitted != null) {
      widget.onSubmitted!(value);
    }

    if (widget.nextFocusNode != null) {
      FocusScope.of(context).requestFocus(widget.nextFocusNode);
    } else if (widget.textInputAction == TextInputAction.done) {
      _focusNode.unfocus();
    }
  }

  Widget? _buildSuffixIcon() {
    if (widget.isPassword) {
      return IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility_off : Icons.visibility,
          color: Colors.grey[600],
          size: 20,
        ),
        onPressed: _toggleObscureText,
        splashRadius: 20,
      );
    }
    return widget.suffixIcon;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      constraints: BoxConstraints(
        minHeight: widget.height ?? 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.labelText != null) ...[
            Text(
              widget.labelText!,
              style: TextStyle(
                fontSize: SizeUtils.fontSize(16),
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            SizeUtils.heightSizeBox(5),
          ],
          Flexible(
            child: widget.prefixText != null
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                      border: Border.all(
                        color: _focusNode.hasFocus
                            ? widget.focusedBorderColor
                            : (widget.errorText != null
                                ? widget.errorBorderColor
                                : widget.borderColor),
                        width: _focusNode.hasFocus ? 1.5 : 1.0,
                      ),
                      color: widget.isFilled
                          ? (widget.fillColor ?? const Color(0xffEFF6FF))
                          : widget.backgroundColor,
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                SizeUtils.getProportionateScreenWidth(16),
                            vertical:
                                SizeUtils.getProportionateScreenHeight(12),
                          ),
                          child: Text(
                            widget.prefixText!,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            cursorColor: primaryRed,
                            controller: widget.controller,
                            focusNode: _focusNode,
                            obscureText: _obscureText,
                            keyboardType: widget.keyboardType,
                            textInputAction: widget.textInputAction,
                            onChanged: widget.onChanged,
                            onSubmitted: _handleSubmitted,
                            onTap: widget.onTap,
                            enabled: widget.enabled,
                            readOnly: widget.readOnly,
                            maxLines: widget.maxLines,
                            minLines: widget.minLines,
                            maxLength: widget.maxLength,
                            inputFormatters: widget.inputFormatters,
                            autofocus: widget.autofocus,
                            textCapitalization: widget.textCapitalization,
                            textAlign: widget.textAlign,
                            style: widget.textStyle ??
                                const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                            decoration: InputDecoration(
                              hintText: widget.hintText,
                              hintStyle: widget.hintStyle ??
                                  TextStyle(
                                    fontSize: SizeUtils.fontSize(16),
                                    color: Colors.grey[500],
                                    fontWeight: FontWeight.w400,
                                  ),
                              suffixText: widget.suffixText,
                              suffixIcon: widget.suffixText == null
                                  ? _buildSuffixIcon()
                                  : null,
                              prefixIcon: widget.prefixIcon == null
                                  ? null
                                  : Icon(widget.prefixIcon),
                              filled: false,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 0,
                                vertical:
                                    SizeUtils.getProportionateScreenHeight(12),
                              ),
                              counterText:
                                  widget.showCharacterCount ? null : '',
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              isDense: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      // Ensure focus node can request focus and request it
                      if (_focusNode.canRequestFocus) {
                        _focusNode.requestFocus();
                      }
                      if (widget.onTap != null) {
                        widget.onTap!();
                      }
                    },
                    child: TextField(
                      cursorColor: primaryRed,
                      controller: widget.controller,
                      focusNode: _focusNode,
                      obscureText: _obscureText,
                      keyboardType: widget.keyboardType,
                      textInputAction: widget.textInputAction,
                      onChanged: widget.onChanged,
                      onSubmitted: _handleSubmitted,
                      onTap: widget.onTap,
                      enabled: widget.enabled,
                      readOnly: widget.readOnly,
                      maxLines: widget.maxLines,
                      minLines: widget.minLines,
                      maxLength: widget.maxLength,
                      inputFormatters: widget.inputFormatters,
                      autofocus: widget.autofocus,
                      textCapitalization: widget.textCapitalization,
                      textAlign: widget.textAlign,
                      style: widget.textStyle ??
                          const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                      decoration: InputDecoration(
                        hintText: widget.hintText,
                        hintStyle: widget.hintStyle ??
                            TextStyle(
                              fontSize: SizeUtils.fontSize(16),
                              color: Colors.grey[500],
                              fontWeight: FontWeight.w400,
                            ),
                        prefix: widget.prefix,
                        suffixText: widget.suffixText,
                        suffixIcon: widget.suffixText == null
                            ? _buildSuffixIcon()
                            : null,
                        prefixIcon: widget.prefixIcon == null
                            ? null
                            : Icon(widget.prefixIcon),
                        filled: widget.isFilled,
                        fillColor: widget.isFilled
                            ? (widget.fillColor ?? const Color(0xffEFF6FF))
                            : widget.backgroundColor,
                        contentPadding: widget.contentPadding ??
                            EdgeInsets.symmetric(
                              horizontal:
                                  SizeUtils.getProportionateScreenWidth(16),
                              vertical:
                                  SizeUtils.getProportionateScreenHeight(12),
                            ),
                        counterText: widget.showCharacterCount ? null : '',
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(widget.borderRadius),
                          borderSide: BorderSide(
                            color: widget.borderColor,
                            width: 1.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(widget.borderRadius),
                          borderSide: BorderSide(
                            color: widget.borderColor,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(widget.borderRadius),
                          borderSide: BorderSide(
                            color: widget.focusedBorderColor,
                            width: 1.5,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(widget.borderRadius),
                          borderSide: BorderSide(
                            color: widget.errorBorderColor,
                            width: 1.0,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(widget.borderRadius),
                          borderSide: BorderSide(
                            color: widget.errorBorderColor,
                            width: 1.5,
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(widget.borderRadius),
                          borderSide: BorderSide(
                            color: Colors.grey[300]!,
                            width: 1.0,
                          ),
                        ),
                        errorStyle: const TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        errorMaxLines: 2,
                        errorText: widget.errorText,
                        isDense: true,
                      ),
                    ),
                  ),
          ),
          if (widget.prefixText != null && widget.errorText != null)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                widget.errorText!,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

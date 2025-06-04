import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Email validation utility class
class EmailValidator {
  static const String _emailPattern = 
      r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
  static final RegExp _emailRegExp = RegExp(_emailPattern);

  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    
    if (!_emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    
    if (value.length > 254) {
      return 'Email address is too long';
    }
    
    return null;
  }

  static bool isValid(String email) {
    return validate(email) == null;
  }
}

// Custom email text field widget
class EmailTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? initialValue;
  final String? labelText;
  final String? hintText;
  final bool enabled;
  final bool readOnly;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode? autovalidateMode;
  final InputDecoration? decoration;
  final TextStyle? style;
  final FocusNode? focusNode;
  final bool showVisibilityToggle;
  final EdgeInsets? contentPadding;

  const EmailTextField({
    Key? key,
    this.controller,
    this.initialValue,
    this.labelText = 'Email',
    this.hintText = 'Enter your email address',
    this.enabled = true,
    this.readOnly = false,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.validator,
    this.autovalidateMode,
    this.decoration,
    this.style,
    this.focusNode,
    this.showVisibilityToggle = false,
    this.contentPadding,
  }) : super(key: key);

  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  bool _hasError = false;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController(text: widget.initialValue);
    _focusNode = widget.focusNode ?? FocusNode();
    
    _focusNode.addListener(_onFocusChange);
    _controller.addListener(_onTextChange);
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  void _onFocusChange() {
    if (!_focusNode.hasFocus && _controller.text.isNotEmpty) {
      _validateEmail();
    }
  }

  void _onTextChange() {
    widget.onChanged?.call(_controller.text);
    
    // Clear error when user starts typing
    if (_hasError && _controller.text.isNotEmpty) {
      setState(() {
        _hasError = false;
        _errorText = null;
      });
    }
  }

  void _validateEmail() {
    final error = (widget.validator ?? EmailValidator.validate)(_controller.text);
    setState(() {
      _hasError = error != null;
      _errorText = error;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return TextFormField(
      controller: _controller,
      focusNode: _focusNode,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      autocorrect: false,
      enableSuggestions: false,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      style: widget.style,
      autovalidateMode: widget.autovalidateMode ?? AutovalidateMode.onUserInteraction,
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp(r'\s')), // No spaces
        LengthLimitingTextInputFormatter(254), // Email length limit
      ],
      validator: widget.validator ?? EmailValidator.validate,
      onEditingComplete: widget.onEditingComplete,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: widget.decoration ?? InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        prefixIcon: Icon(
          Icons.email_outlined,
          color: _hasError 
            ? theme.colorScheme.error 
            : _focusNode.hasFocus 
              ? theme.colorScheme.primary 
              : theme.colorScheme.onSurfaceVariant,
        ),
        suffixIcon: _controller.text.isNotEmpty
          ? IconButton(
              icon: Icon(
                _hasError ? Icons.error_outline : Icons.check_circle_outline,
                color: _hasError 
                  ? theme.colorScheme.error 
                  : theme.colorScheme.primary,
              ),
              onPressed: _hasError ? null : () {
                // Optional: Show success message or perform action
              },
            )
          : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: theme.colorScheme.outline,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: theme.colorScheme.primary,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: theme.colorScheme.error,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: theme.colorScheme.error,
            width: 2,
          ),
        ),
        contentPadding: widget.contentPadding ?? 
          const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        errorText: _errorText,
      ),
    );
  }
}

// Usage example widget
class EmailFormExample extends StatefulWidget {
  @override
  State<EmailFormExample> createState() => _EmailFormExampleState();
}

class _EmailFormExampleState extends State<EmailFormExample> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      // Form is valid
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Email is valid: ${_emailController.text}'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Email Validation Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Enter your email address',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 20),
              
              // Basic email field
              EmailTextField(
                controller: _emailController,
                focusNode: _focusNode,
                onFieldSubmitted: (_) => _handleSubmit(),
              ),
              
              const SizedBox(height: 20),
              
              // Custom styled email field
              EmailTextField(
                labelText: 'Work Email',
                hintText: 'Enter your work email',
                decoration: InputDecoration(
                  labelText: 'Work Email',
                  hintText: 'Enter your work email',
                  prefixIcon: Icon(Icons.work_outline),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.surfaceVariant,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (value) {
                  final basicValidation = EmailValidator.validate(value);
                  if (basicValidation != null) return basicValidation;
                  
                  // Additional validation for work email
                  if (value != null && !value.contains('@company.com')) {
                    return 'Please use your company email address';
                  }
                  return null;
                },
              ),
              
              const SizedBox(height: 30),
              
              ElevatedButton(
                onPressed: _handleSubmit,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('Validate Email'),
              ),
              
              const SizedBox(height: 20),
              
              // Show current validation status
              ValueListenableBuilder(
                valueListenable: _emailController,
                builder: (context, value, child) {
                  final isValid = EmailValidator.isValid(value.text);
                  final isEmpty = value.text.isEmpty;
                  
                  if (isEmpty) {
                    return SizedBox.shrink();
                  }
                  
                  return Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isValid 
                        ? Colors.green.withOpacity(0.1)
                        : Colors.red.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: isValid ? Colors.green : Colors.red,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          isValid ? Icons.check_circle : Icons.error,
                          color: isValid ? Colors.green : Colors.red,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            isValid 
                              ? 'Valid email address'
                              : 'Invalid email address',
                            style: TextStyle(
                              color: isValid ? Colors.green : Colors.red,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Alternative simpler email field for quick use
class SimpleEmailField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;

  const SimpleEmailField({
    Key? key,
    this.controller,
    this.labelText = 'Email',
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      autocorrect: false,
      validator: validator ?? EmailValidator.validate,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(Icons.email),
        border: OutlineInputBorder(),
      ),
    );
  }
}
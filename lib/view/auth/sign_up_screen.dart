import 'package:blood_link/constants/images.dart';
import 'package:blood_link/constants/colors.dart';
import 'package:blood_link/routes/export.dart';
import 'package:blood_link/utils/size_config.dart';
import 'package:blood_link/widgets/custom_text_field.dart';
import 'package:blood_link/widgets/my_reusable_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _nameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _phoneFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _phoneFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      NavigationHelper.off(AppRoutes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: SizeUtils.width(20),
            vertical: SizeUtils.height(20),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizeUtils.heightSizeBox(20),

                // Blood Icon
                Image(
                  image: const AssetImage(bloodIcon),
                  height: SizeUtils.height(80),
                ),

                SizeUtils.heightSizeBox(15),

                // Title
                Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: SizeUtils.fontSize(28),
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),

                SizeUtils.heightSizeBox(8),

                Text(
                  "Sign up to get started",
                  style: TextStyle(
                    fontSize: SizeUtils.fontSize(16),
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.7),
                  ),
                ),

                SizeUtils.heightSizeBox(30),

                // Name Field
                CustomTextField(
                  controller: _nameController,
                  hintText: "Enter your full name",
                  labelText: "Full Name",
                  prefixIcon: Icons.person_outline,
                  textInputAction: TextInputAction.next,
                  focusNode: _nameFocusNode,
                  nextFocusNode: _emailFocusNode,
                  textCapitalization: TextCapitalization.words,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    if (value.length < 2) {
                      return 'Name must be at least 2 characters';
                    }
                    return null;
                  },
                ),

                SizeUtils.heightSizeBox(15),

                // Email Field
                CustomTextField(
                  controller: _emailController,
                  hintText: "Enter your email",
                  labelText: "Email",
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  focusNode: _emailFocusNode,
                  nextFocusNode: _phoneFocusNode,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),

                SizeUtils.heightSizeBox(15),

                // Phone Field
                CustomTextField(
                  controller: _phoneController,
                  hintText: "Enter your phone number",
                  labelText: "Phone Number",
                  prefixIcon: Icons.phone_outlined,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  focusNode: _phoneFocusNode,
                  nextFocusNode: _passwordFocusNode,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    if (value.length < 10) {
                      return 'Please enter a valid phone number';
                    }
                    return null;
                  },
                ),

                SizeUtils.heightSizeBox(15),

                // Password Field
                CustomTextField(
                  controller: _passwordController,
                  hintText: "Enter your password",
                  labelText: "Password",
                  prefixIcon: Icons.lock_outline,
                  isPassword: true,
                  textInputAction: TextInputAction.next,
                  focusNode: _passwordFocusNode,
                  nextFocusNode: _confirmPasswordFocusNode,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),

                SizeUtils.heightSizeBox(15),

                // Confirm Password Field
                CustomTextField(
                  controller: _confirmPasswordController,
                  hintText: "Confirm your password",
                  labelText: "Confirm Password",
                  prefixIcon: Icons.lock_outline,
                  isPassword: true,
                  textInputAction: TextInputAction.done,
                  focusNode: _confirmPasswordFocusNode,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),

                SizeUtils.heightSizeBox(30),

                // Sign Up Button
                MyReusableButton(
                  title: "Sign Up",
                  onPress: _signUp,
                  color: primaryRed,
                ),

                SizeUtils.heightSizeBox(20),

                // Sign In Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(
                        fontSize: SizeUtils.fontSize(14),
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withValues(alpha: 0.7),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        NavigationHelper.back();
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: primaryRed,
                          fontSize: SizeUtils.fontSize(14),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

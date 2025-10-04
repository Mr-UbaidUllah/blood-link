import 'package:blood_link/constants/colors.dart';
import 'package:blood_link/constants/images.dart';
import 'package:blood_link/routes/export.dart';
import 'package:blood_link/utils/size_config.dart';
import 'package:blood_link/widgets/custom_text_field.dart';
import 'package:blood_link/widgets/my_reusable_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _signIn() {
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
                SizeUtils.heightSizeBox(40),

                // Blood Icon
                Image(
                  image: const AssetImage(bloodIcon),
                  height: SizeUtils.height(100),
                ),

                SizeUtils.heightSizeBox(20),

                // Title
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: SizeUtils.fontSize(28),
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),

                SizeUtils.heightSizeBox(8),

                Text(
                  "Sign in to continue",
                  style: TextStyle(
                    fontSize: SizeUtils.fontSize(16),
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.7),
                  ),
                ),

                SizeUtils.heightSizeBox(40),

                // Email Field
                CustomTextField(
                  controller: _emailController,
                  hintText: "Enter your email",
                  labelText: "Email",
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  focusNode: _emailFocusNode,
                  nextFocusNode: _passwordFocusNode,
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

                SizeUtils.heightSizeBox(20),

                // Password Field
                CustomTextField(
                  controller: _passwordController,
                  hintText: "Enter your password",
                  labelText: "Password",
                  prefixIcon: Icons.lock_outline,
                  isPassword: true,
                  textInputAction: TextInputAction.done,
                  focusNode: _passwordFocusNode,
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

                SizeUtils.heightSizeBox(10),

                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: primaryRed,
                        fontSize: SizeUtils.fontSize(14),
                      ),
                    ),
                  ),
                ),

                SizeUtils.heightSizeBox(30),

                // Sign In Button
                MyReusableButton(
                  title: "Sign In",
                  onPress: _signIn,
                  color: primaryRed,
                ),

                SizeUtils.heightSizeBox(30),

                // Sign Up Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
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
                        NavigationHelper.to(AppRoutes.signUp);
                      },
                      child: Text(
                        "Sign Up",
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

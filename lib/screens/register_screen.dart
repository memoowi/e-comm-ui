import 'dart:developer';
import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pertama/screens/login_screen.dart';
import 'package:flutter_svg/svg.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static const routeName = '/register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _obscureText = true;
  bool _obscureText2 = true;

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _toggleObscureText2() {
    setState(() {
      _obscureText2 = !_obscureText2;
    });
  }

  String? _nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    } else if (value.length < 3) {
      return 'Name must be at least 3 characters';
    }
  }

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!value.contains('@')) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? _confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    } else if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Logic Data Prosessing
      // Just Placeholder
      log('Name: ${_nameController.text}');
      log('Email: ${_emailController.text}');
      log('Password: ${_passwordController.text}');
      log('Confirm Password: ${_confirmPasswordController.text}');
    }
  }

  // Obscure Text - Toggle -> Fix UI -> Navigate to Other page

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Login'),
      //   centerTitle: true,
      //   // leading: BackButton(),
      //   // actions: [
      //   //   IconButton(icon: Icon(Icons.search), onPressed: () {}),
      //   //   IconButton(icon: Icon(Icons.search), onPressed: () {}),
      //   // ],
      //   backgroundColor: Colors.transparent,
      //   foregroundColor: Colors.white,
      //   titleTextStyle: Theme.of(
      //     context,
      //   ).textTheme.titleLarge!.copyWith(color: Colors.white),
      // ),
      // extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent),
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/2.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                    decoration: BoxDecoration(color: Colors.white12),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Register to Continue',
                            style: Theme.of(context).textTheme.headlineSmall!
                                .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          SizedBox(height: 24),
                          TextFormField(
                            controller: _nameController,
                            validator: _nameValidator,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'Enter your name',
                              prefixIcon: Icon(Icons.person),
                            ),
                            keyboardType: TextInputType.name,
                            autofillHints: [AutofillHints.name],
                            onTapOutside: (_) =>
                                FocusManager.instance.primaryFocus?.unfocus(),
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(height: 16),
                          TextFormField(
                            controller: _emailController,
                            validator: _emailValidator,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'Enter your email',
                              prefixIcon: Icon(Icons.email),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            autofillHints: [AutofillHints.email],
                            onTapOutside: (_) =>
                                FocusManager.instance.primaryFocus?.unfocus(),
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(height: 16),
                          TextFormField(
                            controller: _passwordController,
                            validator: _passwordValidator,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'Enter your password',
                              prefixIcon: Icon(Icons.password),
                              suffixIcon: IconButton(
                                onPressed: _toggleObscureText,
                                icon: Icon(
                                  _obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                              suffixIconColor: Colors.white,
                            ),
                            keyboardType: TextInputType.visiblePassword,
                            autofillHints: [AutofillHints.password],
                            onTapOutside: (_) =>
                                FocusManager.instance.primaryFocus?.unfocus(),
                            obscureText: _obscureText,
                            textInputAction: TextInputAction.send,
                            onFieldSubmitted: (_) => _submitForm(),
                          ),
                          SizedBox(height: 16),
                          TextFormField(
                            controller: _confirmPasswordController,
                            validator: _confirmPasswordValidator,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'Confirm your password',
                              prefixIcon: Icon(Icons.password),
                              suffixIcon: IconButton(
                                onPressed: _toggleObscureText2,
                                icon: Icon(
                                  _obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                              suffixIconColor: Colors.white,
                            ),
                            keyboardType: TextInputType.visiblePassword,
                            autofillHints: [AutofillHints.password],
                            onTapOutside: (_) =>
                                FocusManager.instance.primaryFocus?.unfocus(),
                            obscureText: _obscureText2,
                            textInputAction: TextInputAction.send,
                            onFieldSubmitted: (_) => _submitForm(),
                          ),
                          SizedBox(height: 16),
                          FilledButton(
                            onPressed: _submitForm,
                            style: FilledButton.styleFrom(
                              minimumSize: Size(double.infinity, 50),
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text('Register'),
                          ),
                          SizedBox(height: 16),
                          Text.rich(
                            TextSpan(
                              text: 'Already have an account? ',
                              style: TextStyle(color: Colors.white),
                              children: [
                                TextSpan(
                                  text: 'Login',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushReplacementNamed(
                                        context,
                                        LoginScreen.routeName,
                                      );
                                    },
                                  style: TextStyle(
                                    color: Colors.white,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 24),
                          Text(
                            'Or\nContinue with',
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  'assets/icons/google.svg',
                                  width: 24,
                                ),
                                style: IconButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor: Colors.white,
                                ),
                              ),
                              SizedBox(width: 5),
                              IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  'assets/icons/apple.svg',
                                  width: 24,
                                ),
                                style: IconButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

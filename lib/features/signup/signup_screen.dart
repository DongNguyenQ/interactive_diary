import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interactive_diary/bloc/authentication/signup/google_signup_bloc.dart';
import 'package:interactive_diary/constants/dimens.dart';
import 'package:nartus_ui_package/nartus_ui.dart';

class IDSignUp extends Screen {
  const IDSignUp({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context) {
    return BlocProvider<GoogleSignupBloc>(
      create: (_) => GoogleSignupBloc(),
      child: const _IDSignUpBody(),
    );
  }
}

class _IDSignUpBody extends StatelessWidget {
  const _IDSignUpBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Dimension.spacing12),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          SizedBox(
            width: double.infinity,
            child: Text(
              'Welcome to Interactive Dairy',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Gap.v12(),
          SizedBox(
            width: double.infinity,
            child: Text("Let's join us to create your journey"),
          ),
          Gap.v20(),
          _IDRegisterForm(),
          Gap.v20(),
          IDGoogleSignInButton(),
          Gap.v12(),
          _IDAppleSignInButton()
        ],
      ),
    );
  }
}

class _IDAppleSignInButton extends StatelessWidget {
  const _IDAppleSignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IDButton(
        text: 'Continue with Apple', onPressed: () => _signUpByApple(context));
  }

  void _signUpByApple(BuildContext context) => () {};
}

class IDGoogleSignInButton extends StatelessWidget {
  const IDGoogleSignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GoogleSignupBloc, GoogleSignupState>(
      builder: (BuildContext stateContext, GoogleSignupState googleState) {
        return IDButton(
          text: 'Continue with Google',
          onPressed: () => _signUpByGoogle(stateContext),
          isBusy: googleState.isSigningUp,
        );
      },
      listener: (BuildContext stateContext, GoogleSignupState googleState) {
        if (googleState.isSignedUpSucceed) {
          // TODO navigate to home screen
        } else if (googleState.isSignedUpFailed) {
          // TODO show sign up failed dialog
        }
      },
    );
  }

  void _signUpByGoogle(BuildContext context) =>
      context.read<GoogleSignupBloc>().add(SignUpByGoogleEvent());
}

class _IDRegisterForm extends StatelessWidget {
  const _IDRegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: <Widget>[
        const IDTextField(
          hint: 'Email',
        ),
        const Gap.v20(),
        const IDTextField(
          hint: 'Password',
        ),
        const Gap.v20(),
        IDButton(text: 'Register', onPressed: () => _register())
      ],
    ));
  }

  void _register() {}
}

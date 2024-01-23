import 'package:flutter/material.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';

class LoginPage extends StatelessWidget {
  final String clientId = "ihma_ins_web";
  final String redirectAuthScheme = 'ihmamobile';
  final String authorizationUrl = 'https://tauth.ihmatest.uz/account/login';
  final String redirectUri = 'ihmamobile:/oauth2redirect';

  const LoginPage({Key? key}) : super(key: key);

  Future<void> _handleSignIn() async {
    final authUrl = '$authorizationUrl?returnUrl=$redirectUri';

    try {
      final result = await FlutterWebAuth2.authenticate(
        url: authUrl,
        callbackUrlScheme: redirectAuthScheme,
        options: const FlutterWebAuth2Options(
          preferEphemeral: true,
        ),
      );

      if (result == null) {
        // User canceled the login

        print('User canceled login');
        // You can show a message to the user or perform any other necessary action.
      } else {
        print("====================================");

        print(result.toString());


      }
    } catch (e) {
      print('Error during authentication: $e');
      // Handle other authentication errors
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OAuth Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: ()async{
            await _handleSignIn();
          },
          child: const Text('Sign In with OAuth'),
        ),
      ),
    );
  }
}

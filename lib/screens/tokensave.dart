import 'package:bookapps/provider/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TokenSave extends StatelessWidget {
  const TokenSave({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Token Save'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: Consumer<AuthViewModel>(
                builder: (context, auth, child) {
                  return Text("Token: ${auth.user.token}");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({Key? key});

  @override
  State<StatefulWidget> createState() => PasswordPageState();
}

class PasswordPageState extends State<PasswordPage> {
  TextEditingController password = TextEditingController();
  List<String> passwordErrors = [];

  void checkPasswordRequirements() {
    String enteredPassword = password.text;
    passwordErrors = [];

    bool hasMinimumLength = enteredPassword.length >= 6;
    bool hasSpecialCharacter =
        RegExp(r'[!@#$%^&*(){}[\]|:;"<>?,./]').hasMatch(enteredPassword);
    bool hasNumber = RegExp(r'\d').hasMatch(enteredPassword);

    if (!hasMinimumLength) {
      passwordErrors.add('Hasło musi mieć co najmniej 6 znaków!');
    }
    if (!hasSpecialCharacter) {
      passwordErrors.add('Hasło musi mieć co najmniej 1 znak specjalny!');
    }
    if (!hasNumber) {
      passwordErrors.add('Hasło musi mieć co najmniej 1 cyfrę!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Sprawdzanie",
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Segoe UI',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Hasło",
                border: OutlineInputBorder(),
                errorText: passwordErrors.isNotEmpty
                    ? passwordErrors.join("\n")
                    : null,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: SizedBox(
              width: 150,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    checkPasswordRequirements();
                  });

                  if (passwordErrors.isNotEmpty) {
                    return;
                  }

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Hasło spełnia wymogi!"),
                    duration: const Duration(seconds: 1),
                  ));

                  // Add your desired logic here after the password check
                },
                child: Text(
                  "Testuj",
                  style: TextStyle(
                    fontFamily: "Segoe UI",
                    fontSize: 22,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

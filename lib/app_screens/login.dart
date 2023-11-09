import 'package:cars_manager/app_screens/accueil.dart';
import 'package:cars_manager/services/api.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  final APIService apiService = APIService();

  TextEditingController usernameController = TextEditingController();
  TextEditingController mdpController = TextEditingController();

  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20.0),
        // Login Screen UI Centered
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.car_crash_sharp,
                size: 80,
                color: Colors.blue,
              ),
              const SizedBox(height: 20),
              const Text(
                'Bienvenue',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const Text(
                'Veuillez vous connecter',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  // Color of the description text
                  color: Color.fromARGB(255, 103, 109, 114),
                ),
              ),
              const SizedBox(height: 20),
              Form(
                key: _formStateKey,
                child: Column(
                  children: [
                    TextField(
                      controller: usernameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Nom d'utilisateur",
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: mdpController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Mot de passe',
                      ),
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: 125,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formStateKey.currentState!.validate()) {
                            final username = usernameController.text;
                            final password = mdpController.text;
                            final result = await apiService.login(username, password);

                            if (result == 201) {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => AccueilScreen(),
                              ));
                            } else {
                              mdpController.text = "";

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Erreur de connexion. Vérifiez vos identifiants.'),
                                ),
                              );
                            }
                          }
                        },
                        child: const Text('Login'),
                      ), 
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
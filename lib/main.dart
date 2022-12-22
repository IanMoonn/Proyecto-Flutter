import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login_ui/pantallacartaBeforeLogin.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'auth/main_page.dart';
import 'package:login_ui/carrito/carrito.dart';
import 'package:login_ui/pantallainicio.dart';
import 'buscador.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
      ChangeNotifierProvider(
        create: (context) => Carrito(),
        child: const MyApp(),
      )
  );
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

// This Widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PantallaCartaBeforeLogin(),
    );
  }
}

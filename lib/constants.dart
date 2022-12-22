import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/auth/main_page.dart';
import 'package:login_ui/pages/login_page.dart';

var defaultBackgroundColor = Colors.green[300];
var appBarColor = Colors.green[900];
var myAppBar = AppBar(
  backgroundColor: appBarColor,
  title: const Text(''),
  centerTitle: false,
);

var drawerTextColor = TextStyle(
  color: Colors.pink[600],
);

var tilePadding = const EdgeInsets.only(left: 8.0, right: 8, top: 8);
var myDrawer = Drawer(
  backgroundColor: Colors.grey[300],
  elevation: 0,
  child: Column(
    children: [
      const DrawerHeader(
        child: CircleAvatar(
          radius: 70,
          backgroundImage: NetworkImage("img/logo.jpg"),
        ),
      ),
      Padding(
        padding: tilePadding,
        child: ListTile(
          leading: const Icon(Icons.house),
          title: TextButton(
            onPressed: (){},
            child: const Text(
              'INICIO',
              style: TextStyle(
                color: Colors.pink,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: tilePadding,
        child: ListTile(
          leading: const Icon(Icons.food_bank),
          title: TextButton(
            onPressed: (){},
            child: const Text(
              'LACTEOS  ',
              style: TextStyle(
                color: Colors.pink,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: tilePadding,
        child: ListTile(
          leading: const Icon(Icons.food_bank),
          title: TextButton(
            onPressed: (){},
            child: const Text(
              'VERDURAS',
              style: TextStyle(
                color: Colors.pink,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: tilePadding,
        child: ListTile(
          leading: const Icon(Icons.apple),
          title: TextButton(
            onPressed: (){},
            child: const Text(
              'FRUTAS',
              style: TextStyle(
                color: Colors.pink,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: tilePadding,
        child: ListTile(
          leading: const Icon(Icons.cake),
          title: TextButton(
            onPressed: (){},
            child: const Text(
              'POSTRES',
              style: TextStyle(
                color: Colors.pink,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: tilePadding,
        child: ListTile(
          leading: const Icon(Icons.add),
          title: TextButton(
            onPressed: (){},
            child: const Text(
              'VER TODOS',
              style: TextStyle(
                color: Colors.pink,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: tilePadding,
        child: ListTile(
          leading: const Icon(Icons.info),
          title: TextButton(
            onPressed: (){},
            child: const Text(
              'MÁS INFORMACIÓN',
              style: TextStyle(
                color: Colors.pink,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: tilePadding,
        child: ListTile(
          leading: const Icon(Icons.account_box),
          title: TextButton(
            onPressed: (){},
            child: const Text(
              'MI CUENTA',
              style: TextStyle(
                color: Colors.pink,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
      const Divider(),
      StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: tilePadding,
            child: ListTile(
              leading: const Icon(Icons.logout),
              title: TextButton(
                onPressed: (){
                  FirebaseAuth.instance.signOut();
                },
                child: const Text(
                  'CERRAR SESIÓN',
                  style: TextStyle(
                    color: Colors.pink,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          );
        } else {
          return Padding(
          padding: tilePadding,
          child: ListTile(
            leading: const Icon(Icons.login),
            title: TextButton(
              onPressed: (){
                FirebaseAuth.instance.signOut();
              },
              child: const Text(
                'INICIAR SESIÓN',
                style: TextStyle(
                  color: Colors.pink,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        );
        }
      },
      ),
    ],
  ),
);
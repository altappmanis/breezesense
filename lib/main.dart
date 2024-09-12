import 'package:flutter/material.dart';
import 'package:tesajahh/main_page.dart';
import 'package:tesajahh/profile.dart';
// Pastikan import file ProfilePage.dart atau sesuaikan dengan nama file Anda

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Definisikan rute-rute aplikasi Anda di sini
      initialRoute: '/', // Rute awal aplikasi
      routes: {
        '/': (context) => MainPage(), // Rute untuk halaman utama (MainPage)
        '/profile': (context) =>
            ProfilePage(), // Rute untuk halaman profil (ProfilePage)
      },
    );
  }
}

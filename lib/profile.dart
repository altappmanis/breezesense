import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tesajahh/main_page.dart';
//import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isRecording = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 70,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(100),
            bottomRight: Radius.circular(100),
          )),
          backgroundColor: const Color(0xFF004B5B),
          title: const Center(
            child: Text(
              'Profile',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 30.0,
                fontWeight: FontWeight.w900, // Ketebalan font
                fontStyle: FontStyle.normal, // Gaya font
                color: Colors.white, // Warna teks
              ),
            ),
          )),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Icon(
                  Icons.person,
                  size: 60.0,
                  color: Colors.black,
                ),
                SizedBox(height: 15),
                Text(
                  "HARUTO",
                  style: TextStyle(
                      color: Color(0xFF004B5B),
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold, // Ketebalan font
                      fontStyle: FontStyle.normal,
                      fontSize: 25),
                ),
                SizedBox(height: 35),
                Container(
                    decoration: BoxDecoration(
                        color: Color(0xFF004B5B),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        )),
                    width: 250,
                    height: 50,
                    child: Row(
                      children: [
                        SizedBox(width: 30),
                        Text(
                          "Device",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold, // Ketebalan font
                              fontStyle: FontStyle.normal,
                              fontSize: 23),
                        ),
                        //SizedBox(height:  40),
                      ],
                    )),
                Container(
                  width: 250,
                  height: 40,
                  //color: Color.fromARGB(255, 223, 219, 219),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        Color.fromARGB(255, 223, 219, 219),
                        Colors.white
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 30),
                      Text(
                        "Device ID",
                        style:
                            TextStyle(color: Color(0xFF004B5B), fontSize: 15),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 250,
                  height: 40,
                  //color: Color.fromARGB(255, 223, 219, 219),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        Color.fromARGB(255, 223, 219, 219),
                        Colors.white
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 30),
                      Text(
                        "Status",
                        style:
                            TextStyle(color: Color(0xFF004B5B), fontSize: 15),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 250,
                  height: 60,
                  //color: Color.fromARGB(255, 223, 219, 219),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        Color.fromARGB(255, 223, 219, 219),
                        Color.fromARGB(255, 223, 219, 219)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10),
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF004B5B),
                            minimumSize: Size(170, 40),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: Text("Disconnect",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)))
                    ],
                  ),
                ),
                SizedBox(height: 55),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(280, 50),
                      backgroundColor: Color(0xFF004B5B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text("Log Out",
                        style: TextStyle(color: Colors.white, fontSize: 23)))
              ])),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isRecording = !_isRecording;
            // Logika untuk memulai atau menghentikan perekaman suara
            // bisa ditambahkan di sini
          });
        },
        shape: CircleBorder(),
        child: Icon(
          _isRecording ? Icons.mic_off : Icons.mic,
          color: _isRecording ? Colors.red : Color(0xFF004B5B),
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF004B5B),
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.person, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfilePage(),
  ));
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const MainPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.1);
      const end = Offset.zero;
      const curve = Curves.easeOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tesajahh/profile.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  bool _lights = false;
  double _currentValue = 25.0;
  String _selectedOption = 'Kipas 1';
  bool _isRecording = false;

  @override
  void initState() {
    super.initState();
  }

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
        backgroundColor: Color(0xFF004B5B),
        title: Center(
          child: Text(
            'Home',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 30.0,
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.normal,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: <Widget>[
              SizedBox(
                height: 70,
                width: 20,
              ),
              Switch.adaptive(
                value: _lights,
                onChanged: (bool value) {
                  setState(() {
                    _lights = value;
                  });
                },
              ),
              Text(
                'Auto',
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularSlider(
                  currentValue: _currentValue,
                  onChanged: (double value) {
                    setState(() {
                      _currentValue = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                        width: 100,
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey),
                        child: Center(
                          child: Padding(
                              padding: EdgeInsets.all(
                                  8.0), // Sesuaikan dengan kebutuhan Anda
                              child: Text(
                                'Suhu Didalam $_selectedOption',
                                style: TextStyle(fontSize: 14),
                              )),
                        )),
                    SizedBox(width: 30),
                    Container(
                      width: 100,
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey),
                      child: Center(
                          child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Suhu Diluar $_selectedOption',
                                style: TextStyle(fontSize: 14),
                              ))),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                        width: 100,
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey),
                        child: Center(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Kecepatan $_selectedOption',
                            style: TextStyle(fontSize: 14),
                          ),
                        ))),
                  ],
                ),
                SizedBox(height: 10),
                DropdownButton<String>(
                  value: _selectedOption,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedOption = newValue!;
                    });
                  },
                  items: <String>[
                    'Kipas 1',
                    'Kipas 2',
                    'Kipas 3',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
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
              onPressed: () {},
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

class CircularSlider extends StatefulWidget {
  final double currentValue;
  final ValueChanged<double> onChanged;

  const CircularSlider({
    Key? key,
    required this.currentValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CircularSliderState createState() => _CircularSliderState();
}

class _CircularSliderState extends State<CircularSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      height: 200.0,
      child: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            RenderBox renderBox = context.findRenderObject() as RenderBox;
            Offset localPosition =
                renderBox.globalToLocal(details.globalPosition);
            double angle =
                atan2(localPosition.dy - 100, localPosition.dx - 100);
            double degrees = angle * (180 / pi);
            if (degrees < 0) {
              degrees += 360;
            }
            widget.onChanged((degrees / 360) * 100);
          });
        },
        child: CustomPaint(
          painter: CircularSliderPainter(progress: widget.currentValue),
          child: Center(
              child: Column(children: [
            SizedBox(
              height: 75,
            ),
            Text('fan speed'),
            Text(
              '${widget.currentValue.toInt()}%',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ])),
        ),
      ),
    );
  }
}

class CircularSliderPainter extends CustomPainter {
  final double progress;

  CircularSliderPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Paint outerCirclePaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 12.0
      ..style = PaintingStyle.stroke;

    Paint progressCirclePaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 12.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double radius = size.width / 2;

    canvas.drawCircle(Offset(radius, radius),
        radius - outerCirclePaint.strokeWidth / 2, outerCirclePaint);

    double sweepAngle = 360 * (progress / 100);
    canvas.drawArc(
        Rect.fromCircle(
            center: Offset(radius, radius),
            radius: radius - progressCirclePaint.strokeWidth / 2),
        -pi / 2,
        (sweepAngle * pi / 180),
        false,
        progressCirclePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const ProfilePage(),
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

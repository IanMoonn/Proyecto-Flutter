import 'dart:html';

import 'package:flutter/material.dart';
import 'package:login_ui/pantallacarta.dart';
import 'dart:async';


class PantallaInicio extends StatefulWidget {

  @override
  _PantallaInicioState createState() => _PantallaInicioState();
}
class _PantallaInicioState extends State<PantallaInicio> with SingleTickerProviderStateMixin {
  late Timer _timer;
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );
  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (BuildContext) => PantallaCarta()
          )
      );
    });

  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Container(
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Align(
                alignment: FractionalOffset.bottomRight,
                child: Container(
                  padding: const EdgeInsets.only(right: 15, left: 5, top: 50, bottom: 50),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(200)
                    )
                  ),
                  child: const RotatedBox(
                    quarterTurns: 3,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: const Text("Los Mejores Productos para ti.", style: TextStyle(
                        color: Colors.amberAccent,
                        fontStyle: FontStyle.italic,
                        fontSize: 20,
                        letterSpacing: 5,
                      ),),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: ScaleTransition(
                    scale: _animation,
                    child: Image.asset(
                      '../img/sena.png',
                      width: MediaQuery.of(context).size.width / 2,
                      height: 200,
                    ),
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.only(top: 100),
                ),
                MaterialButton(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20.0),
                    color: Colors.red,
                    onPressed: (){
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (BuildContext) => PantallaCarta()
                          )
                      );
                    },
                    child: const Icon(
                      Icons.add_business,
                      color: Colors.white,
                    )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

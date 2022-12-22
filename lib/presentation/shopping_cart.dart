import 'package:flutter/material.dart';
import 'lista_productos.dart';
import 'package:url_launcher/url_launcher.dart';

class Carrito extends StatefulWidget {
  final List<ListaProductos> _cart;
  const Carrito(this._cart,  {super.key});

  @override
  State<Carrito> createState() => _CarritoState(this._cart);
}

class _CarritoState extends State<Carrito> {
  _CarritoState(this._cart);

  List<ListaProductos> _cart;


  var deah = 0;
  var deah1 = 0;
  var deah2 = 0;
  var deah3 = 0;
  var deah4 = 0;
  var deah5 = 0;
  var subtotal = 0;

  var subpro = 0;
  var subpro1 = 0;
  var subpro2 = 0;
  var subpro3 = 0;
  var subpro4 = 0;

  var iva = 0;
  var total = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Detalles del producto',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.of(context).pop();
            setState(() {
              _cart.length;
            });
          },
          color: Colors.white,
        ),
      ),
      body: GestureDetector(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _cart.length,
                itemBuilder: (context, index){
                  return Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 9
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 70,
                              height: 70,
                              child: Image(
                                image: NetworkImage(
                                  _cart[index].imageURL.toString()
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 8,
                                        right: 8
                                      ),
                                      child: Center(
                                        child: Text(
                                          _cart[index].nombre.toString(),
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            if (_cart[index].id.toInt() == 1) ...[
                              Row(
                                children: <Widget>[
                                  Column(
                                    children: [
                                      Text('Precio c/u: $subpro        ')
                                    ]
                                  ),
                                  GestureDetector(
                                    child: Container(
                                      width: 20.0,
                                      height: 20.0,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                        BorderRadiusDirectional
                                            .circular(4.0),
                                      ),
                                      child: const Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                        size: 15.0,
                                      ),
                                    ),
                                    onTap: () {
                                      restar();
                                    },
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: Text(
                                      '$deah',
                                      style: TextStyle(
                                          fontWeight:
                                          FontWeight.bold,
                                          fontSize: 15.0),
                                    ),
                                  ),
                                  GestureDetector(
                                    child: Container(
                                      width: 20.0,
                                      height: 20.0,
                                      decoration: BoxDecoration(
                                        color: Colors.amberAccent,
                                        borderRadius:
                                        BorderRadiusDirectional
                                            .circular(4.0),
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 15.0,
                                      ),
                                    ),
                                    onTap: () {
                                      anadir();
                                    },
                                  ),
                                ],
                              ),
                            ] else if(_cart[index].id.toInt() == 2)...[
                              Row(
                                children: <Widget>[
                                  Column(
                                      children: [
                                        Text('Precio c/u: $subpro1        ')
                                      ]
                                  ),
                                  GestureDetector(
                                    child: Container(
                                      width: 20.0,
                                      height: 20.0,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                        BorderRadiusDirectional
                                            .circular(4.0),
                                      ),
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                        size: 15.0,
                                      ),
                                    ),
                                    onTap: () {
                                      restar1();
                                    },
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: Text(
                                      '$deah1',
                                      style: TextStyle(
                                          fontWeight:
                                          FontWeight.bold,
                                          fontSize: 15.0),
                                    ),
                                  ),
                                  GestureDetector(
                                    child: Container(
                                      width: 20.0,
                                      height: 20.0,
                                      decoration: BoxDecoration(
                                        color: Colors.amberAccent,
                                        borderRadius:
                                        BorderRadiusDirectional
                                            .circular(4.0),
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 15.0,
                                      ),
                                    ),
                                    onTap: () {
                                      anadir1();
                                    },
                                  ),
                                ],
                              ),
                            ] else if(_cart[index].id.toInt() == 3)...[
                              Row(
                                children: <Widget>[
                                  Column(
                                      children: [
                                        Text('Precio c/u: $subpro2        ')
                                      ]
                                  ),
                                  GestureDetector(
                                    child: Container(
                                      width: 20.0,
                                      height: 20.0,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                        BorderRadiusDirectional
                                            .circular(4.0),
                                      ),
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                        size: 15.0,
                                      ),
                                    ),
                                    onTap: () {
                                      restar2();
                                    },
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: Text(
                                      '$deah2',
                                      style: TextStyle(
                                          fontWeight:
                                          FontWeight.bold,
                                          fontSize: 15.0),
                                    ),
                                  ),
                                  GestureDetector(
                                    child: Container(
                                      width: 20.0,
                                      height: 20.0,
                                      decoration: BoxDecoration(
                                        color: Colors.amberAccent,
                                        borderRadius:
                                        BorderRadiusDirectional
                                            .circular(4.0),
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 15.0,
                                      ),
                                    ),
                                    onTap: () {
                                      anadir2();
                                    },
                                  ),
                                ],
                              ),
                            ] else if(_cart[index].id.toInt() == 4)...[
                              Row(
                                children: <Widget>[
                                  Column(
                                      children: [
                                        Text('Precio c/u: $subpro3        ')
                                      ]
                                  ),
                                  GestureDetector(
                                    child: Container(
                                      width: 20.0,
                                      height: 20.0,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                        BorderRadiusDirectional
                                            .circular(4.0),
                                      ),
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                        size: 15.0,
                                      ),
                                    ),
                                    onTap: () {
                                      restar3();
                                    },
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: Text(
                                      '$deah3',
                                      style: TextStyle(
                                          fontWeight:
                                          FontWeight.bold,
                                          fontSize: 15.0),
                                    ),
                                  ),
                                  GestureDetector(
                                    child: Container(
                                      width: 20.0,
                                      height: 20.0,
                                      decoration: BoxDecoration(
                                        color: Colors.amberAccent,
                                        borderRadius:
                                        BorderRadiusDirectional
                                            .circular(4.0),
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 15.0,
                                      ),
                                    ),
                                    onTap: () {
                                      anadir3();
                                    },
                                  ),

                                ],
                              ),
                            ] else if(_cart[index].id.toInt() == 5)...[
                              Row(
                                children: <Widget>[
                                  Column(
                                      children: [
                                        Text('Precio c/u: $subpro4        ')
                                      ]
                                  ),
                                  GestureDetector(
                                    child: Container(
                                      width: 20.0,
                                      height: 20.0,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                        BorderRadiusDirectional
                                            .circular(4.0),
                                      ),
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                        size: 15.0,
                                      ),
                                    ),
                                    onTap: () {
                                      restar4();
                                    },
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: Text(
                                      '$deah4',
                                      style: TextStyle(
                                          fontWeight:
                                          FontWeight.bold,
                                          fontSize: 15.0),
                                    ),
                                  ),
                                  GestureDetector(
                                    child: Container(
                                      width: 20.0,
                                      height: 20.0,
                                      decoration: BoxDecoration(
                                        color: Colors.amberAccent,
                                        borderRadius:
                                        BorderRadiusDirectional
                                            .circular(4.0),
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 15.0,
                                      ),
                                    ),
                                    onTap: () {
                                      anadir4();
                                    },
                                  ),


                                ],
                              ),
                            ] else if(index == 5)...[
                              Row(
                                children: <Widget>[
                                  GestureDetector(
                                    child: Container(
                                      width: 20.0,
                                      height: 20.0,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                        BorderRadiusDirectional
                                            .circular(4.0),
                                      ),
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                        size: 15.0,
                                      ),
                                    ),
                                    onTap: () {
                                      restar5();
                                    },
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: Text(
                                      '$deah5',
                                      style: TextStyle(
                                          fontWeight:
                                          FontWeight.bold,
                                          fontSize: 15.0),
                                    ),
                                  ),
                                  GestureDetector(
                                    child: Container(
                                      width: 20.0,
                                      height: 20.0,
                                      decoration: BoxDecoration(
                                        color: Colors.amberAccent,
                                        borderRadius:
                                        BorderRadiusDirectional
                                            .circular(4.0),
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 15.0,
                                      ),
                                    ),
                                    onTap: () {
                                      anadir5();
                                    },
                                  ),
                                  Row(
                                    children: [
                                      Text('PrecioUnit: $subtotal')
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
              Container(
                width: 500,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[200],
                ),
                  child: Column(
                    children: [
                      Text('Subtotal $subtotal'),
                      Text('Iva $iva'),
                      Text('Total $total')
                    ],
                  )
                  
              ),
              
            ],
          ),

        ),
      ),
    );
  }


void anadir() {
    setState(() {
      deah = deah + 1;
      subtotal = subtotal + 40000;
      subpro = subpro + 40000;
      iva = (subtotal * 0.20) as int;
      total = iva + subtotal;
    });
  }

  void restar() {
    setState(() {
      if (deah != 0) {
        deah = deah - 1;
        subtotal = subtotal - 40000;
        subpro = subpro - 40000;
        iva = (subtotal * 0.20) as int;
        total = iva + subtotal;
      }
    });
  }

  void anadir1() {
    setState(() {
      deah1 = deah1 + 1;
      subtotal = subtotal + 16500;
      subpro1 = subpro1 + 16500;
      iva = (subtotal * 0.20) as int;
      total = iva + subtotal;
    });
  }

  void restar1() {
    setState(() {
      if (deah1 != 0) {
        deah1 = deah1 - 1;
        subtotal = subtotal - 16500;
        subpro1 = subpro1 - 16500;
        iva = (subtotal * 0.20) as int;
        total = iva + subtotal;
      }
    });
  }

  void anadir2() {
    setState(() {
      deah2 = deah2 + 1;
      subtotal = subtotal + 11750;
      subpro2 = subpro2 + 11750;
      iva = (subtotal * 0.20) as int;
      total = iva + subtotal;
    });
  }

  void restar2() {
    setState(() {
      if (deah2 != 0) {
        deah2 = deah2 - 1;
        subtotal = subtotal - 11750;
        subpro2 = subpro2 - 11750;
        iva = (subtotal * 0.20) as int;
        total = iva + subtotal;
      }
    });
  }

  void anadir3() {
    setState(() {
      deah3 = deah3 + 1;
      subtotal = subtotal + 8900;
      subpro3 = subpro3 + 8900;
      iva = (subtotal * 0.20) as int;
      total = iva + subtotal;
    });
  }

  void restar3() {
    setState(() {
      if (deah3 != 0) {
        deah3 = deah3 - 1;
        subtotal = subtotal - 8900;
        subpro3 = subpro3 - 8900;
        iva = (subtotal * 0.20) as int;
        total = iva + subtotal;
      }
    });
  }

  void anadir4() {
    setState(() {
      deah4 = deah4 + 1;
      subtotal = subtotal + 17000;
      subpro4 = subpro4 + 17000;
      iva = (subtotal * 0.20) as int;
      total = iva + subtotal;

    });
  }

  void restar4() {
    setState(() {
      if (deah4 != 0) {
        deah4 = deah4 - 1;
        subtotal = subtotal - 17000;
        subpro4 = subpro4 - 17000;
        iva = (subtotal * 0.20) as int;
        total = iva + subtotal;
      }

    });
  }

  void anadir5() {
    setState(() {
      deah5 = deah5 + 1;
    });
  }

  void restar5() {
    setState(() {
      if (deah5 != 0) deah5 = deah5 - 1;
    });
  }

}


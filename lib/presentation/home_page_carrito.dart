import '../constants.dart';
import 'package:flutter/material.dart';
import 'shopping_cart.dart' show Carrito;

import 'lista_productos.dart';


class HomePageCarrito extends StatefulWidget {
  const HomePageCarrito({Key? key}) : super(key: key);

  @override
  State<HomePageCarrito> createState() => _HomePageCarritoState();
}

class _HomePageCarritoState extends State<HomePageCarrito> {
  List<ListaProductos> _productosModel = <ListaProductos>[];

  final List<ListaProductos> _listaCarro = <ListaProductos>[];

  @override
  void initState(){

    super.initState();
    _productos();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: ListView.builder(
        itemCount: _productosModel.length,
        itemBuilder: (context, index){
          var item = _productosModel[index];
          return SizedBox(
              width: 200,
              height: 200,
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                margin: const EdgeInsets.all(15),
                elevation: 10,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: Image(
                          image: NetworkImage(
                            _productosModel[index].imageURL.toString()
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
                                    right: 8,
                                  ),
                                  child: Text(
                                    _productosModel[index].nombre.toString(),
                                    style: const TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8,
                                    right: 8
                                  ),
                                  child:
                                  Text(_productosModel[index].precio.toString()),
                                ),
                              ],
                            ),
                          )),
                      IconButton(
                        onPressed: (){
                          setState(() {
                            if (!_listaCarro.contains(item)){
                              _listaCarro.add(item);
                            } else {
                              _listaCarro.remove(item);
                            }
                          });
                        },
                        icon: (!_listaCarro.contains(item))
                              ? const Icon(Icons.shopping_cart)
                              : const Icon(
                                Icons.shopping_cart_checkout,
                          color: Colors.green,
                        ),
                      )
                    ],
                  ),
                ),
          )
          );
        },

      ),

    );
  }
  void _productos (){
    var list = <ListaProductos>[
      ListaProductos(
        nombre: 'Pizza familiar 3 carnes',
        precio:  40000,
        imageURL: 'img/pizza.png',
        id: 1,
        isAdd: false
      ),
      ListaProductos(
          nombre: 'Hamburguesa',
          precio:  16500,
          imageURL: 'img/hamburguesa.png',
          id: 2,
          isAdd: false
      ),
      ListaProductos(
          nombre: 'Salchipapas',
          precio:  11750,
          imageURL: 'img/salchipapas.png',
          id: 3,
          isAdd: false
      ),
      ListaProductos(
          nombre: 'Perro Caliente',
          precio:  8900,
          imageURL: 'img/perrito.png',
          id: 4,
          isAdd: false
      ),
      ListaProductos(
          nombre: 'Lasaña',
          precio:  17000,
          imageURL: 'img/lasaña.png',
          id: 5,
          isAdd: false
      ),
    ];
    _productosModel = list;
  }
}

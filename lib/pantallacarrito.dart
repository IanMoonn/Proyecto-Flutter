import 'dart:developer';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package/flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:login_ui/carrito/carrito.dart';
import 'dart:core';


class PantallaCarrito extends StatefulWidget {

  @override
  _PantallaCarritoState createState() => _PantallaCarritoState();
}

class _PantallaCarritoState extends State<PantallaCarrito> {
  var now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Consumer<Carrito>(builder:(context, carrito, child){
        return Scaffold(
          backgroundColor: Colors.grey,
          appBar: AppBar(
            title: Text('PEDIDOS'),
            elevation: 0,
            backgroundColor: Colors.teal,
          ),
          body: Container(
            child: carrito.numeroItems == 0 
            ? Center(
                child: Text('Carrito Vacio'),
              ) 
            : Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                for(var item in carrito.items.values)
                Card(
                    margin: EdgeInsets.all(10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                            Image.asset('../../img'+item.imagen,width: 125,),
                            Expanded(
                                child: Container(
                                    padding: EdgeInsets.all(5),
                                    height: 100,
                                    child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                            Text(item.nombre),
                                            Text('S/.'+item.precio.toString() + 'x' + item.unidad),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.max,
                                                children: <Widget>[
                                                    Container(
                                                        child: IconButton(
                                                            icon: Icon(Icons.remove_circle_outline_outlined, size: 30, color: Colors.red,),
                                                            onPressed: (){
                                                                setState((){
                                                                    carrito.decrementarCantidadItem(item.id);
                                                                });
                                                            },
                                                        ),
                                                        width: 50,
                                                        height:50,
                                                    ),
                                                    Container(
                                                        width: 20,
                                                        child: Center(child: Text(item.cantidad.toString()),),
                                                    ),
                                                    Container(
                                                        child: IconButton(
                                                            icon: Icon(Icons.add_circle_outline_outlined, size: 30, color: Colors.green,),
                                                            onPressed: (){
                                                                setState((){
                                                                    carrito.incrementarCantidadItem(item.id);
                                                                });
                                                            },
                                                        ),
                                                        width: 50,
                                                        height:50,
                                                    ),
                                                ]
                                            )
                                        ]
                                    )
                                )
                            ),
                          Container(
                            height: 100,
                            width: 70,
                            decoration: BoxDecoration(
                                color: Color(0x99f0f0f0)
                            ),
                            child: Center(
                              child: Text('S/.'+(item.precio * item.cantidad).toString()),
                            ),
                          )

                        ]
                    )
                ),
                Padding(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                            Expanded(
                                child: Text('SUBTOTAL: S'+carrito.subTotal.toStringAsFixed(2),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                            ),
                        ],
                    ),
                ),
                Padding(
                    padding: EdgeInsets.all(15),
                    child: Row(
                        children: <Widget>[
                            Expanded(
                                child: Text('IMPUESTO: S'+carrito.impuesto.toStringAsFixed(2),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                            ),
                        ],
                    ),
                ),
                Padding(
                    padding: EdgeInsets.all(15),
                    child: Row(
                        children: <Widget>[
                            Expanded(
                                child: Text('Total: S'+carrito.total.toStringAsFixed(2),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                            ),
                        ],
                    ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
                String pedido = '';
                carrito.items.forEach((key, value) {
                    pedido = '$pedido' +
                        'Fecha y hora del pedido: $now '+
                    value.nombre +
                        '>>>>' +
                    ' CANTIDAD : '+
                    value.cantidad.toString() +
                        '---------------------------------------------------' +
                    ' PRECIO UNITARIO : '+
                    value.precio.toString() +
                        '---------------------------------------------------' +
                    ' PRECIO TOTAL : '+ 
                    (value.cantidad * value.precio).toStringAsFixed(2) +
                        '---------------------------------------------------';
                });
                pedido = '$pedido' + '---------------------------------------------------';
                pedido = '$pedido' + 'SUBTOTAL:'+carrito.subTotal.toStringAsFixed(2)+'/n';
                pedido = '$pedido' + '---------------------------------------------------';
                pedido = '$pedido' + 'IMPUESTO:'+carrito.impuesto.toStringAsFixed(2)+'/n';
                pedido = '$pedido' + '---------------------------------------------------';
                pedido = '$pedido' + 'TOTAL:'+carrito.total.toStringAsFixed(2)+'/n';
              // Vincular a Whatsapp//
                String celular = "3124862888";
                String mensaje = pedido;
                Uri _url = Uri.parse("https://wa.me/$celular?text=$mensaje");
                if (await canLaunchUrl(_url)) {
                await launchUrl(_url);

                carrito.removeCarrito();
                }else{
                throw ('No se pudo realiziar la accion');
                }

            },
            backgroundColor: Colors.greenAccent,
            child: Icon(Icons.whatsapp,color: Colors.green,),
          ),
        );
    });
  }
}
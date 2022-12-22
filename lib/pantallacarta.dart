import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/auth/main_page.dart';
import 'package:login_ui/pages/login_page.dart';
import 'package:provider/provider.dart';
import 'package:login_ui/carrito/carrito.dart';
import 'package:login_ui/model/carta.dart';
import 'package:login_ui/pantallacarrito.dart';
import 'package:login_ui/pantallainicio.dart';

class PantallaCarta extends StatefulWidget {
  @override
  _PantallaCartaState createState() => _PantallaCartaState();
}
var tilePadding = const EdgeInsets.only(left: 8.0, right: 8, top: 8);
 class _PantallaCartaState extends State<PantallaCarta> {
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();
  late String _searchQuery = '';

  late List<Carta> _filteredCartaList;

  @override
  void initState() {
    super.initState();

    _filteredCartaList = [];
  }
  List<Carta> _filterCartaList(String query, List<Carta> cartaList) {
    if (query.isEmpty) {
      return cartaList;
    }

    query = query.toLowerCase();
    return cartaList.where((carta) => carta.nombre.toLowerCase().contains(query)).toList();
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<Carrito>(builder:(context, carrito, child){
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: _globalKey,
        backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        title: Expanded(
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.greenAccent),
                borderRadius: BorderRadius.circular(50.0),),
              hintText: 'Buscar',
            ),
            onChanged: (value) {
              setState(() {
                _searchQuery = value;
                _filteredCartaList = _filterCartaList(_searchQuery, principal);
              });
            },

          ),
        ),

        backgroundColor: Colors.teal,
        elevation: 0,
        bottom: TabBar(
          labelColor: Colors.white,
          indicatorColor: Colors.red,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: <Widget>[
            new Tab(
              child: Padding(
                padding: EdgeInsets.only(left: 5, right:5),
                child: Text("Principal"),
              ),
            ),
            new Tab(
              child: Padding(
                padding: EdgeInsets.only(left: 5, right:5),
                child: Text("Lacteos"),
              ),
            ),
            new Tab(
              child: Padding(
                padding: EdgeInsets.only(left: 5, right:5),
                child: Text("Postres"),
              ),
            )
          ],
        ),
        actions: <Widget>[
          new Stack(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.shopping_cart), 
                onPressed: () {
                  carrito.numeroItems!=0 ?
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext) => PantallaCarrito()
                  ))
                      :
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Llenar el carrito', textAlign: TextAlign.center,),
                  ));
                }
              ),
              new Positioned(
                top: 6,
                right: 6,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: new BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(4)),
                  constraints: BoxConstraints(
                      minWidth: 14,
                      minHeight: 14
                  ),
                  child: Text(
                    carrito.numeroItems.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize:10
                    ),
                  ),
                )
              )
            ],
          )
        ],
      ),
      drawer: menuLateral(),
      body: Builder(builder: (context) {
    return _searchQuery.isEmpty
    ? TabBarView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: GridView.builder(
              itemCount: principal.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height /1.15),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 2
                ),
                itemBuilder: (context, index){
                  return Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow:[
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 30,
                          offset: Offset(10, 10)
                        )
                      ]
                    ),
                    child: Column(
                      children: <Widget> [
                        Image.asset('assets/img/'+principal[index].imagen),
                        Text(principal[index].nombre,),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text('S/.'+principal[index].precio.toString(),style: TextStyle(fontSize: 15),)
                        ),
                        ElevatedButton.icon(
                          onPressed: (){
                            setState((){
                              carrito.agregarItem(
                                principal[index].id.toString(),
                                principal[index].nombre,
                                principal[index].precio,
                                '1',
                                principal[index].imagen,
                                1
                                );
                            });
                          },
                          icon: Icon(Icons.add_shopping_cart),
                          label: Text('Agregar'),
                        )
                      ],
                    ),
                  );
                }
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: GridView.builder(
              itemCount: Lacteos.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height /1.15),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 2
                ),
                itemBuilder: (context, index){
                  return Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow:[
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 30,
                          offset: Offset(10, 10)
                        )
                      ]
                    ),
                    child: Column(
                      children: <Widget> [
                        Image.asset('assets/img/'+Lacteos[index].imagen),
                        Text(Lacteos[index].nombre),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text('S/.'+Lacteos[index].precio.toString(),style: TextStyle(fontSize: 15),)
                        ),
                        ElevatedButton.icon(
                          onPressed: (){
                            setState((){
                              carrito.agregarItem(
                                Lacteos[index].id.toString(),
                                Lacteos[index].nombre,
                                Lacteos[index].precio,
                                '1',
                                Lacteos[index].imagen,
                                1
                                );
                            });
                          },
                          icon: Icon(Icons.add_shopping_cart),
                          label: Text('Agregar'),
                        )
                      ],
                    ),
                  );
                }
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: GridView.builder(
              itemCount: postres.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height /1.15),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 2
                ),
                itemBuilder: (context, index){
                  return Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow:[
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 30,
                          offset: Offset(10, 10)
                        )
                      ]
                    ),
                    child: Column(
                      children: <Widget> [
                        Image.asset('assets/img/'+postres[index].imagen),
                        Text(postres[index].nombre,),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text('S/.'+postres[index].precio.toString(),style: TextStyle(fontSize: 15),)
                        ),
                        ElevatedButton.icon(
                          onPressed: (){
                            setState((){
                              carrito.agregarItem(
                                  postres[index].id.toString(),
                                  postres[index].nombre,
                                  postres[index].precio,
                                  '1',
                                  postres[index].imagen,
                                  1
                              );
                            });
                          },
                          icon: Icon(Icons.add_shopping_cart),
                          label: Text('Agregar'),
                        )

                      ],
                    ),
                  );
                }
            ),
          ),
          ],
        ): ListView.builder(
      itemCount: _filteredCartaList.length,
      itemBuilder: (context, index) {
        final carta = _filteredCartaList[index];
        return Card(
          child: Column(
            children: [
              Image.asset(carta.imagen),
              ListTile(
                title: Text(carta.nombre),
                subtitle: Text('${carta.precio.toString()}'),
              ),
              TextButton.icon(
                onPressed: () {
                  setState((){
                    carrito.agregarItem(
                        principal[index].id.toString(),
                        principal[index].nombre,
                        principal[index].precio,
                        '1',
                        principal[index].imagen,
                        1
                    );
                  });
                },
                icon: Icon(Icons.add_shopping_cart),
                label: Text('Agregar'),
              ),
            ],
          ),
        );
      },
    );
      },
      ),
      ),
    );
    });
  }
}
class menuLateral extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
     child: ListView(
      children: <Widget>[
       UserAccountsDrawerHeader(
        accountName: Text("SENA"),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("img/logo.jpg"),
                fit: BoxFit.fill
            ),
          color: Colors.green
        ), accountEmail: null,
       ),
      InkWell(
        child: const ListTile(
          title: Text("INICIO", style: TextStyle(color: Colors.red),),
          leading: Icon(Icons.home, color: Colors.black,),
        ),
        onTap:(){
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext) => PantallaInicio() 
            )
          );
        },
       ),
      InkWell(
        child: const ListTile(
          title: Text("CARTA", style: TextStyle(color: Colors.red),),
          leading: Icon(Icons.airplay, color: Colors.black,),
        ),
        onTap:(){
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext) => PantallaCarta()
            )
          );
        },
       ),
      InkWell(
        child: const ListTile(
          title: Text("CARRITO", style: TextStyle(color: Colors.red),),
          leading: Icon(Icons.add_shopping_cart, color: Colors.black,),
        ),
        onTap:(){
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext) => PantallaCarrito()
          ));
        },
       ),
      InkWell(
        child: const ListTile(
          title: Text("LACTEOS", style: TextStyle(color: Colors.red),),
          leading: Icon(Icons.food_bank_outlined, color: Colors.black,),
        ),
        onTap:(){

        },
       ),
      InkWell(
        child: const ListTile(
          title: Text("POSTRES", style: TextStyle(color: Colors.red),),
          leading: Icon(Icons.food_bank, color: Colors.black,),
        ),
        onTap:(){

        },
       ),
      InkWell(
        child: const ListTile(
          title: Text("VER MAS", style: TextStyle(color: Colors.red),),
          leading: Icon(Icons.add, color: Colors.black,),
        ),
        onTap:(){

        },
       ),
      InkWell(
        child: const ListTile(
          title: Text("CUENTA", style: TextStyle(color: Colors.red),),
          leading: Icon(Icons.account_circle_outlined, color: Colors.black,),
        ),
        onTap:(){

        },
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
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (BuildContext) => MainPage()
                          )
                      );
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
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (BuildContext) => MainPage()
                          )
                      );
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
  }
}
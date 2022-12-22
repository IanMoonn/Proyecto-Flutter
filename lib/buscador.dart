import 'package:flutter/material.dart';
import 'model/carta.dart';




class buscador extends StatefulWidget {
  const buscador({Key? key}) : super(key: key);

  @override
  State<buscador> createState() => _buscadorState();

}

class _buscadorState extends State<buscador> {
  late String _searchQuery;

  // Declare a list to store the filtered list of Carta objects
  late List<Carta> _filteredCartaList;

  @override
  void initState() {
    super.initState();

    // Initialize the filtered list with an empty list
    _filteredCartaList = [];
  }
  List<Carta> _filterCartaList(String query, List<Carta> cartaList) {
    if (query.isEmpty) {
      return cartaList;
    }

    // Convert the search query and the nombre field to lowercase
    query = query.toLowerCase();
    return cartaList.where((carta) => carta.nombre.toLowerCase().contains(query)).toList();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buscador'),
      ),
      body: Column(
        children: [
          // TextField for the user to enter their search query
          TextField(
            onChanged: (value) {
              // Update the search query variable as the user types
              setState(() {
                _searchQuery = value;
                // Perform the search with the current search query
                _filteredCartaList = _filterCartaList(_searchQuery, principal);
              });
            },
          ),
          // Button to clear the search query
          TextButton(
            onPressed: () {
              // Clear the search query and reset the filtered list to an empty list
              setState(() {
                _searchQuery = '';
                _filteredCartaList = [];
              });
            },
            child: Text('Borrar'),
          ),
          // ListView to display the filtered list of Carta objects
          Expanded(
            child: ListView.builder(
              itemCount: _filteredCartaList.length,
              itemBuilder: (context, index) {
                final carta = _filteredCartaList[index];
                return Card(
                  child: Column(
                    children: [
                      // Display the image
                      Image.asset(carta.imagen),
                      // Display the name and price
                      ListTile(
                        title: Text(carta.nombre),
                        subtitle: Text('${carta.precio.toString()}'),
                      ),
                      // Display the "Add to Cart" button with a shopping cart icon
                      TextButton.icon(
                        onPressed: () {
                          // Add the item to the cart
                        },
                        icon: Icon(Icons.add_shopping_cart),
                        label: Text('Añadir al carrito'),
                      ),
                    ],
                  ),
                );
              },
            ),
          )

        ],
      ),
    );
  }
}


class Carta{
  final int id;
  final String nombre;
  final double precio;
  final String imagen;
  final String descripcion;

  const Carta({required this.id,required this.nombre,required this.precio,required this.imagen,required this.descripcion});
}
final principal =[
  new Carta(id: 1, nombre:"Queso", precio: 20000, imagen: "../../img/queso.jpg", descripcion: "Preparado.." ),
  new Carta(id: 2, nombre:"Mora", precio: 30000, imagen: "../../img/mora.jpg", descripcion: "Preparado.." ),
  new Carta(id: 3, nombre:"Postre", precio: 10000, imagen: "../../img/postre.jpg", descripcion: "Preparado.." ),
  new Carta(id: 4, nombre:"Leche", precio: 5000, imagen: "../../img/leche.jpg", descripcion: "Preparado.." ),
  new Carta(id: 5, nombre:"Mazorca", precio: 7000, imagen: "../../img/mazorca.jpg", descripcion: "Preparado.." ),
  new Carta(id: 6, nombre:"Zanahoria", precio: 15000, imagen: "../../img/zanahoria.jpg", descripcion: "Preparado.." ),
  new Carta(id: 7, nombre:"Arveja", precio: 12000, imagen: "../../img/arveja.jpg", descripcion: "Preparado.." ),
  new Carta(id: 8, nombre:"Tulipan", precio: 9000, imagen: "../../img/tulipan.jpg", descripcion: "Preparado.." ),
];

final Lacteos =[
  new Carta(id: 9, nombre:"Queso", precio: 20000, imagen: "../../img/queso.jpg", descripcion: "Preparado.." ),
  new Carta(id: 10, nombre:"Leche", precio: 5000, imagen: "../../img/leche.jpg", descripcion: "Preparado.." ),
];

final postres =[
  new Carta(id: 11, nombre:"Fresas con crema", precio: 2000, imagen: "../../img/fresasconcrema.jpg", descripcion: "Preparado.." ),
  new Carta(id: 12, nombre:"Helado", precio: 7000, imagen: "../../img/helado.jpg", descripcion: "Preparado.." ),
  new Carta(id: 13, nombre:"Flan Maracuya", precio: 10000, imagen: "../../img/flan.jpg", descripcion: "Preparado.." ),
  new Carta(id: 14, nombre:"Fresas", precio: 5000, imagen: "../../img/fresa.jpg", descripcion: "Preparado.." ),
];
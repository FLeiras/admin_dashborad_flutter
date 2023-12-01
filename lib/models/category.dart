class Categoria {
  final String id;
  String nombre;
  final _Usuario usuario;

  Categoria({
    required this.id,
    required this.nombre,
    required this.usuario,
  });

  factory Categoria.fromMap(Map<String, dynamic> json) => Categoria(
        id: json["_id"],
        nombre: json["nombre"],
        usuario: _Usuario.fromMap(json["usuario"]),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "nombre": nombre,
        "usuario": usuario.toMap(),
      };

  @override
  String toString() {
    return 'Categoria: ${this.nombre}';
  }
}

class _Usuario {
  final String id;
  final String nombre;

  _Usuario({
    required this.id,
    required this.nombre,
  });

  factory _Usuario.fromMap(Map<String, dynamic> json) => _Usuario(
        id: json["_id"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "nombre": nombre,
      };
}

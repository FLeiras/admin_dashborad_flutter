import 'dart:convert';

import 'package:admin_dashboard/models/category.dart';

CategoriesResponse categoriesResponseFromMap(String str) =>
    CategoriesResponse.fromMap(json.decode(str));

String categoriesResponseToMap(CategoriesResponse data) =>
    json.encode(data.toMap());

class CategoriesResponse {
  final int total;
  final List<Categoria> categorias;

  CategoriesResponse({
    required this.total,
    required this.categorias,
  });

  factory CategoriesResponse.fromMap(Map<String, dynamic> json) =>
      CategoriesResponse(
        total: json["total"],
        categorias: List<Categoria>.from(
            json["categorias"].map((x) => Categoria.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "total": total,
        "categorias": List<dynamic>.from(categorias.map((x) => x.toMap())),
      };
}

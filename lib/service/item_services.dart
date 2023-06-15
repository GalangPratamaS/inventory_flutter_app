import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:inventory_flutter/model/response_barang.dart';
import 'package:inventory_flutter/model/response_crud.dart';
import 'auth_services.dart';

//  /server_inventory/index.php/

class ItemServices {

  Future<List<Barang>> getListBarang() async {
    final uri = Uri.http(host,"server_inventory/index.php/api/getBarang");
    final response = await http.get(uri);
    if(response.statusCode == 200) {
      final decode = jsonDecode(response.body);
      ResponseBarang responseBarang = ResponseBarang.fromJson(decode);
      List<Barang> listBarang = responseBarang.barang?? [];
      return listBarang;
    } else {
      throw Exception('failed to load barang');
    }
  }

  Future<ResponseCrud?> insertBarang(String name, String amount, String urlImage) async {
    final uri = Uri.http(host, "server_inventory/index.php/api/insertBarang");
    final response = await http.post(uri,body: {
      "nama" : name,
      "jumlah" : amount,
      "gambar" : urlImage
    });
    if(response.statusCode == 200) {
      final decode = jsonDecode(response.body);
      ResponseCrud responseCrud = ResponseCrud.fromJson(decode);
      return responseCrud;      
    } else {
      throw Exception("Failed to insert barang");
    }
  }

  
  Future<ResponseCrud?>updateBarang(String id,String name, String amount, String urlImage) async {
    final uri = Uri.http(host, "server_inventory/index.php/api/updateBarang");
    final response = await http.post(uri,body: {
      "id" : id,
      "nama" : name,
      "jumlah" : amount,
      "gambar" : urlImage
    });
    if(response.statusCode == 200) {
      final decode = jsonDecode(response.body);
      ResponseCrud responseCrud = ResponseCrud.fromJson(decode);
      return responseCrud;      
    } else {
      throw Exception("Failed to update barang");
    }
  }


   Future<ResponseCrud?> deleteBarang(String id) async {
    final uri = Uri.http(host, "server_inventory/index.php/api/deleteBarang");
    final response = await http.post(uri,body: {
      "id" : id
    });
    if(response.statusCode == 200) {
      final decode = jsonDecode(response.body);
      ResponseCrud responseCrud = ResponseCrud.fromJson(decode);
      return responseCrud;      
    } else {
      throw Exception("Failed to delete barang");
    }
  }
  
  
}
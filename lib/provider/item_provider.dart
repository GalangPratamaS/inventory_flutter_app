import 'package:flutter/material.dart';
import 'package:inventory_flutter/model/response_barang.dart';
import 'package:inventory_flutter/model/response_crud.dart';
import 'package:inventory_flutter/service/item_services.dart';

class ItemProvider extends ChangeNotifier {
  // GET
  bool _isFetching = false;
  bool get isFetching => _isFetching;

  List<Barang> _listBarang = [];
  List<Barang> get ListBarang => _listBarang;

  //CRUD
  ResponseCrud? _responseCrud;
  ResponseCrud? get responseCrud => _responseCrud;

  List<Barang> _listSearchBarang = [];
  List<Barang> get listSearchBarang => _listSearchBarang;

  final ItemServices _itemServices = ItemServices();

  Future<void> getListBarang() async {
    _isFetching = true;
    notifyListeners();
    _listBarang = await _itemServices.getListBarang();
    _isFetching = false;
    notifyListeners();
  }

  Future insertBrang(String name, String amount, String urlImage) async {
    final response = await _itemServices.insertBarang(name, amount, urlImage);
    _responseCrud = response;

    Barang itemBarang = Barang(
        barangId: response!.lastId.toString(),
        barangNama: name,
        barangJumlah: amount,
        barangGambar: urlImage);
    _listBarang.add(itemBarang);
    notifyListeners();
  }

  ItemProvider() {
    getListBarang();
  }

  Future<void> deleteBarang(String id) async {
    final response = await _itemServices.deleteBarang(id);
    _responseCrud = response;
    _listBarang.removeWhere((itemBarang) => itemBarang.barangId == id);
    notifyListeners();
  }

  Future<void> updateBarang(
      String id, String name, String amount, String urlImage) async {
    final response =
        await _itemServices.updateBarang(id, name, amount, urlImage);
    _responseCrud = response;
    final index = _listBarang.indexWhere((barang) => barang.barangId == id);
    final updatedBarang = Barang(
      barangId: id,
      barangNama: name,
      barangJumlah: amount,
      barangGambar: urlImage,
    );
    _listBarang[index] = updatedBarang;
    notifyListeners();
  }

  void search(String keywords) {
    List<Barang> listSearch = [];
    if (keywords.isEmpty) {
      listSearch.clear();
      _listSearchBarang = listSearch;
    } else {
      for (var itemBarang in _listBarang) {
        if (itemBarang.barangNama!.toLowerCase().contains(keywords)) {
          listSearch.add(itemBarang);
        }
      }
      _listSearchBarang = listSearch;
    }
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:inventory_flutter/model/response_barang.dart';
import 'package:inventory_flutter/provider/item_provider.dart';
import 'package:inventory_flutter/ui/widgets/grid_item.dart';

import 'package:provider/provider.dart';

import 'form_page.dart';


class SearchPage extends StatelessWidget {
 static const String route = "/search";
 const SearchPage({super.key});

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Consumer<ItemProvider>(builder: (context, itemProvider, _) {
         return TextFormField(
           decoration: const InputDecoration(
               hintText: "Enter keywords...",
               filled: true,
               fillColor: Colors.white),
           onChanged: (value) {
             itemProvider.search(value);
           },
         );
       }),
     ),
     body: Consumer<ItemProvider>(builder: (context, itemProvider, _) {
       List<Barang> listBarang = itemProvider.listSearchBarang;
       if (listBarang.isNotEmpty) {
         return GridView.builder(
             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 2),
             itemCount: listBarang.length,
             itemBuilder: (context, index) {
               return InkWell(
                 splashColor: Colors.red,
                 borderRadius: BorderRadius.circular(10),
                 onTap: () {
                   final route = MaterialPageRoute(
                     builder: (context) => FormPage(
                       itemBarang: listBarang[index],
                     ),
                   );
                   Navigator.push(context, route);
                 },
                 child: GridItem(barang: listBarang[index]),
               );
             });
       } else {
         return const Center(child: Text("Search"));
       }
     }),
   );
 }
}



import 'package:flutter/material.dart';
import 'package:inventory_flutter/model/response_barang.dart';
import 'package:inventory_flutter/provider/item_provider.dart';
import 'package:inventory_flutter/ui/pages/form_page.dart';
import 'package:provider/provider.dart';

import 'grid_item.dart';

class GridList extends StatelessWidget {
  const GridList({super.key});

  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<ItemProvider>(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: itemProvider.isFetching
            ? const CircularProgressIndicator()
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: itemProvider.ListBarang.length,
                itemBuilder: (context, index) {
                  final barang = itemProvider.ListBarang[index];
                  return InkWell(
                    splashColor: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      final route = MaterialPageRoute(
                        builder: (context) => FormPage(
                          itemBarang: barang,
                        ),
                      );
                      Navigator.push(context, route);
                    },
                    child: GridItem(barang: barang),
                  );
                }),
      ),
    );
  }
}

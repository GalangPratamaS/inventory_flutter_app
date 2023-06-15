import 'package:flutter/material.dart';
import 'package:inventory_flutter/model/response_barang.dart';



class GridItem extends StatelessWidget {
 final Barang barang;
 const GridItem({super.key, required this.barang});

 @override
 Widget build(BuildContext context) {
   return Card(
     elevation: 2,
     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         ClipRRect(
           borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
           child: Image.network(
             barang.barangGambar ?? "https://liftlearning.com/wp-content/uploads/2020/09/default-image.png",
             height: 100,
             width: double.infinity,
             fit: BoxFit.cover,
           ),
         ),
         Expanded(
           child: Padding(
             padding: const EdgeInsets.only(left: 8.0),
             child: Column(
               mainAxisSize: MainAxisSize.max,
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text(
                   barang.barangNama ?? "",
                   style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                 ),
                 Text("${barang.barangJumlah} buah")
               ],
             ),
           ),
         )
       ],
     ),
   );
 }
}



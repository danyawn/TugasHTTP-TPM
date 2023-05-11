import 'package:flutter/material.dart';
import 'package:tugas_http/model/product.dart';

class DetailPage extends StatelessWidget {
  final Product product;
  const DetailPage({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(product.title),
          backgroundColor: Color.fromARGB(255, 37, 165, 42),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    product.image,
                    fit: BoxFit.cover,
                    width: 100,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child:
                      Text(product.title, style: const TextStyle(fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(product.description),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text("Harga Produk : ${product.price} USD"),
                ),
                Text("Rating Produk: ${product.rating.rate}"),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text("Rating Count : ${product.rating.count}"),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blueGrey),
                  ),
                  onPressed: () {
                    AlertDialog alertDialog = AlertDialog(
                      title: Text("Beli ${product.title}"),
                      content:
                          Text("Anda telah membeli Produk ${product.title}"),
                    );
                    showDialog(
                        context: context, builder: (context) => alertDialog);
                  },
                  child: const Text("Beli"),
                )
              ],
            ),
          ),
        ));
  }
}

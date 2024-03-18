import 'package:flutter/material.dart';

class SavdoTarixPage extends StatelessWidget {
  const SavdoTarixPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Savdo Tarix'),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Bugungi Savdo',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SavdoItem(
                date: 'Bugun',
                products: [
                  {'name': 'olmali', 'code': 'so\'k', 'price': '33200'},
                  {'name': 'olmal', 'code': '', 'price': '33322'},
                  {'name': 'nok', 'code': '', 'price': '33321'},
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SavdoItem extends StatelessWidget {
  final String date;
  final List<Map<String, String>> products;

  const SavdoItem({super.key, required this.date, required this.products});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            date,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.black12),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ListTile(
                title: Text('${product['name']} ${product['code']}'),
                subtitle: Text('Narxi: ${product['price']}'),
              );
            },
          ),
        )
      ],
    );
  }
}


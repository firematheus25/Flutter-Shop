import 'package:flutter/material.dart';
import 'package:shop/components/app_drawer.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Produto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nome'),
              textInputAction: TextInputAction.next,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Preço'),
              textInputAction: TextInputAction.next,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Descrição'),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.multiline,
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}

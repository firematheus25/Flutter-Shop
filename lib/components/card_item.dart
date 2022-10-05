import 'package:flutter/material.dart';

import '../models/cart_item.dart';

class CardItemWidget extends StatelessWidget {
  final CartItem cardItem;
  const CardItemWidget({super.key, required this.cardItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: EdgeInsets.all(5),
              child: FittedBox(
                child: Text('${cardItem.price}'),
              ),
            ),
          ),
          title: Text(cardItem.name),
          subtitle: Text('Total: R\$ ${cardItem.price * cardItem.quantity}'),
          trailing: Text('${cardItem.quantity}x'),
        ),
      ),
    );
  }
}

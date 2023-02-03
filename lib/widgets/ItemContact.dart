import 'package:flutter/material.dart';
import 'package:flutter_contacts/model/ContactItem.dart';

class ContactItemWidget extends StatelessWidget {
  final ContactItem contactItem;
  final Function(String) deleteItem;
  const ContactItemWidget(
      {super.key, required this.contactItem, required this.deleteItem});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
        child: ListTile(
          leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blueAccent,
              backgroundImage: NetworkImage(contactItem.imageUrl)),
          title: Text(contactItem.title,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          subtitle: Text(contactItem.number,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
          trailing: IconButton(
              onPressed: () => deleteItem(contactItem.userId),
              icon: const Icon(Icons.delete_outline)),
        ),
      ),
    );
  }
}

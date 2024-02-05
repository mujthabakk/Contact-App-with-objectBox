import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:objectboxcontact/controller/contact_providers.dart';
import 'package:objectboxcontact/model/contact_model.dart';
import 'package:objectboxcontact/view/widgets/showdialog.dart';

class Homepage extends ConsumerWidget {
  Homepage({super.key});
  final formkey = GlobalKey<FormState>();
  final name = TextEditingController();
  final phone = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contacts = ref.watch(contactProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text("Contacts"),
        ),
        body: CustomScrollView(
          slivers: [
            contacts.isEmpty
                ? const SliverFillRemaining(
                    child: Center(child: Text("Empty contacts")),
                  )
                : SliverList.builder(
                    itemCount: contacts.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          child: Text(contacts[index].name[0]),
                        ),
                        title: Text(contacts[index].name),
                        subtitle: Text(contacts[index].phoneNUmber),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () {
                                  name.text = contacts[index].name;
                                  phone.text = contacts[index].phoneNUmber;

                                  showDialog(
                                    context: context,
                                    builder: (context) => ContactDialog(
                                      isEdit: true,
                                      name: name,
                                      phone: phone,
                                      formKey: formkey,
                                      onPressed: () {
                                        if (formkey.currentState!.validate()) {
                                          ref
                                              .read(contactProvider.notifier)
                                              .putcontact(ContactModel(
                                                id: contacts[index].id,
                                                name: name.text,
                                                phoneNUmber: phone.text,
                                              ));
                                          name.clear();
                                          phone.clear();
                                          Navigator.pop(context);
                                        }
                                      },
                                    ),
                                  );
                                },
                                icon: Icon(Icons.edit_square)),
                            IconButton(
                              onPressed: () {
                                ref
                                    .read(contactProvider.notifier)
                                    .Remove(contacts[index].id);
                              },
                              icon: const Icon(Icons.delete_forever),
                            ),
                          ],
                        ),
                      );
                    },
                  )
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => ContactDialog(
                  name: name,
                  phone: phone,
                  formKey: formkey,
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      ref.read(contactProvider.notifier).putcontact(
                          ContactModel(
                              name: name.text, phoneNUmber: phone.text));
                      name.clear();
                      phone.clear();
                    }
                    Navigator.pop(context);
                  },
                ),
              );
            },
            label: Text("Add Contact")));
  }
}

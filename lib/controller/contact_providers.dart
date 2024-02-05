import 'package:objectboxcontact/model/contact_model.dart';
import 'package:objectboxcontact/objectbox.g.dart';
import 'package:objectboxcontact/services/contactservices.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'contact_providers.g.dart';

@riverpod
Box<ContactModel> contactbox(ContactboxRef ref) {
  return ContactServices.contectBox;
}

@riverpod
class contact extends _$contact {
  @override
  List<ContactModel> build() {
    return ref.watch(contactboxProvider).getAll();
  }

  void Remove(int id) {
    ref.watch(contactboxProvider).remove(id);
    state = List.from(ref.watch(contactboxProvider).getAll());
  }

  void putcontact(ContactModel contact) {
    ref.watch(contactboxProvider).put(contact);
    state = List.from(ref.watch(contactboxProvider).getAll());
  }
}

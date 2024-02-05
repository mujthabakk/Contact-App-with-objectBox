import 'package:objectbox/objectbox.dart';

@Entity()
class ContactModel {
  @Id()
  int id;
  String name;
  String phoneNUmber;
  ContactModel({required this.name, required this.phoneNUmber, this.id = 0});
}

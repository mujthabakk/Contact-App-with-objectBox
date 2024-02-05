// import 'package:objectbox/objectbox.dart';
// import 'package:objectboxcontact/model/contact_model.dart';
// import 'package:objectboxcontact/objectbox.g.dart';
import 'package:path_provider/path_provider.dart';
import 'package:objectboxcontact/model/contact_model.dart';
import 'package:objectboxcontact/objectbox.g.dart';
import 'package:path/path.dart';

class ContactServices {
  late final Store store;
  static late final Box<ContactModel> contectBox;

  ContactServices._create(this.store) {
    contectBox = store.box<ContactModel>();
  }

  static Future<ContactServices> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: join(docsDir.path, "contacts"));
    return ContactServices._create(store);
  }
}

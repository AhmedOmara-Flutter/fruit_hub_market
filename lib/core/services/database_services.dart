import 'package:fruit_hub_market/core/utils/app_imports.dart';

abstract class DatabaseServices {
  Future<void> addData({required String path, required Map<String, dynamic> data, required String uId,});

  Future<dynamic> getData({required String path, String ?uId,});
}



class FirestoreDatabase implements DatabaseServices {
  @override
  Future<void> addData({required String path, required Map<String, dynamic> data,required String uId}) async {
    try {
      await FirebaseFirestore.instance.collection(path).doc(uId).set(data);

    } on Exception catch (e) {
      throw (e.toString());
    }
  }


  @override
  Future<dynamic> getData({required String path,  String ?uId}) async {
    try {
      if (uId!=null) {
        final user = await FirebaseFirestore.instance.collection(path).doc(uId).get();
        if (!user.exists || user.data() == null) {
          throw Exception('User not found in Firestore');
        }
        return user.data() as Map<String, dynamic>;
      }
      else{
        final users = await FirebaseFirestore.instance.collection(path).get();
        if (users.docs.isEmpty) {
          throw Exception('No users found in Firestore');
        }
        return users.docs.map((user) => user.data()).toList();
      }

    } on Exception catch (e) {
      throw (e.toString());
    }
  }
}

import 'package:fruit_hub_market/core/utils/app_imports.dart';

abstract class DatabaseRemoteDataSource {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    required String uId,
  });

  Future<Map<String, dynamic>> getData({
    required String path,
    required String uId,
  });
}

class DatabaseRemoteDataSourceImpl implements DatabaseRemoteDataSource {
  @override
  Future<void> addData(
      {required String path, required Map<String, dynamic> data,required String uId}) async {
    try {
      await FirebaseFirestore.instance.collection(path).doc(uId).set(data);

    } on Exception catch (e) {
      throw (e.toString());
    }
  }

  @override
  Future<Map<String, dynamic>> getData(
      {required String path, required String uId}) async {
    try {
      final user = await FirebaseFirestore.instance.collection(path).doc(uId).get();
      if (!user.exists || user.data() == null) {
        throw Exception('User not found in Firestore');
      }
      return user.data() as Map<String, dynamic>;
    } on Exception catch (e) {
      throw (e.toString());
    }
  }
}

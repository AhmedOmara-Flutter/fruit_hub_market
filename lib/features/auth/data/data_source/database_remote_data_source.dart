import 'package:fruit_hub_market/core/utils/app_imports.dart';

abstract class DatabaseRemoteDataSource {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
  });

  Future<Map<String, dynamic>> getData({
    required String path,
    required String uId,
  });
}

class DatabaseRemoteDataSourceImpl implements DatabaseRemoteDataSource {
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    try {
      await FirebaseFirestore.instance.collection(path).add(data);
    } on Exception catch (e) {
      throw (e.toString());
    }
  }

  @override
  Future<Map<String, dynamic>> getData({
    required String path,
    required String uId,
  }) async {
    try {
      final user = await FirebaseFirestore.instance.doc(path).get();
      return user.data() as Map<String, dynamic>;
    } on Exception catch (e) {
      throw (e.toString());
    }
  }
}

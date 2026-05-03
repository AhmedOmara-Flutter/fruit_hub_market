import 'package:fruit_hub_market/core/utils/app_imports.dart';

abstract class DatabaseServices {
  Future<void> addData({required String path, required Map<String, dynamic> data, required String uId,});

  Future<dynamic> getData(
      {required String path, String ?uId, Map<String, dynamic>?query});
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
  Future<dynamic> getData(
      {required String path, String ?uId, Map<String, dynamic>?query}) async {
    try {
      if (uId!=null) {
        final user = await FirebaseFirestore.instance.collection(path).doc(uId).get();
        if (!user.exists || user.data() == null) {
          throw Exception('المستخدم ليس موجود في قاعده البيانات');
        }
        return user.data() as Map<String, dynamic>;
      }
      else{
        Query<Map<String, dynamic>> data = FirebaseFirestore.instance
            .collection(path);

        if (query != null) {
          final limit = query['limit'];
          final orderBy = query['orderBy'];
          final descending = query['descending'];
          final startAt = query['startAt'];
          final endAt = query['endAt'];


          if (orderBy != null) {
            data = data.orderBy(orderBy, descending: descending);
          }
          if (limit != null) {
            data = data.limit(limit);
          }
          if (startAt != null) {
            data = data.startAt([startAt]);
          }
          if (endAt != null) {
            data = data.endAt([endAt]);
          }
        }

        var result = await data.get();

        return result.docs.map((user) => user.data()).toList();
      }

    }  catch (e) {
      throw Exception(e.toString());
    }
  }
}

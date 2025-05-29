
abstract class DatabaseService {
  // This method is used to add data to the database
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentId});
  // This method is used to get data from the database
  Future<dynamic> getData({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
  });
 // This method is used to check if data exists in the database
  Future<bool> checkIfDataExists(
      {required String path, required String documentId});
}
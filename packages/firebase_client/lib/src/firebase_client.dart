abstract class FirebaseClient {
/*  /// gets all companies
  Future<List<CompanyEntity>> getAllCompanies();

*/
  void init();

  /// if something needs to be closed. ex: storage compaction and closing.
  void close();
}

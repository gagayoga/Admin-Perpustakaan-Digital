class Endpoint {
  static const String baseUrlApi =
      "http://192.168.43.21:8001/api/";

  // Authenticated
  static const String register = "${baseUrlApi}registrasi";
  static const String login = "${baseUrlApi}users/login";
  static const String logout = "${baseUrlApi}logout";


  // Book
  static const String book = "${baseUrlApi}admin/buku";
}
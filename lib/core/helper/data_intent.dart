class DataIntent {
  DataIntent._();
//------------------------------------
 //login
  static String? _email;
  static void pushEmail(String email) => _email = email;

  static String? popEmail() {
    String? value = _email;
    _email = null;
    return value;
  }

//------------------------------------
}

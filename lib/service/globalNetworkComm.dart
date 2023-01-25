class NetworkCon{
  static final NetworkCon _singleton = NetworkCon._internal();

  factory NetworkCon() {
    return _singleton;
  }

  NetworkCon._internal();
}
abstract class FcmInterface {
  Future<void> initialize();

  Future<void> requestPermission();

  Future<String?> getToken();
}

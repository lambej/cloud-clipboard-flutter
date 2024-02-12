abstract class ClipboardRepository {
  Future<void> init();
  Future<void> saveClipboard(String text);
  Stream<List<String>> getClipboard();
}

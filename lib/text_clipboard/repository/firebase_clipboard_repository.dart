import 'package:cloud_clipboard/text_clipboard/repository/clipboard_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseClipboardRepository implements ClipboardRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  _initClipboardTexts() {}

  @override
  Future<void> init() async {
    await _initClipboardTexts();
  }

  @override
  Future<void> saveClipboard(String text) async {
    await _firestore.collection('clipboard').doc('text').set({'text': text});
  }

  @override
  Stream<List<String>> getClipboard() async* {
    final doc = await _firestore.collection('clipboard').doc('text').get();
    yield [doc.data()!['text'] as String];
  }
}

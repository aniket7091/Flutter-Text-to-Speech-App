import '../../domain/repository/repo_text.dart';
import '../dataSource/Text-to-Speech Service.dart';

class TextToSpeechRepositoryImpl implements TextToSpeechRepository {
  final TextToSpeechService _service;

  TextToSpeechRepositoryImpl(this._service);

  @override
  Future<void> convertTextToSpeech(String text) async {
    await _service.speakText(text);
  }
}

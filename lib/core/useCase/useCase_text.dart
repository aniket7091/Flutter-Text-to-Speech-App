import '../../domain/repository/repo_text.dart';

class TextToSpeechUseCase {
  final TextToSpeechRepository repository;

  TextToSpeechUseCase(this.repository);

  Future<void> execute(String text) async {
    await repository.convertTextToSpeech(text);
  }
}

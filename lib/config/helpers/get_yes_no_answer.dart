import 'package:chat_app/domain/entities/message.dart';
import 'package:dio/dio.dart';

/// Uso del paquete http para consultas http
/// También se puede usar dio, porque tiene menos dependencias (ligero)
/// Ctrl + Shift + P -> >pubspec Assist -> dio  // Con el asistente pub
/// o $ flutter pub add dio
class GetYesNoAnswer {
  /// Se puede pasar como parámetro a Dio(BaseOptions(...))
  /// La cual permite pasar el baseUrl que está en el .env y headers epeciales
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');
    print(response);
    return Message(
      text: response.data['answer'],
      fromWho: FromWho.his,
      imageUrl: response.data['image'],
    );
  }
}

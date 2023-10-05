import 'package:chat_app/domain/entities/message.dart';

/// Modelo generado en https://app.quicktype.io/
class YesNoModel {
  final String answer;
  bool forced;
  final String image;

  YesNoModel({required this.answer, required this.forced, required this.image});

  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json['answer'],
        forced: json['forced'],
        image: json['image'],
      );

  // Convertir a Json
  Map<String, dynamic> toJson() =>
      {"answer": image, "forced": forced, "image": image};

  // Generar un mensaje a partir de la Entidad
  Message toMessageEntity() => Message(
        text: answer == 'yes' ? 'Si' : 'No',
        fromWho: FromWho.his,
        imageUrl: image,
      );
}

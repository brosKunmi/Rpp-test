import 'dart:convert';

class PicsModel {
  int id;
  String url;
  String photographer;
  PicsModel({
    required this.id,
    required this.url,
    required this.photographer,
  });

  PicsModel copyWith({
    int? id,
    String? url,
    String? photographer,
  }) {
    return PicsModel(
      id: id ?? this.id,
      url: url ?? this.url,
      photographer: photographer ?? this.photographer,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'url': url,
      'photographer': photographer,
    };
  }

  factory PicsModel.fromMap(Map<String, dynamic> map) {
    return PicsModel(
      id: map['id']?.toInt() ?? 0,
      url: map['url'] ?? '',
      photographer: map['photographer'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PicsModel.fromJson(String source) =>
      PicsModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'PicsModel(id: $id, url: $url, photographer: $photographer)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PicsModel &&
        other.id == id &&
        other.url == url &&
        other.photographer == photographer;
  }

  @override
  int get hashCode => id.hashCode ^ url.hashCode ^ photographer.hashCode;
}

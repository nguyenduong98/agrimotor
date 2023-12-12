part of 'entities.dart';

class SocialAuthRequest extends Equatable {
  final String? accessToken;
  final String? idToken;
  final int? expiresTime;

  const SocialAuthRequest({
    this.accessToken,
    this.idToken,
    this.expiresTime,
  });

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{
      'access_token': accessToken,
      'id_token': idToken,
      'expires_time': expiresTime
    };
    result.removeWhere((key, value) => value == null);
    return result;
  }

  factory SocialAuthRequest.fromJson(Map<String, dynamic> map) {
    return SocialAuthRequest(
      accessToken: map['access_token'],
        idToken: map['id_token'],
      expiresTime: map['expires_time']
    );
  }

  @override
  List<Object?> get props {
    return [
      accessToken,
      idToken,
      expiresTime
    ];
  }

  SocialAuthRequest copyWith({
    String? accessToken,
    String? idToken,
    int? expiresTime
  }) {
    return SocialAuthRequest(
      accessToken: accessToken ?? this.accessToken,
        idToken: idToken ?? this.idToken,
      expiresTime: expiresTime ?? this.expiresTime
    );
  }
}

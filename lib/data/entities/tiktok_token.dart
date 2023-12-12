part of 'entities.dart';

class TikTokAccessToken {
  final String? openId;
  final String? token;
  final int? expiresIn;
  TikTokAccessToken({
    this.openId,
    this.token,
    this.expiresIn,
  });

  TikTokAccessToken copyWith({
    String? openId,
    String? token,
    int? expiresIn,
  }) {
    return TikTokAccessToken(
      openId: openId ?? this.openId,
      token: token ?? this.token,
      expiresIn: expiresIn ?? this.expiresIn,
    );
  }

  factory TikTokAccessToken.fromJson(Map<String, dynamic> map) {
    return TikTokAccessToken(
      openId: map['open_id'],
      token: map['access_token'],
      expiresIn: DynamicParser.parseInt(map['expires_in']),
    );
  }

  @override
  bool operator ==(covariant TikTokAccessToken other) {
    if (identical(this, other)) return true;

    return other.openId == openId &&
        other.token == token &&
        other.expiresIn == expiresIn;
  }

  @override
  int get hashCode => openId.hashCode ^ token.hashCode ^ expiresIn.hashCode;
}

class SubscriptionInfo {
  final String? id;
  final DateTime? date;
  final int? expirationTimeStamp;
  final String? subscriptionType;

  const SubscriptionInfo(
      {this.expirationTimeStamp, this.subscriptionType, this.id, this.date});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubscriptionInfo &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          date == other.date &&
          expirationTimeStamp == other.expirationTimeStamp;

  @override
  int get hashCode =>
      id.hashCode & date.hashCode & expirationTimeStamp.hashCode;
}

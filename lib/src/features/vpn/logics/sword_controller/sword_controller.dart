import 'package:flutter_riverpod/flutter_riverpod.dart';

final swordController =
    NotifierProvider<SwordController, SwordConnection>(SwordController.new);

enum SwordConnection { active, reboot }

class SwordController extends Notifier<SwordConnection> {
  @override
  SwordConnection build() => SwordConnection.active;

  void reboot() {
    state = SwordConnection.reboot;
  }

  void activate() {
    state = SwordConnection.active;
  }
}

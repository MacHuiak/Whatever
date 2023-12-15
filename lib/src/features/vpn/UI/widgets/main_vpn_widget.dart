import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modern_vpn_project/src/features/vpn/logics/sword_controller/sword_controller.dart';
import 'package:rive/rive.dart';

class NoConnectionWidget extends StatelessWidget {
  const NoConnectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [Icon(Icons.add), Text("")],
    );
  }
}

class LightSwordWidget extends ConsumerStatefulWidget {
  final Function onStart;

  const LightSwordWidget({super.key, required this.onStart});

  @override
  ConsumerState<LightSwordWidget> createState() => _LightSwordWidgetState();
}

class _LightSwordWidgetState extends ConsumerState<LightSwordWidget> {
  SMIInput<bool>? _isPressed;
  StateMachineController? stateMachineController;
  String? _currentStateName;
  RiveFile? rive;

  @override
  void initState() {
    super.initState();

    rootBundle.load("assets/rive/may.riv").then(
      (value) async {
        setState(() {
          rive = RiveFile.import(value);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(swordController, (_, next) {
      if (next == SwordConnection.reboot) {
        _restartSwordAnimation();
      }
    });
    return rive == null
        ? const SizedBox()
        : SizedBox(
            width: 700,
            height: 650,
            child: RiveAnimation.direct(rive!,
                artboard: "Saber Fight Test",
                onInit: _onInit,
                alignment: Alignment.center,
                fit: BoxFit.fitHeight),
          );
  }

  void _onInit(Artboard board) {
    stateMachineController = StateMachineController.fromArtboard(
      board,
      "State Machine 1",
      onStateChange: (String stateMachineName, String stateName) {
        if (stateName == "off" && stateName != _currentStateName) {
          widget.onStart();
        }
        setState(() {
          _currentStateName = stateName;
        });
      },
    ) as StateMachineController;
    // _controllerBloc!.add(LightSabersInit(stateMachineController!));
    board.addController(stateMachineController!);
  }

  Future<void> _restartSwordAnimation() async {
    setState(() {
      rive = null;
    });

    await rootBundle.load("assets/rive/may.riv").then(
      (value) async {
        setState(() {
          rive = RiveFile.import(value);
        });
        ref.read(swordController.notifier).activate();
      },
    );
  }

  @override
  void dispose() {
    stateMachineController?.dispose();
    super.dispose();
  }
}

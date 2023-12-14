import 'package:flutter/material.dart';
import 'package:modern_vpn_project/generated/l10n.dart';
import 'package:modern_vpn_project/src/assets/colors.dart';
import 'package:modern_vpn_project/src/features/vpn/UI/widgets/main_button_widget.dart';

class DisconnectedControllerWidget extends StatelessWidget {
  const DisconnectedControllerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          S.of(context).clickAndDrag,
          style: const TextStyle(
              fontSize: 18, color: AppColors.mainBackgroundButtonColor),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          S.of(context).theLightSaberToConnectVpn,
          style: const TextStyle(
              fontSize: 18, color: AppColors.mainBackgroundButtonColor),
        )
      ],
    );
  }
}

class HaveErrorConnectionWidget extends StatelessWidget {
  const HaveErrorConnectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: const BorderSide(
            color: AppColors.borderGrey,
          ),
        ),
      ),
      onPressed: () {
        //TODO: add action
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
        child: Row(
          children: [
            //TODO: change icons
            const Icon(
              Icons.sync,
              color: AppColors.grey,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                S.of(context).tryAgain,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ActiveControllerWidget extends StatelessWidget {
  const ActiveControllerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MainButtonWidget(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.grey,
            ),
            child: Padding(
              padding: EdgeInsets.all(4),
              child: Icon(
                Icons.close,
                color: AppColors.mainBackgroundButtonColor,
                size: 13,
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),

          //TODO: add font
          Text(
            S.of(context).disconnect,
            style: const TextStyle(
              color: Colors.white,
            ),
          )
        ],
      ),
      onTap: () {},
    );
  }
}

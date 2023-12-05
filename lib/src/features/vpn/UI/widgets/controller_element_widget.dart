import 'package:flutter/material.dart';
import 'package:modern_vpn_project/src/assets/colors.dart';
import 'package:modern_vpn_project/src/features/vpn/UI/widgets/main_button_widget.dart';

class DisconnectedControllerWidget extends StatelessWidget {
  const DisconnectedControllerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Click and drag",
          style: TextStyle(
              fontSize: 18, color: AppColors.mainBackgroundButtonColor),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "the light saber to connect VPN",
          style: TextStyle(
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
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 18, horizontal: 18),
        child: Row(
          children: [
            //TODO: change icons
            Icon(
              Icons.sync,
              color: AppColors.grey,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                "Try again",
                style: TextStyle(
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
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          DecoratedBox(
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
          SizedBox(
            width: 8,
          ),

          //TODO: add font
          Text(
            "Disconnect",
            style: TextStyle(
              color: Colors.white,
            ),
          )
        ],
      ),
      onTap: () {},
    );
  }
}

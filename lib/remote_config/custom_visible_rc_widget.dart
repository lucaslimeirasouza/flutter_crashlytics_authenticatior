import 'package:flutter/cupertino.dart';
import 'package:flutter_push_notification_remote_config_desafio/remote_config/custom_remote_config.dart';

class CustomVisibleRCWidget extends StatelessWidget {
  const CustomVisibleRCWidget({
    super.key,
    required this.child,
    required this.rmKey,
    this.defaultValue,
  });

  final Widget child;
  final String rmKey;
  final dynamic defaultValue;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      child: child,
      visible: CustomRemoteConfig()
          .getValueOrDefault(key: rmKey, defaultValue: defaultValue),
    );
  }
}

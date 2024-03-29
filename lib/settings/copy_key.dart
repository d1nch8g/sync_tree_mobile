import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';
import '../src/src.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class CopyKeyTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      enableFeedback: true,
      onTap: () async {
        var keys = await Storage.loadKeys();
        showTopSnackBar(
          context,
          CustomSnackBar.error(
            message: 'Key copied to clipboard.\nDont share this key!',
            backgroundColor: Theme.of(context).hoverColor,
            textStyle: Theme.of(context).textTheme.headline2!,
            icon: const Icon(
              Icons.file_copy_rounded,
              color: const Color(0x15000000),
              size: 100,
            ),
            iconRotationAngle: 18,
          ),
        );
        FlutterClipboard.copy(keys.allKeysString);
      },
      leading: Icon(
        Icons.vpn_key_outlined,
        color: Theme.of(context).hoverColor,
        size: 29,
      ),
      title: Text(
        'Copy private key',
        style: Theme.of(context).textTheme.headline5,
      ),
      subtitle: Text(
        'Get copy of your private key saved on your device and copy it to clipboard.',
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}

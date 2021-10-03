import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/src/local/storage.dart';
import 'package:sync_tree_mobile_ui/src/local/stream.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class NoConnectedWallets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                ' FIND AND CONNECT ',
                style: Theme.of(context).textTheme.headline2,
              ),
              Icon(
                Icons.manage_search_rounded,
                size: 36,
              ),
            ],
          ),
        ),
        onPressed: () {
          Storage.triggerStorageEvent(
            trigger: Trigger.moveToMarketPage,
          );
          showTopSnackBar(
            context,
            CustomSnackBar.error(
              message: 'Find markets and connect them on this page.',
              backgroundColor: Theme.of(context).hoverColor,
              textStyle: Theme.of(context).textTheme.headline2!,
              icon: const Icon(
                Icons.list_alt_rounded,
                color: const Color(0x15000000),
                size: 120,
              ),
            ),
          );
        },
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(
            Theme.of(context).focusColor,
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            Theme.of(context).backgroundColor,
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          side: MaterialStateProperty.all<BorderSide>(
            BorderSide(
              color: Theme.of(context).primaryColorDark,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:wallet_app/_reusable/colors.dart';
import 'package:wallet_app/_reusable/text.dart';
import 'package:wallet_app/_reusable/moadlTab.dart';

import 'swapCoin/swapCoinBox.dart';
import 'connectedWallets/connectedWallets.dart';
import 'searchWallets/searchWallet.dart';

/*
    Данная страница предназначена для страницы кошелька.
  Тут пользователь может получить следующую информацию:
- Привязанные кошельки
- Обменники к которым они принадлежат
- Их баланс
- Возможность добавить кошелек
- Возможность удалить кошелек при нулевом балансе
*/

class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwapCoinContainer(),
        Divider(
          color: palette.dividerColor,
          thickness: 0.2,
          indent: 17,
          endIndent: 17,
          height: 4,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(19, 8, 19, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Rtext(
                text: 'Users around',
                fontSize: 24,
              ),
              IconButton(
                icon: Icon(
                  Icons.add_circle_sharp,
                  color: palette.smallItemsColor,
                ),
                iconSize: 28,
                splashRadius: 34,
                onPressed: () async {
                  await ModalTab.showModalFunction(
                    context,
                    Center(
                      child: SearchWalletsList(),
                    ),
                    0.74,
                  );
                },
              )
            ],
          ),
        ),
        SizedBox(
          height: 8,
        ),
        ConnectedWalletsList(),
      ],
    );
  }
}

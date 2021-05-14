import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';

import 'package:wallet_app/_reusable/textField.dart';

/*
    Данная секция предназначена для бэкдроп меню на странице кошелька
В активной части бэкдропа будут высвечиваться активные кошельки в виде листвью, 
они будут обладать сдедующим функционалом:
1 - Войти в сам кошелек для совершения дальнейших действий
2 - Баланс данного кошелька
3 - Название актива к которому относится кошелек
4 - Обменник к которому относится данный кошелек
5 - Комисси на ввод и на вывод по текущему кошельку
6 - Текущий курс данного обменника по отношению к SwapCoin

В пассивной части бэкдроп меню будут следующие опции:
1 - Выполнить поиск по существующим обменникам
2 - Добавить обменник в подключенные ассеты

*/


class SearchWalletsList extends StatelessWidget {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RtextField(
          controller: controller,
          // onItemChanged: () {},
          mainText: 'mainText',
          typeText: 'typeText',
          suffixWidget: IconButton(
            icon: Icon(Icons.ac_unit),
            onPressed: () async {
              controller.clear();
              FocusScope.of(context).unfocus();
            },
          ),
          padding: EdgeInsets.all(12),
        ),
      ],
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sync_tree_mobile_ui/market/modal.dart';
import 'package:sync_tree_mobile_ui/src/local/balance.dart';
import 'package:sync_tree_mobile_ui/src/net/info_calls.dart';

class MarketTile extends StatefulWidget {
  final String marketAdress;
  MarketTile({required this.marketAdress});
  @override
  State<MarketTile> createState() => _MarketTileState();
}

class _MarketTileState extends State<MarketTile> {
  late MarketInfo info;
  String imageLink = '';
  String description = '';
  String marketName = '';
  String marketBalance = '0';

  updateTileContent() async {
    info = await InfoCalls.marketInfo(this.widget.marketAdress);
    imageLink = info.imageLink;
    description = info.description;
    marketName = info.name;
    marketBalance = await Balance.marketBalance(
      adress: info.adress,
      delimiter: info.delimiter,
    );
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    updateTileContent();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 54,
        child: CachedNetworkImage(
          imageUrl: imageLink,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              CircularProgressIndicator(value: downloadProgress.progress),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
      title: Row(
        children: [
          Text(
            marketName,
            maxLines: 1,
            style: Theme.of(context).textTheme.headline5,
          ),
          Spacer(),
          Text(
            marketBalance,
            maxLines: 1,
            style: Theme.of(context).textTheme.headline5,
          ),
        ],
      ),
      subtitle: Text(
        description,
        maxLines: 4,
        style: Theme.of(context).textTheme.caption,
      ),
      onTap: () {
        showMaterialModalBottomSheet(
          context: context,
          builder: (context) => MarketModalPage(info: info),
        );
      },
    );
  }
}

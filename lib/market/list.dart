import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sync_tree_mobile_ui/market/tile.dart';

class MarketList extends StatelessWidget {
  final List<String> marketAdresses;
  MarketList({
    required this.marketAdresses,
  });
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimationLimiter(
        child: ListView.builder(
          shrinkWrap: true,
          reverse: true,
          itemCount: marketAdresses.length,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: MarketTile(
                    marketAdress: marketAdresses[index],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

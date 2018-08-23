import 'package:flutter/material.dart';
import '../models/rss_feed.dart';

class SongList extends StatelessWidget {
  final List<RssSong> entries;

  SongList(this.entries);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: entries.length,
      itemBuilder: (context, index) {
        return songItemWidget(entries[index]);
      },
    );
  }

  Widget songItemWidget(RssSong model) {
    // return Text(model.title);
    return Container(
      margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
      padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: songItemDetails(model),
    );
  }

  Widget songItemDetails(RssSong model) {
    return Wrap(
      direction: Axis.horizontal,
      children: [
        songItemRightDetails(model),
        songItemLeftDetails(model),
      ],
    );
  }

  Widget songItemRightDetails(RssSong model) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Image.network(model.imageURL),
    );
  }

  Widget songItemLeftDetails(RssSong model) {
    return Wrap(
      direction: Axis.vertical,
      children: <Widget>[
        Wrap(
          direction: Axis.vertical,
          children: <Widget>[Text('Title: ${model.title}')],
        ),
        Text('Release Date: ${model.releaseDate}'),
        Text('Collection: ${model.collectionName}'),
        Text('Price: ${model.priceLabel}')
      ],
    );
  }
}

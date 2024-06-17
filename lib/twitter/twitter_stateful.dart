import 'package:flutter/material.dart';
import 'package:tutrealapp/twitter/twitter_item.dart';

class TwitterStatefulWidget extends StatefulWidget {
  const TwitterStatefulWidget({super.key});

  @override
  State<TwitterStatefulWidget> createState() => _TwitterStatefulWidgetState();
}

class _TwitterStatefulWidgetState extends State<TwitterStatefulWidget> {
  // layout property
  static const double _nameFontSize = 16.0;
  static const double _messageFontSize = 14.0;
  static const double _vetricalSpace = 8.0;
  static const double _iconTrailingSpace = 16.0;
  static const double _cellMaxHeight = 100.0;
  static const double _iconImageSize = 48.0;
  static const double _horizontalPadding = 16.0;

  var itemList = [
    const TweetItem(name: 'taichi', message: 'smaple'),
    const TweetItem.defaultItem(),
    const TweetItem(
        name: 'satou',
        message:
            'snlfesnlfilesnflasnefnlasenflsnelfsfelsafnseiansenfilsneflnslefas;lnfase'),
    const TweetItem(
        name: 'mike',
        message: 'nslenicslnflsieflisanelnsalnfalsnefislenalsienaslienlaselse')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back),
          title: const Text('Twitter UI'),
          actions: [
            IconButton(
                onPressed: _addTweetItem, icon: const Icon(Icons.plus_one))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(
              left: _horizontalPadding, right: _horizontalPadding),
          child: _tweetList(),
        ));
  }

  Widget _tweetList() {
    return ListView.builder(
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          final item = itemList[index];
          return Column(
            children: [
              _tweetCell(item),
              const Divider(
                height: 1,
              )
            ],
          );
        });
  }

  Widget _tweetCell(TweetItem item) {
    return Container(
      constraints: const BoxConstraints(maxHeight: _cellMaxHeight),
      color: Colors.white70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: IconButton(
                padding: EdgeInsets.zero,
                icon: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius:
                            BorderRadius.circular(_iconImageSize / 2)),
                    child: const Icon(Icons.person)),
                iconSize: _iconImageSize,
                onPressed: () {
                  print('Pressed.');
                }),
          ),
          const SizedBox(
            width: _iconTrailingSpace,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: _vetricalSpace),
                  child: Text(
                    item.name,
                    softWrap: true,
                    style: const TextStyle(
                        fontSize: _nameFontSize, fontWeight: FontWeight.bold),
                  ),
                ),
                DefaultTextStyle(
                  style: const TextStyle(
                      fontSize: _messageFontSize, color: Colors.black),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(top: _vetricalSpace),
                    child: Text(
                      item.message,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 16,
          )
        ],
      ),
    );
  }

  _addTweetItem() {
    setState(() {
      itemList.add(const TweetItem.defaultItem());
    });
  }
}

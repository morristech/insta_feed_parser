import 'dart:async';

import 'package:instafeedparser/insta_feed_bean.dart';
import 'package:instafeedparser/insta_feed_parser.dart';
import 'package:mobx/mobx.dart';

part 'insta_feed_store.g.dart';

/// mobx store for home page
class InstaFeedStore = _InstaFeedStore with _$InstaFeedStore;

abstract class _InstaFeedStore with Store {

  @observable
  ObservableList<InstaFeedBean> instaFeedList = ObservableList.of([]);

  @action
  getInstaFeedList(String url) async {
    var feeds = await InstaFeedParser.feedsFromProfile(url);
    feeds.forEach((url) async {
      var instaFeed = await InstaFeedParser.getFeed(url); // Get feed data
      instaFeedList.add(instaFeed);
    });
  }
}

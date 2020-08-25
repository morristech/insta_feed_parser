library insta_feed_parser;

import 'dart:convert';

import 'package:html/parser.dart';
import 'package:http/http.dart';

/// class that use to parse insta feeds from user profile url
import 'insta_feed_bean.dart';

class InstaFeedParser {

  /// Returns the first 12 posts of a public Instagram profile.
  static Future<List<String>> feedsFromProfile(
      String profileUrl) async {
    if (profileUrl == null || profileUrl == '') {
      return [];
    }

    String _profilePageData;
    String _temporaryProfileData;
    var _postsUrls = List<String>();
    var _client = Client();
    Response _response;
    var _elements;
    var _document;

    try {
      _response = await _client.get('$profileUrl');
      _document = parse(_response.body);
      _elements = _document.querySelectorAll('body');
    } catch (error) {
      print('[InstaParser] [ParsePostsUrlsFromInstaProfile] ERROR: $error');
    }

    _profilePageData = _elements[0].text;

    // Get postsUrl (shortcode tag)
    _temporaryProfileData = _profilePageData;
    for (int i = 0; i < 12; i++) {
      int _inx;
      int _urlLenght;
      String _postUrl;

      _postsUrls.add('');
      _inx = _temporaryProfileData.indexOf("shortcode\":\"");
      _urlLenght = 11; //ex: BxFcM54hJMb
      _inx += "shortcode\":\"".length; // Advance
      _postUrl = _temporaryProfileData
          .substring(_inx)
          .substring(0, _urlLenght); // Gets the postUrl
      _postsUrls[i] =
          "https://www.instagram.com/p/$_postUrl"; // Adds to the postsUrls list
      _temporaryProfileData =
          _temporaryProfileData.substring(_inx); // Cuts the read shortcode
    }

    return _postsUrls;
  }

  /// Returns feed data
  static Future<InstaFeedBean> getFeed(String _postsUrl) async {
    Client _client = Client();
    // get feed data
    final post = await _client.get('$_postsUrl?__a=1');
    var instaFeed = InstaFeedBean.fromJson(jsonDecode(post.body));
    return instaFeed;
  }
}

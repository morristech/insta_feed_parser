import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instafeedparser/insta_feed_bean.dart';
import 'package:instafeedparser_example/modules/app_video.dart';
import 'package:instafeedparser_example/utils/date_utils.dart';
import 'package:instafeedparser_example/values/app_colors.dart';
import 'package:instafeedparser_example/values/images.dart';
import 'package:instafeedparser_example/values/vectors.dart';

// ignore: must_be_immutable
class ItemInstaFeed extends StatelessWidget {
  double width;
  InstaFeedBean instaFeedBean;

  ItemInstaFeed({this.width, this.instaFeedBean});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: 25,
                  width: 25,
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: AppColors.colorE50D7F),
                  alignment: Alignment.center,
                  child: ClipOval(
                    child: Image.network(
                      instaFeedBean.graphql.shortcodeMedia.owner.profilePicUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      instaFeedBean.graphql.shortcodeMedia.owner.fullName,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Spacer(),
                Image.asset(
                  Images.icoInsta,
                  width: 22,
                  height: 22,
                )
              ],
            ),
          ),
          Visibility(
            visible: instaFeedBean.graphql.shortcodeMedia.isImage ||
                instaFeedBean.graphql.shortcodeMedia.isVideo,
            child: Container(
              color: AppColors.colorDBE2ED,
              height: 200,
              child: instaFeedBean.graphql.shortcodeMedia.isVideo
                  ? AppVideo(
                      videoUrl: instaFeedBean.graphql.shortcodeMedia.videoUrl,
                      videoThumb:
                          instaFeedBean.graphql.shortcodeMedia.thumbnailSrc,
                    )
                  : Image.network(
                      instaFeedBean.graphql.shortcodeMedia.imageUrl ?? '',
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 10,
              ),
              SvgPicture.asset(
                Vectors.icoLike,
                width: 15,
                height: 15,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '${instaFeedBean.graphql.shortcodeMedia.edgeMediaPreviewLike.count} likes',
                style: TextStyle(color: Colors.black, fontSize: 8),
              ),
              Spacer(),
              Text(
                DateUtils.convertTimeStampToDate(
                    instaFeedBean.graphql.shortcodeMedia.takenAtTimestamp),
                style: TextStyle(color: AppColors.color838383, fontSize: 8),
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              instaFeedBean
                  .graphql.shortcodeMedia.edgeMediaToCaption.edges[0].node.text,
              style: TextStyle(color: AppColors.color333333, fontSize: 10),
            ),
          )
        ],
      ),
    );
  }
}

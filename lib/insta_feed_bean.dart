library insta_feed_bean;

/// model class for insta feed
class InstaFeedBean {
  Graphql graphql;

  InstaFeedBean({this.graphql});

  InstaFeedBean.fromJson(Map<String, dynamic> json) {
    graphql =
    json['graphql'] != null ? Graphql.fromJson(json['graphql']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.graphql != null) {
      data['graphql'] = this.graphql.toJson();
    }
    return data;
  }
}

class Graphql {
  ShortcodeMedia shortcodeMedia;

  Graphql({this.shortcodeMedia});

  Graphql.fromJson(Map<String, dynamic> json) {
    shortcodeMedia = json['shortcode_media'] != null
        ? ShortcodeMedia.fromJson(json['shortcode_media'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.shortcodeMedia != null) {
      data['shortcode_media'] = this.shortcodeMedia.toJson();
    }
    return data;
  }
}

class ShortcodeMedia {
  String id;
  String shortcode;
  String displayUrl;
  bool hasAudio;
  String videoUrl;
  String imageUrl;
  bool isVideo = false;
  bool isImage = false;
  String trackingToken;
  EdgeMediaToCaption edgeMediaToCaption;
  EdgeMediaPreviewComment edgeMediaPreviewComment;
  EdgeMediaPreviewLike edgeMediaPreviewLike;
  int takenAtTimestamp;
  Owner owner;
  String title;
  double videoDuration;
  String thumbnailSrc;

  ShortcodeMedia(
      {this.id,
        this.shortcode,
        this.displayUrl,
        this.hasAudio,
        this.videoUrl,
        this.imageUrl,
        this.isVideo,
        this.isImage,
        this.trackingToken,
        this.edgeMediaToCaption,
        this.edgeMediaPreviewComment,
        this.takenAtTimestamp,
        this.owner,
        this.title,
        this.edgeMediaPreviewLike,
        this.videoDuration,
        this.thumbnailSrc});

  ShortcodeMedia.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shortcode = json['shortcode'];
    displayUrl = json['display_url'];
    hasAudio = json['has_audio'];
    videoUrl = json['video_url'];
    imageUrl =  json['display_url'] != null? json['display_url'] : json['image_url'];
    isVideo = json['is_video'] ?? false;
    isImage = json['display_url'] != null ? true : false;
    edgeMediaPreviewLike = json['edge_media_preview_like'] != null
        ? new EdgeMediaPreviewLike.fromJson(json['edge_media_preview_like'])
        : null;
    trackingToken = json['tracking_token'];
    edgeMediaToCaption = json['edge_media_to_caption'] != null
        ? EdgeMediaToCaption.fromJson(json['edge_media_to_caption'])
        : null;
    edgeMediaPreviewComment = json['edge_media_preview_comment'] != null
        ? EdgeMediaPreviewComment.fromJson(json['edge_media_preview_comment'])
        : null;
    takenAtTimestamp = json['taken_at_timestamp'] * 1000;
    owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null;
    title = json['title'];
    videoDuration = json['video_duration'];
    thumbnailSrc = json['thumbnail_src'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['shortcode'] = this.shortcode;
    data['display_url'] = this.displayUrl;
    data['has_audio'] = this.hasAudio;
    data['video_url'] = this.videoUrl;
    data['image_url'] = this.imageUrl;
    data['is_image'] = this.isImage;
    data['tracking_token'] = this.trackingToken;
    if (this.edgeMediaPreviewLike != null) {
      data['edge_media_preview_like'] = this.edgeMediaPreviewLike.toJson();
    }
    if (this.edgeMediaToCaption != null) {
      data['edge_media_to_caption'] = this.edgeMediaToCaption.toJson();
    }
    if (this.edgeMediaPreviewComment != null) {
      data['edge_media_preview_comment'] =
          this.edgeMediaPreviewComment.toJson();
    }
    data['taken_at_timestamp'] = this.takenAtTimestamp;
    if (this.owner != null) {
      data['owner'] = this.owner.toJson();
    }
    data['title'] = this.title;
    data['video_duration'] = this.videoDuration;
    data['thumbnail_src'] = this.thumbnailSrc;
    return data;
  }
}

class EdgeMediaPreviewLike {
  int count;

  EdgeMediaPreviewLike({this.count});

  EdgeMediaPreviewLike.fromJson(Map<String, dynamic> json) {
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    return data;
  }
}

class EdgeMediaToCaption {
  List<Edges> edges;

  EdgeMediaToCaption({this.edges});

  EdgeMediaToCaption.fromJson(Map<String, dynamic> json) {
    if (json['edges'] != null) {
      edges = List<Edges>();
      json['edges'].forEach((v) {
        edges.add(Edges.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.edges != null) {
      data['edges'] = this.edges.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Edges {
  Node node;

  Edges({this.node});

  Edges.fromJson(Map<String, dynamic> json) {
    node = json['node'] != null ? Node.fromJson(json['node']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.node != null) {
      data['node'] = this.node.toJson();
    }
    return data;
  }
}

class EdgeMediaPreviewComment {
  int count;
  List<Edges> edges;

  EdgeMediaPreviewComment({this.count, this.edges});

  EdgeMediaPreviewComment.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['edges'] != null) {
      edges = List<Edges>();
      json['edges'].forEach((v) {
        edges.add(Edges.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['count'] = this.count;
    if (this.edges != null) {
      data['edges'] = this.edges.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Node {
  String id;
  String text;
  int createdAt;
  Owner owner;
  EdgeLikedBy edgeLikedBy;

  Node({this.id, this.text, this.createdAt, this.owner, this.edgeLikedBy});

  Node.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    createdAt = json['created_at'];
    owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null;
    edgeLikedBy = json['edge_liked_by'] != null
        ? EdgeLikedBy.fromJson(json['edge_liked_by'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    data['created_at'] = this.createdAt;
    if (this.owner != null) {
      data['owner'] = this.owner.toJson();
    }
    if (this.edgeLikedBy != null) {
      data['edge_liked_by'] = this.edgeLikedBy.toJson();
    }
    return data;
  }
}

class EdgeLikedBy {
  int count;

  EdgeLikedBy({this.count});

  EdgeLikedBy.fromJson(Map<String, dynamic> json) {
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['count'] = this.count;
    return data;
  }
}

class Owner {
  String id;
  String profilePicUrl;
  String username;
  String fullName;
  EdgeLikedBy edgeOwnerToTimelineMedia;
  EdgeLikedBy edgeFollowedBy;

  Owner(
      {this.id,
        this.profilePicUrl,
        this.username,
        this.fullName,
        this.edgeOwnerToTimelineMedia,
        this.edgeFollowedBy});

  Owner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    profilePicUrl = json['profile_pic_url'];
    username = json['username'];
    fullName = json['full_name'];
    edgeOwnerToTimelineMedia = json['edge_owner_to_timeline_media'] != null
        ? EdgeLikedBy.fromJson(json['edge_owner_to_timeline_media'])
        : null;
    edgeFollowedBy = json['edge_followed_by'] != null
        ? EdgeLikedBy.fromJson(json['edge_followed_by'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['profile_pic_url'] = this.profilePicUrl;
    data['username'] = this.username;
    data['full_name'] = this.fullName;
    if (this.edgeOwnerToTimelineMedia != null) {
      data['edge_owner_to_timeline_media'] =
          this.edgeOwnerToTimelineMedia.toJson();
    }
    if (this.edgeFollowedBy != null) {
      data['edge_followed_by'] = this.edgeFollowedBy.toJson();
    }
    return data;
  }
}

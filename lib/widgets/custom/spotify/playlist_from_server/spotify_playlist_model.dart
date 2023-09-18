class SpotifyPlaylistModel {
  bool? collaborative;
  String? description;
  ExternalUrls? externalUrls;
  Followers? followers;
  String? href;
  String? id;
  List<Images>? images;
  String? name;
  Owner? owner;
  String? primaryColor;
  bool? public;
  String? snapshotId;
  Tracks? tracks;
  String? type;
  String? uri;

  SpotifyPlaylistModel({
    this.collaborative,
    this.description,
    this.externalUrls,
    this.followers,
    this.href,
    this.id,
    this.images,
    this.name,
    this.owner,
    this.primaryColor,
    this.public,
    this.snapshotId,
    this.tracks,
    this.type,
    this.uri,
  });

  factory SpotifyPlaylistModel.fromJson(Map<String, dynamic> json) {
    return SpotifyPlaylistModel(
      collaborative: json['collaborative'],
      description: json['description'],
      externalUrls: json['external_urls'] != null
          ? ExternalUrls.fromJson(json['external_urls'])
          : null,
      followers: json['followers'] != null
          ? Followers.fromJson(json['followers'])
          : null,
      href: json['href'],
      id: json['id'],
      images: json['images'] != null
          ? List<Images>.from(json['images'].map((x) => Images.fromJson(x)))
          : null,
      name: json['name'],
      owner: json['owner'] != null ? Owner.fromJson(json['owner']) : null,
      primaryColor: json['primary_color'],
      public: json['public'],
      snapshotId: json['snapshot_id'],
      tracks: json['tracks'] != null ? Tracks.fromJson(json['tracks']) : null,
      type: json['type'],
      uri: json['uri'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'collaborative': collaborative,
      'description': description,
      'href': href,
      'id': id,
      'name': name,
      'primary_color': primaryColor,
      'public': public,
      'snapshot_id': snapshotId,
      'type': type,
      'uri': uri,
    };
    if (externalUrls != null) {
      data['external_urls'] = externalUrls!.toJson();
    }
    if (followers != null) {
      data['followers'] = followers!.toJson();
    }
    if (images != null) {
      data['images'] = images!.map((x) => x.toJson()).toList();
    }
    if (owner != null) {
      data['owner'] = owner!.toJson();
    }
    if (tracks != null) {
      data['tracks'] = tracks!.toJson();
    }
    return data;
  }
}

class ExternalUrls {
  String? spotify;

  ExternalUrls({this.spotify});

  factory ExternalUrls.fromJson(Map<String, dynamic> json) {
    return ExternalUrls(
      spotify: json['spotify'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'spotify': spotify,
    };
  }
}

class Followers {
  String? href;
  int? total;

  Followers({this.href, this.total});

  factory Followers.fromJson(Map<String, dynamic> json) {
    return Followers(
      href: json['href'],
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'href': href,
      'total': total,
    };
  }
}

class Images {
  int? height;
  String? url;
  int? width;

  Images({this.height, this.url, this.width});

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      height: json['height'],
      url: json['url'],
      width: json['width'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'height': height,
      'url': url,
      'width': width,
    };
  }
}

class Owner {
  String? displayName;
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  String? type;
  String? uri;

  Owner({
    this.displayName,
    this.externalUrls,
    this.href,
    this.id,
    this.type,
    this.uri,
  });

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      displayName: json['display_name'],
      externalUrls: json['external_urls'] != null
          ? ExternalUrls.fromJson(json['external_urls'])
          : null,
      href: json['href'],
      id: json['id'],
      type: json['type'],
      uri: json['uri'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'display_name': displayName,
      'href': href,
      'id': id,
      'type': type,
      'uri': uri,
    };
    if (externalUrls != null) {
      data['external_urls'] = externalUrls!.toJson();
    }
    return data;
  }
}

class Tracks {
  String? href;
  List<Items>? items;
  int? limit;
  String? next;
  int? offset;
  String? previous;
  int? total;

  Tracks({
    this.href,
    this.items,
    this.limit,
    this.next,
    this.offset,
    this.previous,
    this.total,
  });

  factory Tracks.fromJson(Map<String, dynamic> json) {
    return Tracks(
      href: json['href'],
      items: json['items'] != null
          ? List<Items>.from(json['items'].map((x) => Items.fromJson(x)))
          : null,
      limit: json['limit'],
      next: json['next'],
      offset: json['offset'],
      previous: json['previous'],
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'href': href,
      'limit': limit,
      'next': next,
      'offset': offset,
      'previous': previous,
      'total': total,
    };
    if (items != null) {
      data['items'] = items!.map((x) => x.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? addedAt;
  AddedBy? addedBy;
  bool? isLocal;
  String? primaryColor;
  Track? track;
  VideoThumbnail? videoThumbnail;

  Items({
    this.addedAt,
    this.addedBy,
    this.isLocal,
    this.primaryColor,
    this.track,
    this.videoThumbnail,
  });

  factory Items.fromJson(Map<String, dynamic> json) {
    return Items(
      addedAt: json['added_at'],
      addedBy: json['added_by'] != null ? AddedBy.fromJson(json['added_by']) : null,
      isLocal: json['is_local'],
      primaryColor: json['primary_color'],
      track: json['track'] != null ? Track.fromJson(json['track']) : null,
      videoThumbnail: json['video_thumbnail'] != null
          ? VideoThumbnail.fromJson(json['video_thumbnail'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'added_at': addedAt,
      'is_local': isLocal,
      'primary_color': primaryColor,
    };
    if (addedBy != null) {
      data['added_by'] = addedBy!.toJson();
    }
    if (track != null) {
      data['track'] = track!.toJson();
    }
    if (videoThumbnail != null) {
      data['video_thumbnail'] = videoThumbnail!.toJson();
    }
    return data;
  }
}

class AddedBy {
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  String? type;
  String? uri;

  AddedBy({
    this.externalUrls,
    this.href,
    this.id,
    this.type,
    this.uri,
  });

  factory AddedBy.fromJson(Map<String, dynamic> json) {
    return AddedBy(
      externalUrls: json['external_urls'] != null
          ? ExternalUrls.fromJson(json['external_urls'])
          : null,
      href: json['href'],
      id: json['id'],
      type: json['type'],
      uri: json['uri'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'href': href,
      'id': id,
      'type': type,
      'uri': uri,
    };
    if (externalUrls != null) {
      data['external_urls'] = externalUrls!.toJson();
    }
    return data;
  }
}

class Track {
  Album? album;
  List<Artists>? artists;
  List<String>? availableMarkets;
  int? discNumber;
  int? durationMs;
  bool? episode;
  bool? explicit;
  ExternalIds? externalIds;
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  bool? isLocal;
  String? name;
  int? popularity;
  String? previewUrl;
  bool? track;
  int? trackNumber;
  String? type;
  String? uri;

  Track({
    this.album,
    this.artists,
    this.availableMarkets,
    this.discNumber,
    this.durationMs,
    this.episode,
    this.explicit,
    this.externalIds,
    this.externalUrls,
    this.href,
    this.id,
    this.isLocal,
    this.name,
    this.popularity,
    this.previewUrl,
    this.track,
    this.trackNumber,
    this.type,
    this.uri,
  });

  factory Track.fromJson(Map<String, dynamic> json) {
    return Track(
      album: json['album'] != null ? Album.fromJson(json['album']) : null,
      artists: json['artists'] != null
          ? List<Artists>.from(json['artists'].map((x) => Artists.fromJson(x)))
          : null,
      availableMarkets: json['available_markets'] != null
          ? List<String>.from(json['available_markets'])
          : null,
      discNumber: json['disc_number'],
      durationMs: json['duration_ms'],
      episode: json['episode'],
      explicit: json['explicit'],
      externalIds: json['external_ids'] != null
          ? ExternalIds.fromJson(json['external_ids'])
          : null,
      externalUrls: json['external_urls'] != null
          ? ExternalUrls.fromJson(json['external_urls'])
          : null,
      href: json['href'],
      id: json['id'],
      isLocal: json['is_local'],
      name: json['name'],
      popularity: json['popularity'],
      previewUrl: json['preview_url'],
      track: json['track'],
      trackNumber: json['track_number'],
      type: json['type'],
      uri: json['uri'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'disc_number': discNumber,
      'duration_ms': durationMs,
      'episode': episode,
      'explicit': explicit,
      'href': href,
      'id': id,
      'is_local': isLocal,
      'name': name,
      'popularity': popularity,
      'preview_url': previewUrl,
      'track': track,
      'track_number': trackNumber,
      'type': type,
      'uri': uri,
    };
    if (album != null) {
      data['album'] = album!.toJson();
    }
    if (artists != null) {
      data['artists'] = artists!.map((x) => x.toJson()).toList();
    }
    if (externalIds != null) {
      data['external_ids'] = externalIds!.toJson();
    }
    if (externalUrls != null) {
      data['external_urls'] = externalUrls!.toJson();
    }
    if (availableMarkets != null) {
      data['available_markets'] = availableMarkets;
    }
    return data;
  }
}

class Album {
  String? albumType;
  List<Artists>? artists;
  List<String>? availableMarkets;
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  List<Images>? images;
  String? name;
  String? releaseDate;
  String? releaseDatePrecision;
  int? totalTracks;
  String? type;
  String? uri;

  Album({
    this.albumType,
    this.artists,
    this.availableMarkets,
    this.externalUrls,
    this.href,
    this.id,
    this.images,
    this.name,
    this.releaseDate,
    this.releaseDatePrecision,
    this.totalTracks,
    this.type,
    this.uri,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      albumType: json['album_type'],
      artists: json['artists'] != null
          ? List<Artists>.from(json['artists'].map((x) => Artists.fromJson(x)))
          : null,
      availableMarkets: json['available_markets'] != null
          ? List<String>.from(json['available_markets'])
          : null,
      externalUrls: json['external_urls'] != null
          ? ExternalUrls.fromJson(json['external_urls'])
          : null,
      href: json['href'],
      id: json['id'],
      images: json['images'] != null
          ? List<Images>.from(json['images'].map((x) => Images.fromJson(x)))
          : null,
      name: json['name'],
      releaseDate: json['release_date'],
      releaseDatePrecision: json['release_date_precision'],
      totalTracks: json['total_tracks'],
      type: json['type'],
      uri: json['uri'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'album_type': albumType,
      'href': href,
      'id': id,
      'name': name,
      'release_date': releaseDate,
      'release_date_precision': releaseDatePrecision,
      'total_tracks': totalTracks,
      'type': type,
      'uri': uri,
    };
    if (artists != null) {
      data['artists'] = artists!.map((x) => x.toJson()).toList();
    }
    if (availableMarkets != null) {
      data['available_markets'] = availableMarkets;
    }
    if (externalUrls != null) {
      data['external_urls'] = externalUrls!.toJson();
    }
    if (images != null) {
      data['images'] = images!.map((x) => x.toJson()).toList();
    }
    return data;
  }
}

class Artists {
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  String? name;
  String? type;
  String? uri;

  Artists({
    this.externalUrls,
    this.href,
    this.id,
    this.name,
    this.type,
    this.uri,
  });

  factory Artists.fromJson(Map<String, dynamic> json) {
    return Artists(
      externalUrls: json['external_urls'] != null
          ? ExternalUrls.fromJson(json['external_urls'])
          : null,
      href: json['href'],
      id: json['id'],
      name: json['name'],
      type: json['type'],
      uri: json['uri'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'href': href,
      'id': id,
      'name': name,
      'type': type,
      'uri': uri,
    };
    if (externalUrls != null) {
      data['external_urls'] = externalUrls!.toJson();
    }
    return data;
  }
}

class ExternalIds {
  String? isrc;

  ExternalIds({this.isrc});

  factory ExternalIds.fromJson(Map<String, dynamic> json) {
    return ExternalIds(
      isrc: json['isrc'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isrc': isrc,
    };
  }
}

class VideoThumbnail {
  String? url;

  VideoThumbnail({this.url});

  factory VideoThumbnail.fromJson(Map<String, dynamic> json) {
    return VideoThumbnail(
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
    };
  }
}

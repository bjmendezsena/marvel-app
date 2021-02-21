// To parse this JSON data, do
//
//     final serieResponse = serieResponseFromJson(jsonString);

import 'dart:convert';

SerieResponse serieResponseFromJson(String str) => SerieResponse.fromJson(json.decode(str));

String serieResponseToJson(SerieResponse data) => json.encode(data.toJson());

class SerieResponse {
    SerieResponse({
        this.code,
        this.status,
        this.copyright,
        this.attributionText,
        this.attributionHtml,
        this.etag,
        this.data,
    });

    int code;
    String status;
    String copyright;
    String attributionText;
    String attributionHtml;
    String etag;
    Data data;

    factory SerieResponse.fromJson(Map<String, dynamic> json) => SerieResponse(
        code: json["code"],
        status: json["status"],
        copyright: json["copyright"],
        attributionText: json["attributionText"],
        attributionHtml: json["attributionHTML"],
        etag: json["etag"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "copyright": copyright,
        "attributionText": attributionText,
        "attributionHTML": attributionHtml,
        "etag": etag,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        this.offset,
        this.limit,
        this.total,
        this.count,
        this.results,
    });

    int offset;
    int limit;
    int total;
    int count;
    List<Result> results;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        offset: json["offset"],
        limit: json["limit"],
        total: json["total"],
        count: json["count"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "offset": offset,
        "limit": limit,
        "total": total,
        "count": count,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Result {
    Result({
        this.id,
        this.title,
        this.description,
        this.resourceUri,
        this.urls,
        this.startYear,
        this.endYear,
        this.rating,
        this.type,
        this.modified,
        this.thumbnail,
        this.creators,
        this.characters,
        this.stories,
        this.comics,
        this.events,
        this.next,
        this.previous,
    });

    int id;
    String title;
    String description;
    String resourceUri;
    List<Url> urls;
    int startYear;
    int endYear;
    String rating;
    String type;
    String modified;
    Thumbnail thumbnail;
    Creators creators;
    Characters characters;
    Stories stories;
    Characters comics;
    Characters events;
    Next next;
    dynamic previous;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        resourceUri: json["resourceURI"],
        urls: List<Url>.from(json["urls"].map((x) => Url.fromJson(x))),
        startYear: json["startYear"],
        endYear: json["endYear"],
        rating: json["rating"],
        type: json["type"],
        modified: json["modified"],
        thumbnail: Thumbnail.fromJson(json["thumbnail"]),
        creators: Creators.fromJson(json["creators"]),
        characters: Characters.fromJson(json["characters"]),
        stories: Stories.fromJson(json["stories"]),
        comics: Characters.fromJson(json["comics"]),
        events: Characters.fromJson(json["events"]),
        next: Next.fromJson(json["next"]),
        previous: json["previous"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "resourceURI": resourceUri,
        "urls": List<dynamic>.from(urls.map((x) => x.toJson())),
        "startYear": startYear,
        "endYear": endYear,
        "rating": rating,
        "type": type,
        "modified": modified,
        "thumbnail": thumbnail.toJson(),
        "creators": creators.toJson(),
        "characters": characters.toJson(),
        "stories": stories.toJson(),
        "comics": comics.toJson(),
        "events": events.toJson(),
        "next": next.toJson(),
        "previous": previous,
    };
}

class Characters {
    Characters({
        this.available,
        this.collectionUri,
        this.items,
        this.returned,
    });

    int available;
    String collectionUri;
    List<Next> items;
    int returned;

    factory Characters.fromJson(Map<String, dynamic> json) => Characters(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: List<Next>.from(json["items"].map((x) => Next.fromJson(x))),
        returned: json["returned"],
    );

    Map<String, dynamic> toJson() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "returned": returned,
    };
}

class Next {
    Next({
        this.resourceUri,
        this.name,
    });

    String resourceUri;
    String name;

    factory Next.fromJson(Map<String, dynamic> json) => Next(
        resourceUri: json["resourceURI"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
    };
}

class Creators {
    Creators({
        this.available,
        this.collectionUri,
        this.items,
        this.returned,
    });

    int available;
    String collectionUri;
    List<CreatorsItem> items;
    int returned;

    factory Creators.fromJson(Map<String, dynamic> json) => Creators(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: List<CreatorsItem>.from(json["items"].map((x) => CreatorsItem.fromJson(x))),
        returned: json["returned"],
    );

    Map<String, dynamic> toJson() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "returned": returned,
    };
}

class CreatorsItem {
    CreatorsItem({
        this.resourceUri,
        this.name,
        this.role,
    });

    String resourceUri;
    String name;
    String role;

    factory CreatorsItem.fromJson(Map<String, dynamic> json) => CreatorsItem(
        resourceUri: json["resourceURI"],
        name: json["name"],
        role: json["role"],
    );

    Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
        "role": role,
    };
}

class Stories {
    Stories({
        this.available,
        this.collectionUri,
        this.items,
        this.returned,
    });

    int available;
    String collectionUri;
    List<StoriesItem> items;
    int returned;

    factory Stories.fromJson(Map<String, dynamic> json) => Stories(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: List<StoriesItem>.from(json["items"].map((x) => StoriesItem.fromJson(x))),
        returned: json["returned"],
    );

    Map<String, dynamic> toJson() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "returned": returned,
    };
}

class StoriesItem {
    StoriesItem({
        this.resourceUri,
        this.name,
        this.type,
    });

    String resourceUri;
    String name;
    Type type;

    factory StoriesItem.fromJson(Map<String, dynamic> json) => StoriesItem(
        resourceUri: json["resourceURI"],
        name: json["name"],
        type: typeValues.map[json["type"]],
    );

    Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
        "type": typeValues.reverse[type],
    };
}

enum Type { COVER, INTERIOR_STORY }

final typeValues = EnumValues({
    "cover": Type.COVER,
    "interiorStory": Type.INTERIOR_STORY
});

class Thumbnail {
    Thumbnail({
        this.path,
        this.extension,
    });

    String path;
    String extension;

    factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        path: json["path"],
        extension: json["extension"],
    );

    Map<String, dynamic> toJson() => {
        "path": path,
        "extension": extension,
    };
}

class Url {
    Url({
        this.type,
        this.url,
    });

    String type;
    String url;

    factory Url.fromJson(Map<String, dynamic> json) => Url(
        type: json["type"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "url": url,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}

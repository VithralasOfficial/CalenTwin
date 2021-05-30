
import 'UserBoundary.dart';

class ItemBoundary {
  ItemId itemId;
  String type;
  String name;
  bool active;
  String createTimestamp;
  CreatedBy createdBy;
  Location location;
  Map<String, dynamic> itemAttributes;

  ItemBoundary(this.itemId, this.type, this.name, this.active,
      this.createTimestamp, this.createdBy, this.location, this.itemAttributes);

  ItemBoundary.fromJson(Map<String, dynamic> json)
      : itemId = ItemId.fromJson(json['itemId']),
        type = json['type'],
        name = json['name'],
        active = json['active'],
        createTimestamp = json['createdTimestamp'],
        createdBy = CreatedBy.fromJson(json['createdBy']),
        location = Location.fromJson(json['location']),
        itemAttributes = json['itemAttributes'];

/*
  UserBoundary.fromJson(Map<String, dynamic> json)
      : userId = UserId.fromJson(jsonDecode(json['userId'])),
        role = json['role'],
        username = json['username'],
        avatar = json['avatar'];

  Map<String, dynamic> toJson() => {
  'userId' : userId.toJson(),
  'role' : role,
  'username' : username,
  'avatar' : avatar;


 */

}

class ItemId {
  String space;
  String id;

  ItemId(this.space, this.id);

  ItemId.fromJson(Map<String, dynamic> json)
      : space = json['space'],
        id = json['id'];

  Map<String, dynamic> toJson() => { "space" : space, "id" : id };
}

class CreatedBy {
  UserId userId;

  CreatedBy(this.userId);

  CreatedBy.fromJson(Map<String, dynamic> json)
      : userId = UserId.fromJson(json['userId']);

  Map<String, dynamic> toJson() {
    return {"userId" : userId.toJson()};
  }
}

class Location {
  double lat;
  double lng;

  Location(this.lat, this.lng);

  Location.fromJson(Map<String, dynamic> json)
      : lat = json['lat'],
        lng = json['lng'];

  Map<String, dynamic> toJson() => { "lat" : lat, "lng" : lng};
}

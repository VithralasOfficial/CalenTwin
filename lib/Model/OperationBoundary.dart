import 'package:integrative/Model/ItemBoundary.dart';
import 'package:integrative/Model/UserBoundary.dart';

class OperationBoundary {
  String type;
  OperationId operationId;
  OperationItem item;
  String createdTimestamp;
  InvokedBy invokedBy;
  Map<String, dynamic> operationAttributes;

  OperationBoundary(this.type, this.operationId, this.item,
      this.createdTimestamp, this.invokedBy, this.operationAttributes);

  OperationBoundary.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        operationId = OperationId.fromJson(json['operationId']),
        item = OperationItem.fromJson(json['item']),
        createdTimestamp = json['createdTimestamp'],
        invokedBy = InvokedBy.fromJson(json['invokedBy']),
        operationAttributes = json['operationAttributes'];

/*

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


   */

}

class OperationId {
  String space;
  String email;

  OperationId(this.space, this.email);

  OperationId.fromJson(Map<String, dynamic> json)
      : space = json['space'],
        email = json['email'];
}

class OperationItem {
  ItemId itemId;

  OperationItem(this.itemId);

  OperationItem.fromJson(Map<String, dynamic> json)
      : itemId = ItemId.fromJson(json['itemId']);

  Map<String, dynamic> toJson() {
    return {"itemId": itemId.toJson()};
  }
}

class InvokedBy {
  UserId userId;

  InvokedBy(this.userId);

  Map<String, dynamic> toJson() {
    return {"userId": userId.toJson()};
  }

  InvokedBy.fromJson(Map<String, dynamic> json)
      : userId = UserId.fromJson(json['userId']);
}

import 'package:http/http.dart' as http;
import 'package:integrative/Model/ItemBoundary.dart';
import 'dart:convert';

import 'package:integrative/Model/NewUserDetails.dart';
import 'package:integrative/Model/OperationBoundary.dart';
import 'package:integrative/Model/UserBoundary.dart';
import 'package:integrative/constants.dart';

// ---------- User Related API ---------------

void createNewUser(String email, String username, String avatar,
    Function onLoaded(UserBoundary userBoundary)) async {
  var client = http.Client();

  try {
    var uriResponse = await client.post(
        Uri.http("10.0.2.2:8041", "/twins/users"),
        body: jsonEncode({
          'email': email,
          'role': 'PLAYER',
          'username': username,
          'avatar': avatar
        }),
        headers: kJsonHeaders);

    onLoaded(UserBoundary.fromJson(jsonDecode(uriResponse.body)));
  } finally {
    client.close();
  }
}

// Logins valid user and retrieves user details
void loginValidUser(
    String email, Function onLoaded(UserBoundary userBoundary)) async {
  var client = http.Client();

  try {
    var uriResponse = await client.get(
        Uri.http("10.0.2.2:8041", "/twins/users/login/$kSpace/$email"),
        headers: kJsonHeaders);

    onLoaded(UserBoundary.fromJson(jsonDecode(uriResponse.body)));
  } finally {
    client.close();
  }
}

void updateUserDetails(String email, UserBoundary updatedUser) async {
  var client = http.Client();

  try {
    await client.put(Uri.http("10.0.2.2:8041", "/twins/users/$kSpace/$email"),
        headers: kJsonHeaders, body: updatedUser.toJson());
  } finally {
    client.close();
  }
}

// ---------- Digital Items Related API ---------------

void createNewItem(
    String id,
    String type,
    String name,
    bool active,
    String userEmail,
    Location location,
    Map<String, dynamic> attributes,
    Function onLoaded(ItemBoundary itemBoundary)) async {
  var client = http.Client();

  try {
    var uriResponse = await client.post(
        Uri.http("10.0.2.2:8041", "/twins/items/$kSpace/$userEmail"),
        body: jsonEncode({
          'itemId': jsonEncode(ItemId(kSpace, id)),
          'type': type,
          'createdBy': jsonEncode(CreatedBy(UserId(kSpace, userEmail))),
          'location': jsonEncode(location),
          'itemAttributes': jsonEncode(attributes)
        }),
        headers: kJsonHeaders);

    onLoaded(ItemBoundary.fromJson(jsonDecode(uriResponse.body)));
  } finally {
    client.close();
  }
}

void updateItem(
    String id,
    String type,
    String name,
    bool active,
    String userEmail,
    Location location,
    Map<String, dynamic> attributes) async {
  var client = http.Client();

  try {
    await client.put(
        Uri.http("10.0.2.2:8041", "/twins/items/$kSpace/$userEmail/$id"),
        body: jsonEncode({
          'itemId': jsonEncode(ItemId(kSpace, id)),
          'type': type,
          'createdBy': jsonEncode(CreatedBy(UserId(kSpace, userEmail))),
          'location': jsonEncode(location),
          'itemAttributes': jsonEncode(attributes)
        }),
        headers: kJsonHeaders);
  } finally {
    client.close();
  }
}

void retrieveItem(String id, String userEmail,
    Function onLoaded(ItemBoundary itemBoundary)) async {
  var client = http.Client();

  try {
    var uriResponse = await client.get(
        Uri.http("10.0.2.2:8041", "/twins/items/$kSpace/$userEmail/$id"),
        headers: kJsonHeaders);

    onLoaded(ItemBoundary.fromJson(jsonDecode(uriResponse.body)));
  } finally {
    client.close();
  }
}

void getAllItems(String id, String userEmail,
    Function onLoaded(List<ItemBoundary> allItems)) async {
  var client = http.Client();

  try {
    var uriResponse = await client.get(
        Uri.http("10.0.2.2:8041", "/twins/items/$kSpace"),
        headers: kJsonHeaders);

    // Not 100% sure about this conversion, need to debug that by printing the results
    List<ItemBoundary> result = jsonDecode(uriResponse.body);

    onLoaded(result);
  } finally {
    client.close();
  }
}

// ----------- Operations Related API -------------

void invokeOperation(String type, String itemId, String userEmail,
    Map<String, dynamic> attributes, Function onInvoked(dynamic object)) async {
  var client = http.Client();

  try {
    var response =
        await client.post(Uri.http("10.0.2.2:8041", "/twins/operations"),
            body: jsonEncode({
              'item': jsonEncode(OperationItem(ItemId(kSpace, itemId))),
              'type': type,
              'operationId': null,
              'invokedBy': jsonEncode(InvokedBy(UserId(kSpace, userEmail))),
              'itemAttributes': jsonEncode(attributes)
            }),
            headers: kJsonHeaders);

    onInvoked(jsonDecode(response.body));
  } finally {
    client.close();
  }
}

void invokeOperationAsync(
    String type,
    String itemId,
    String userEmail,
    Map<String, dynamic> attributes,
    Function onInitialized(OperationBoundary operation)) async {
  var client = http.Client();

  try {
    var response =
        await client.post(Uri.http("10.0.2.2:8041", "/twins/operations/async"),
            body: jsonEncode({
              'item': jsonEncode(OperationItem(ItemId(kSpace, itemId))),
              'type': type,
              'operationId': null,
              'invokedBy': jsonEncode(InvokedBy(UserId(kSpace, userEmail))),
              'itemAttributes': jsonEncode(attributes)
            }),
            headers: kJsonHeaders);

    onInitialized(OperationBoundary.fromJson(jsonDecode(response.body)));
  } finally {
    client.close();
  }
}

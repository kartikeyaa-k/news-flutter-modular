import 'dart:async';

import 'package:sembast/sembast.dart';
import 'package:storage_layer/models/truck_model.dart';
import 'package:storage_layer/models/user_model.dart';
import 'package:storage_layer/utils/constants/storage_titles.dart';

import 'models/product_model.dart';
import 'src/sembast_storage_service.dart';

class LocalStorageService {
  late final SembastStorageService _sembastStorageService;

  LocalStorageService(SembastStorageService sembastStorageService)
      : _sembastStorageService = sembastStorageService;

  Future<Database> get initLocalStorage async =>
      await _sembastStorageService.database;

  Future<String> getAuthToken() async {
    final tokenStore = intMapStoreFactory.store(StorageTitles.authTokenFolder);
    var token = await tokenStore.record(0).get(await initLocalStorage);
    String title = token!["auth_token"] as String;
    return title;
  }

  Future<void> setAuthToken({
    required String authToken,
  }) async {
    final token = {"auth_token": authToken};
    final tokenStore = intMapStoreFactory.store(StorageTitles.authTokenFolder);
    await tokenStore.record(0).put(await initLocalStorage, token);
  }

  Future<void> setUser(User user) async {
    final userStore = intMapStoreFactory.store(StorageTitles.userFolder);
    await userStore.record(0).put(await initLocalStorage, user.toJson());
  }

  Future<void> logoutUser(User user) async {
    final userStore = intMapStoreFactory.store(StorageTitles.userFolder);
    await userStore.record(0).delete(await initLocalStorage);
  }

  Future<User?> getUser() async {
    final userStore = intMapStoreFactory.store(StorageTitles.userFolder);
    final json = await userStore.record(0).get(await initLocalStorage);
    if (json == null) return null;
    return User.fromJson(json);
  }

  Future<void> setCart(List<Product> products, Truck truck) async {
    final productList = {
      "truck": truck.toJson(),
      "products": Product.jsonFromList(products)
    };
    final cartStore = intMapStoreFactory.store(StorageTitles.cartFolder);
    await cartStore.record(0).put(await initLocalStorage, productList);
  }

  Future<Map<String, dynamic>> getCart() async {
    final cartStore = intMapStoreFactory.store(StorageTitles.cartFolder);
    final mappedProducts =
        await cartStore.record(0).get(await initLocalStorage);
    final products = mappedProducts != null && mappedProducts != {}
        ? mappedProducts["products"] as List
        : [];
    final truck = mappedProducts != null && mappedProducts != {}
        ? mappedProducts["truck"] as Map<String, dynamic>
        : null;
    return (truck != null)
        ? {
            "products": Product.listFromJson(products),
            "truck": Truck.fromJson(truck),
          }
        : {
            "products": Product.listFromJson(products),
            "truck": null,
          };
  }

  Future<void> removeCart(Truck? truck) async {
    final cartStore = intMapStoreFactory.store(StorageTitles.cartFolder);
    await cartStore.record(0).delete(await initLocalStorage);
  }

  Future<bool> getPushNotificationConfigHistory() async {
    final store =
        intMapStoreFactory.store(StorageTitles.pushNotificationFolder);
    final json = await store.record(0).get(await initLocalStorage);
    if (json == null) return false;
    var isTokenSaved = json['isTokenSaved'] as bool;
    return isTokenSaved;
  }

  Future<void> setPushNotificationConfigHistory({
    required bool isTokenSaved,
  }) async {
    final data = {
      "isTokenSaved": isTokenSaved,
    };
    final notificationConfigStore =
        intMapStoreFactory.store(StorageTitles.pushNotificationFolder);
    await notificationConfigStore.record(0).put(await initLocalStorage, data);
  }
}

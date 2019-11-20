import 'dart:collection';
import 'dart:convert';

import 'package:sqflite/sqflite.dart';

class LocalStorage {
  static Database database;
  static init() async {
    database = await openDatabase("db.sqlite",
        version: 1,
        onOpen: (status) {},
        onCreate: (Database db, int version) async {});

    await database.execute(
        'CREATE TABLE IF NOT EXISTS local_storage (key TEXT, value BLOB)');
    await database.execute(
      'CREATE TABLE IF NOT EXISTS permanent_local_storage (key TEXT, value BLOB)',
    );
  }

  static Future clearLocalStorage() async {
    await database.execute('DELETE FROM local_storage');
  }

  static Future save(key, value) async {
    try {
      if (value == null) {
        value = "";
      }
      if (database == null) await init();

      await database.execute("delete from local_storage where key = ?", [key]);
      await database.execute("insert into local_storage values(?,?)", [
        key,
        value,
      ]);
    } catch (e) {
      print("Error to Save LocalStorage with key: $key");
    }
  }

  static Future savePermanent(key, value) async {
    try {
      if (value == null) {
        value = "";
      }
      if (database == null) await init();

      await database
          .execute("delete from permanent_local_storage where key = ?", [key]);
      await database
          .execute("insert into permanent_local_storage values(?,?)", [
        key,
        value,
      ]);
    } catch (e) {
      print("Error to Save LocalStorage with key: $key");
    }
  }

  static Future deletePermanent(key) async {
    try {
      if (database == null) await init();

      await database
          .execute("delete from permanent_local_storage where key = ?", [key]);
    } catch (e) {
      print("Error to Save LocalStorage with key: $key");
    }
  }

  static Future saveJson(key, value) async {
    value = jsonEncode(value);
    try {
      if (database == null) await init();

      await database.execute("delete from local_storage where key = ?", [key]);
      await database.execute("insert into local_storage values(?,?)", [
        key,
        value,
      ]);
    } catch (e) {
      print("Error to Save LocalStorage with key: $key");
    }
  }

  static Future load(String key) async {
    if (database == null) await init();
    List<Map> list = await database
        .rawQuery('SELECT * FROM local_storage where key = ?', [key]);

    if (list.length > 0) {
      if (list[0]["value"] == null) {
        return "";
      }
      return Future.value(list[0]["value"]);
    }
    return "";
  }

  static Future loadPermanent(String key) async {
    if (database == null) await init();
    List<Map> list = await database
        .rawQuery('SELECT * FROM permanent_local_storage where key = ?', [key]);

    if (list.length > 0) {
      if (list[0]["value"] == null) {
        return "";
      }
      return Future.value(list[0]["value"]);
    }
    return "";
  }

  static Future<Map> loadMap(String key) async {
    if (database == null) await init();
    List<Map> list = await database
        .rawQuery('SELECT * FROM local_storage where key = ?', [key]);

    if (list.length > 0) {
      if (list[0]["value"] == null) {
        return Future.value({});
      }

      Map returnedData = {};
      try {
        returnedData = jsonDecode(list[0]["value"]);
      } catch (e) {
        returnedData = {};
      }
      return Future.value(returnedData);
    }

    Map<String, dynamic> returnedData = new HashMap();
    return Future.value(returnedData);
  }

  static Future<bool> loadBoolean(String key) async {
    if (database == null) await init();
    List<Map> list = await database
        .rawQuery('SELECT * FROM local_storage where key = ?', [key]);

    if (list.length > 0) {
      if (list[0]["value"] == null) {
        return false;
      }

      bool returnedData = false;
      try {
        returnedData = list[0]["value"];
      } catch (e) {
        returnedData = false;
      }
      return returnedData;
    }
    return false;
  }

  static Future<List<dynamic>> loadList(String key) async {
    if (database == null) await init();
    List<Map> list = await database
        .rawQuery('SELECT * FROM local_storage where key = ?', [key]);

    if (list.length > 0) {
      if (list[0]["value"] == null) {
        return [];
      }

      List returnedData = [];
      try {
        returnedData = jsonDecode(list[0]["value"]);
      } catch (e) {
        returnedData = [];
      }
      return returnedData;
    }
    return [];
  }
}

class LS extends LocalStorage {}

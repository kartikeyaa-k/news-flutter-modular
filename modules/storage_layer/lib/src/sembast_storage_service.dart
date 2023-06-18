import 'dart:async';

import 'package:path_provider/path_provider.dart';

// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as p;
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:storage_layer/utils/constants/storage_titles.dart';

import '../utils/encryption/encrypt_codec.dart';

class SembastStorageService {
// Singleton instance
  static final SembastStorageService _singleton = SembastStorageService._();

// Singleton accessor
  static SembastStorageService get instance => _singleton;

  // Completer is used for transforming synchronous code into asynchronous code.
  Completer<Database>? _dbOpenCompleter;

  // A private constructor. Allows us to create instances of AppDatabase
  // only from within the AppDatabase class itself.
  SembastStorageService._();

  // Database object accessor
  Future<Database> get database async {
    // If completer is null, AppDatabaseClass is newly instantiated, so database is not yet opened
    if (_dbOpenCompleter == null) {
      _dbOpenCompleter = Completer();
      // Calling _openDatabase will also complete the completer with database instance
      _openDatabase();
    }
    // If the database is already opened, awaiting the future will happen instantly.
    // Otherwise, awaiting the returned future will take some time - until complete() is called
    // on the Completer in _openDatabase() below.
    return _dbOpenCompleter!.future;
  }

  Future _openDatabase() async {
    // Get a platform-specific directory where persistent app data can be stored
    final appDocumentDir = await getApplicationDocumentsDirectory();
    // Path with the form: /platform-specific-directory/demo.db
    final dbPath = p.join(appDocumentDir.path, StorageTitles.dbName);

    // Initialize the encryption codec with a user password
    var codec = getEncryptSembastCodec(password: StorageTitles.dbKey);

    final database = await databaseFactoryIo.openDatabase(
      dbPath,
      version: StorageTitles.dbVersion,
      onVersionChanged: ((db, oldVersion, newVersion) {}),
      codec: codec,
    );

    // Any code awaiting the Completer's future will now start executing
    _dbOpenCompleter?.complete(database);
  }
}

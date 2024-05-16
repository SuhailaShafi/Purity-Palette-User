import 'package:get_storage/get_storage.dart';

class SLocalStorage {
  //static final SLocalStorage _instance = SLocalStorage._internal();
  static SLocalStorage? _instance;
  late final GetStorage _storage;
  factory SLocalStorage.instance() {
    _instance ??= SLocalStorage._internal();
    return _instance!;
  }
  SLocalStorage._internal();
  static Future<void> init(String bucketname) async {
    await GetStorage.init(bucketname);
    _instance = SLocalStorage._internal();
    _instance!._storage = GetStorage(bucketname);
  }

//Generic method to save data
  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  Future<void> clearAll() async {
    await _storage.erase();
  }
}

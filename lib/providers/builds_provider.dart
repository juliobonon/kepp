import 'package:kepp/models/keyboard.dart';
import 'package:kepp/services/database.dart';

class BuildProvider {
  final databaseService = DatabaseService();

  String _name;
  String _keyboardswitch;
  String _keycap;
  String _pcb;
  String _keyboardcase;

  String get name => _name;
  String get keyboard => _keyboardswitch;
  String get keycap => _keycap;
  String get pcb => _pcb;
  String get keyboardcase => _keyboardcase;

  Stream<List<KeyboardBuild>> get products => databaseService.getProducts();
}

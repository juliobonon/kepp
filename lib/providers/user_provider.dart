import 'package:kepp/services/database.dart';

class KeppUserProvider {
  final databaseService = DatabaseService();

  String _name;
  String _avatarImage;

  String get name => _name;
  String get keyboard => _avatarImage;
}

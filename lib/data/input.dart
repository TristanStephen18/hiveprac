import 'package:hive/hive.dart';

part 'input.g.dart';

@HiveType(typeId: 1)
class Datainput{
  @HiveField(0)
  String input;

  @HiveField(1)
  bool isfav;
  
  Datainput({
    required this.input,
    this.isfav = false,
  });
}
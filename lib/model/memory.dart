import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:quiver/core.dart';

part 'memory.g.dart';

@immutable
@JsonSerializable()
class Memory {
  final String verse;
  final String verseText;

  Memory({this.verse, this.verseText});

  factory Memory.fromJson(Map<String, dynamic> json) => _$MemoryFromJson(json);

  Map<String, dynamic> toJson() => _$MemoryToJson(this);

  @override
  int get hashCode => hash2(verse, verseText);

  @override
  operator ==(o) => o is Memory && o.verse == verse && o.verseText == verseText;
}

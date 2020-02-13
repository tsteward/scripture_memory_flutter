import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:quiver/core.dart';
import 'package:uuid/uuid.dart';

part 'memory.g.dart';

var _uuid = Uuid();

@immutable
@JsonSerializable()
class Memory {
  final String id;
  final String verse;
  final String verseText;

  factory Memory({String verse, String verseText, String id}) {
    if (id == null) {
      id = _uuid.v1();
    }
    return Memory._internal(verse: verse, verseText: verseText, id: id);
  }

  Memory._internal({this.verse, this.verseText, this.id});

  factory Memory.fromJson(Map<String, dynamic> json) => _$MemoryFromJson(json);

  Map<String, dynamic> toJson() => _$MemoryToJson(this);

  @override
  int get hashCode => hash3(id, verse, verseText);

  @override
  operator ==(o) =>
      o is Memory && o.id == id && o.verse == verse && o.verseText == verseText;
}

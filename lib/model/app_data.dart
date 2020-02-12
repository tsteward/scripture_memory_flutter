import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:quiver/core.dart';

import 'memory.dart';

part 'app_data.g.dart';

@immutable
@JsonSerializable()
class AppData {
  final List<Memory> memories;

  AppData({this.memories});

  factory AppData.fromJson(Map<String, dynamic> json) =>
      _$AppDataFromJson(json);

  Map<String, dynamic> toJson() => _$AppDataToJson(this);

  @override
  int get hashCode => hashObjects(memories);

  @override
  operator ==(o) => o is AppData && listEquals(o.memories, memories);
}

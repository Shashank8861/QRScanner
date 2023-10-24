// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QRItemStruct extends BaseStruct {
  QRItemStruct({
    DateTime? date,
    String? link,
    String? type,
  })  : _date = date,
        _link = link,
        _type = type;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;
  bool hasDate() => _date != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  set link(String? val) => _link = val;
  bool hasLink() => _link != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;
  bool hasType() => _type != null;

  static QRItemStruct fromMap(Map<String, dynamic> data) => QRItemStruct(
        date: data['date'] as DateTime?,
        link: data['link'] as String?,
        type: data['type'] as String?,
      );

  static QRItemStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? QRItemStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'date': _date,
        'link': _link,
        'type': _type,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'link': serializeParam(
          _link,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
      }.withoutNulls;

  static QRItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      QRItemStruct(
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        link: deserializeParam(
          data['link'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'QRItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is QRItemStruct &&
        date == other.date &&
        link == other.link &&
        type == other.type;
  }

  @override
  int get hashCode => const ListEquality().hash([date, link, type]);
}

QRItemStruct createQRItemStruct({
  DateTime? date,
  String? link,
  String? type,
}) =>
    QRItemStruct(
      date: date,
      link: link,
      type: type,
    );

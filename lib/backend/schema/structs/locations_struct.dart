// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LocationsStruct extends BaseStruct {
  LocationsStruct({
    int? id,
    String? name,
    LatLng? centerLatLng,
    String? csdsString,
  })  : _id = id,
        _name = name,
        _centerLatLng = centerLatLng,
        _csdsString = csdsString;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "center_latLng" field.
  LatLng? _centerLatLng;
  LatLng? get centerLatLng => _centerLatLng;
  set centerLatLng(LatLng? val) => _centerLatLng = val;
  bool hasCenterLatLng() => _centerLatLng != null;

  // "csdsString" field.
  String? _csdsString;
  String get csdsString => _csdsString ?? '';
  set csdsString(String? val) => _csdsString = val;
  bool hasCsdsString() => _csdsString != null;

  static LocationsStruct fromMap(Map<String, dynamic> data) => LocationsStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
        centerLatLng: data['center_latLng'] as LatLng?,
        csdsString: data['csdsString'] as String?,
      );

  static LocationsStruct? maybeFromMap(dynamic data) => data is Map
      ? LocationsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'center_latLng': _centerLatLng,
        'csdsString': _csdsString,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'center_latLng': serializeParam(
          _centerLatLng,
          ParamType.LatLng,
        ),
        'csdsString': serializeParam(
          _csdsString,
          ParamType.String,
        ),
      }.withoutNulls;

  static LocationsStruct fromSerializableMap(Map<String, dynamic> data) =>
      LocationsStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        centerLatLng: deserializeParam(
          data['center_latLng'],
          ParamType.LatLng,
          false,
        ),
        csdsString: deserializeParam(
          data['csdsString'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LocationsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LocationsStruct &&
        id == other.id &&
        name == other.name &&
        centerLatLng == other.centerLatLng &&
        csdsString == other.csdsString;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, name, centerLatLng, csdsString]);
}

LocationsStruct createLocationsStruct({
  int? id,
  String? name,
  LatLng? centerLatLng,
  String? csdsString,
}) =>
    LocationsStruct(
      id: id,
      name: name,
      centerLatLng: centerLatLng,
      csdsString: csdsString,
    );

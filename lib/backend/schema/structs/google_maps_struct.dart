// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GoogleMapsStruct extends BaseStruct {
  GoogleMapsStruct({
    LatLng? latlng,
  }) : _latlng = latlng;

  // "Latlng" field.
  LatLng? _latlng;
  LatLng? get latlng => _latlng;
  set latlng(LatLng? val) => _latlng = val;
  bool hasLatlng() => _latlng != null;

  static GoogleMapsStruct fromMap(Map<String, dynamic> data) =>
      GoogleMapsStruct(
        latlng: data['Latlng'] as LatLng?,
      );

  static GoogleMapsStruct? maybeFromMap(dynamic data) => data is Map
      ? GoogleMapsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Latlng': _latlng,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Latlng': serializeParam(
          _latlng,
          ParamType.LatLng,
        ),
      }.withoutNulls;

  static GoogleMapsStruct fromSerializableMap(Map<String, dynamic> data) =>
      GoogleMapsStruct(
        latlng: deserializeParam(
          data['Latlng'],
          ParamType.LatLng,
          false,
        ),
      );

  @override
  String toString() => 'GoogleMapsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GoogleMapsStruct && latlng == other.latlng;
  }

  @override
  int get hashCode => const ListEquality().hash([latlng]);
}

GoogleMapsStruct createGoogleMapsStruct({
  LatLng? latlng,
}) =>
    GoogleMapsStruct(
      latlng: latlng,
    );

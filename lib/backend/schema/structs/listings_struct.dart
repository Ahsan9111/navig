// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ListingsStruct extends BaseStruct {
  ListingsStruct({
    List<ListingsStruct>? listing,
  }) : _listing = listing;

  // "Listing" field.
  List<ListingsStruct>? _listing;
  List<ListingsStruct> get listing => _listing ?? const [];
  set listing(List<ListingsStruct>? val) => _listing = val;
  void updateListing(Function(List<ListingsStruct>) updateFn) =>
      updateFn(_listing ??= []);
  bool hasListing() => _listing != null;

  static ListingsStruct fromMap(Map<String, dynamic> data) => ListingsStruct(
        listing: getStructList(
          data['Listing'],
          ListingsStruct.fromMap,
        ),
      );

  static ListingsStruct? maybeFromMap(dynamic data) =>
      data is Map ? ListingsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Listing': _listing?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Listing': serializeParam(
          _listing,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static ListingsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ListingsStruct(
        listing: deserializeStructParam<ListingsStruct>(
          data['Listing'],
          ParamType.DataStruct,
          true,
          structBuilder: ListingsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ListingsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ListingsStruct &&
        listEquality.equals(listing, other.listing);
  }

  @override
  int get hashCode => const ListEquality().hash([listing]);
}

ListingsStruct createListingsStruct() => ListingsStruct();

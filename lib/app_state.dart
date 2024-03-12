import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _Listings1 = prefs
              .getStringList('ff_Listings1')
              ?.map((x) {
                try {
                  return ListingsStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _Listings1;
    });
    _safeInit(() {
      _coordinates =
          latLngFromString(prefs.getString('ff_coordinates')) ?? _coordinates;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _listingId = '';
  String get listingId => _listingId;
  set listingId(String value) {
    _listingId = value;
  }

  bool _isOrg = false;
  bool get isOrg => _isOrg;
  set isOrg(bool value) {
    _isOrg = value;
  }

  bool _searchActive = false;
  bool get searchActive => _searchActive;
  set searchActive(bool value) {
    _searchActive = value;
  }

  dynamic _Listing;
  dynamic get Listing => _Listing;
  set Listing(dynamic value) {
    _Listing = value;
  }

  List<ListingsStruct> _Listings1 = [];
  List<ListingsStruct> get Listings1 => _Listings1;
  set Listings1(List<ListingsStruct> value) {
    _Listings1 = value;
    prefs.setStringList(
        'ff_Listings1', value.map((x) => x.serialize()).toList());
  }

  void addToListings1(ListingsStruct value) {
    _Listings1.add(value);
    prefs.setStringList(
        'ff_Listings1', _Listings1.map((x) => x.serialize()).toList());
  }

  void removeFromListings1(ListingsStruct value) {
    _Listings1.remove(value);
    prefs.setStringList(
        'ff_Listings1', _Listings1.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromListings1(int index) {
    _Listings1.removeAt(index);
    prefs.setStringList(
        'ff_Listings1', _Listings1.map((x) => x.serialize()).toList());
  }

  void updateListings1AtIndex(
    int index,
    ListingsStruct Function(ListingsStruct) updateFn,
  ) {
    _Listings1[index] = updateFn(_Listings1[index]);
    prefs.setStringList(
        'ff_Listings1', _Listings1.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInListings1(int index, ListingsStruct value) {
    _Listings1.insert(index, value);
    prefs.setStringList(
        'ff_Listings1', _Listings1.map((x) => x.serialize()).toList());
  }

  bool _displayFilter = false;
  bool get displayFilter => _displayFilter;
  set displayFilter(bool value) {
    _displayFilter = value;
  }

  String _searchName = '';
  String get searchName => _searchName;
  set searchName(String value) {
    _searchName = value;
  }

  LatLng? _coordinates = const LatLng(55.170691, -118.7884808);
  LatLng? get coordinates => _coordinates;
  set coordinates(LatLng? value) {
    _coordinates = value;
    value != null
        ? prefs.setString('ff_coordinates', value.serialize())
        : prefs.remove('ff_coordinates');
  }

  bool _search1active = false;
  bool get search1active => _search1active;
  set search1active(bool value) {
    _search1active = value;
  }

  String _sampleString = '';
  String get sampleString => _sampleString;
  set sampleString(String value) {
    _sampleString = value;
  }

  List<LatLng> _testcoord = [];
  List<LatLng> get testcoord => _testcoord;
  set testcoord(List<LatLng> value) {
    _testcoord = value;
  }

  void addToTestcoord(LatLng value) {
    _testcoord.add(value);
  }

  void removeFromTestcoord(LatLng value) {
    _testcoord.remove(value);
  }

  void removeAtIndexFromTestcoord(int index) {
    _testcoord.removeAt(index);
  }

  void updateTestcoordAtIndex(
    int index,
    LatLng Function(LatLng) updateFn,
  ) {
    _testcoord[index] = updateFn(_testcoord[index]);
  }

  void insertAtIndexInTestcoord(int index, LatLng value) {
    _testcoord.insert(index, value);
  }

  double _selectedGeoCode = 4819012.0;
  double get selectedGeoCode => _selectedGeoCode;
  set selectedGeoCode(double value) {
    _selectedGeoCode = value;
  }

  List<LocationsStruct> _locations = [
    LocationsStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"0\",\"name\":\"Grande Prairie\",\"center_latLng\":\"55.170834,-118.794724\",\"csdsString\":\"4819012,4819006\"}')),
    LocationsStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"1\",\"name\":\"Sunshine Coast\",\"center_latLng\":\"49.633912,-123.734169\",\"csdsString\":\"5929022,5929026,5929028,5929018,5929024,5929005,5929801,5929011,5929803\"}'))
  ];
  List<LocationsStruct> get locations => _locations;
  set locations(List<LocationsStruct> value) {
    _locations = value;
  }

  void addToLocations(LocationsStruct value) {
    _locations.add(value);
  }

  void removeFromLocations(LocationsStruct value) {
    _locations.remove(value);
  }

  void removeAtIndexFromLocations(int index) {
    _locations.removeAt(index);
  }

  void updateLocationsAtIndex(
    int index,
    LocationsStruct Function(LocationsStruct) updateFn,
  ) {
    _locations[index] = updateFn(_locations[index]);
  }

  void insertAtIndexInLocations(int index, LocationsStruct value) {
    _locations.insert(index, value);
  }

  LocationsStruct _selectedLocality = LocationsStruct();
  LocationsStruct get selectedLocality => _selectedLocality;
  set selectedLocality(LocationsStruct value) {
    _selectedLocality = value;
  }

  void updateSelectedLocalityStruct(Function(LocationsStruct) updateFn) {
    updateFn(_selectedLocality);
  }

  LocationsStruct _defaultLocality = LocationsStruct.fromSerializableMap(jsonDecode(
      '{\"id\":\"0\",\"name\":\"Grande Prairie\",\"center_latLng\":\"55.170834,-118.794724\",\"csdsString\":\"4819012,4819006\"}'));
  LocationsStruct get defaultLocality => _defaultLocality;
  set defaultLocality(LocationsStruct value) {
    _defaultLocality = value;
  }

  void updateDefaultLocalityStruct(Function(LocationsStruct) updateFn) {
    updateFn(_defaultLocality);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

import '../database.dart';

class ProgramsTable extends SupabaseTable<ProgramsRow> {
  @override
  String get tableName => 'programs';

  @override
  ProgramsRow createRow(Map<String, dynamic> data) => ProgramsRow(data);
}

class ProgramsRow extends SupabaseDataRow {
  ProgramsRow(super.data);

  @override
  SupabaseTable get table => ProgramsTable();

  String get mastersheetUniqueId => getField<String>('mastersheet_unique_id')!;
  set mastersheetUniqueId(String value) =>
      setField<String>('mastersheet_unique_id', value);

  String get clusterId => getField<String>('cluster_id')!;
  set clusterId(String value) => setField<String>('cluster_id', value);

  String get progName => getField<String>('prog_name')!;
  set progName(String value) => setField<String>('prog_name', value);

  String? get facilityLocationType =>
      getField<String>('facility_location_type');
  set facilityLocationType(String? value) =>
      setField<String>('facility_location_type', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get contactEmail => getField<String>('contact_email');
  set contactEmail(String? value) => setField<String>('contact_email', value);

  String? get websiteUrl => getField<String>('website_url');
  set websiteUrl(String? value) => setField<String>('website_url', value);

  String? get contactPhone => getField<String>('contact_phone');
  set contactPhone(String? value) => setField<String>('contact_phone', value);

  String? get coordinate => getField<String>('coordinate');
  set coordinate(String? value) => setField<String>('coordinate', value);

  String? get address => getField<String>('address');
  set address(String? value) => setField<String>('address', value);

  int get regionCode => getField<int>('region_code')!;
  set regionCode(int value) => setField<int>('region_code', value);

  int get provinceCode => getField<int>('province_code')!;
  set provinceCode(int value) => setField<int>('province_code', value);

  double? get latitude => getField<double>('latitude');
  set latitude(double? value) => setField<double>('latitude', value);

  double? get longitude => getField<double>('longitude');
  set longitude(double? value) => setField<double>('longitude', value);

  DateTime get lastUpdate => getField<DateTime>('last_update')!;
  set lastUpdate(DateTime value) => setField<DateTime>('last_update', value);

  String? get daysTime => getField<String>('days_time');
  set daysTime(String? value) => setField<String>('days_time', value);

  String? get progSearchVector => getField<String>('prog_search_vector');
  set progSearchVector(String? value) =>
      setField<String>('prog_search_vector', value);

  String get advancedMapping => getField<String>('advanced_mapping')!;
  set advancedMapping(String value) =>
      setField<String>('advanced_mapping', value);

  String? get postalCode => getField<String>('postal_code');
  set postalCode(String? value) => setField<String>('postal_code', value);

  String? get popConsiderations => getField<String>('pop_considerations');
  set popConsiderations(String? value) =>
      setField<String>('pop_considerations', value);
}

import '../database.dart';

class OrganizationsTable extends SupabaseTable<OrganizationsRow> {
  @override
  String get tableName => 'organizations';

  @override
  OrganizationsRow createRow(Map<String, dynamic> data) =>
      OrganizationsRow(data);
}

class OrganizationsRow extends SupabaseDataRow {
  OrganizationsRow(super.data);

  @override
  SupabaseTable get table => OrganizationsTable();

  String get mastersheetUniqueId => getField<String>('mastersheet_unique_id')!;
  set mastersheetUniqueId(String value) =>
      setField<String>('mastersheet_unique_id', value);

  String get clusterId => getField<String>('cluster_id')!;
  set clusterId(String value) => setField<String>('cluster_id', value);

  String get orgName => getField<String>('org_name')!;
  set orgName(String value) => setField<String>('org_name', value);

  String? get legalName => getField<String>('legal_name');
  set legalName(String? value) => setField<String>('legal_name', value);

  String? get aboutUs => getField<String>('about_us');
  set aboutUs(String? value) => setField<String>('about_us', value);

  String? get contactEmail => getField<String>('contact_email');
  set contactEmail(String? value) => setField<String>('contact_email', value);

  String? get websiteUrl => getField<String>('website_url');
  set websiteUrl(String? value) => setField<String>('website_url', value);

  String? get contactPhone => getField<String>('contact_phone');
  set contactPhone(String? value) => setField<String>('contact_phone', value);

  String? get daysTime => getField<String>('days_time');
  set daysTime(String? value) => setField<String>('days_time', value);

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

  String? get orgSearchVector => getField<String>('org_search_vector');
  set orgSearchVector(String? value) =>
      setField<String>('org_search_vector', value);

  String get advancedMapping => getField<String>('advanced_mapping')!;
  set advancedMapping(String value) =>
      setField<String>('advanced_mapping', value);

  String? get postalCode => getField<String>('postal_code');
  set postalCode(String? value) => setField<String>('postal_code', value);

  String? get popConsiderations => getField<String>('pop_considerations');
  set popConsiderations(String? value) =>
      setField<String>('pop_considerations', value);
}

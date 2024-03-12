import '../database.dart';

class RegionsTable extends SupabaseTable<RegionsRow> {
  @override
  String get tableName => 'regions';

  @override
  RegionsRow createRow(Map<String, dynamic> data) => RegionsRow(data);
}

class RegionsRow extends SupabaseDataRow {
  RegionsRow(super.data);

  @override
  SupabaseTable get table => RegionsTable();

  int get geoCode => getField<int>('geo_code')!;
  set geoCode(int value) => setField<int>('geo_code', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String? get boundary => getField<String>('boundary');
  set boundary(String? value) => setField<String>('boundary', value);

  int get provinceCode => getField<int>('province_code')!;
  set provinceCode(int value) => setField<int>('province_code', value);
}

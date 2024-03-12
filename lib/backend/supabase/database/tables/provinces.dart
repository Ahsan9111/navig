import '../database.dart';

class ProvincesTable extends SupabaseTable<ProvincesRow> {
  @override
  String get tableName => 'provinces';

  @override
  ProvincesRow createRow(Map<String, dynamic> data) => ProvincesRow(data);
}

class ProvincesRow extends SupabaseDataRow {
  ProvincesRow(super.data);

  @override
  SupabaseTable get table => ProvincesTable();

  int get geoCode => getField<int>('geo_code')!;
  set geoCode(int value) => setField<int>('geo_code', value);

  String get nameEn => getField<String>('name_en')!;
  set nameEn(String value) => setField<String>('name_en', value);

  String get nameFr => getField<String>('name_fr')!;
  set nameFr(String value) => setField<String>('name_fr', value);

  String get abbreviationEn => getField<String>('abbreviation_en')!;
  set abbreviationEn(String value) =>
      setField<String>('abbreviation_en', value);

  String get abbreviationFr => getField<String>('abbreviation_fr')!;
  set abbreviationFr(String value) =>
      setField<String>('abbreviation_fr', value);

  String get alphaCode => getField<String>('alpha_code')!;
  set alphaCode(String value) => setField<String>('alpha_code', value);

  String? get boundary => getField<String>('boundary');
  set boundary(String? value) => setField<String>('boundary', value);
}

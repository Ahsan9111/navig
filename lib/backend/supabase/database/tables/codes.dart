import '../database.dart';

class CodesTable extends SupabaseTable<CodesRow> {
  @override
  String get tableName => 'codes';

  @override
  CodesRow createRow(Map<String, dynamic> data) => CodesRow(data);
}

class CodesRow extends SupabaseDataRow {
  CodesRow(super.data);

  @override
  SupabaseTable get table => CodesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get nameEn => getField<String>('name_en')!;
  set nameEn(String value) => setField<String>('name_en', value);

  String get nameFr => getField<String>('name_fr')!;
  set nameFr(String value) => setField<String>('name_fr', value);

  int get categoryId => getField<int>('category_id')!;
  set categoryId(int value) => setField<int>('category_id', value);
}

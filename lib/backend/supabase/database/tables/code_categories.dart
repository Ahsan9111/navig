import '../database.dart';

class CodeCategoriesTable extends SupabaseTable<CodeCategoriesRow> {
  @override
  String get tableName => 'code_categories';

  @override
  CodeCategoriesRow createRow(Map<String, dynamic> data) =>
      CodeCategoriesRow(data);
}

class CodeCategoriesRow extends SupabaseDataRow {
  CodeCategoriesRow(super.data);

  @override
  SupabaseTable get table => CodeCategoriesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);
}

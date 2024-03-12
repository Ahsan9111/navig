import '../database.dart';

class ProgCodesTable extends SupabaseTable<ProgCodesRow> {
  @override
  String get tableName => 'prog_codes';

  @override
  ProgCodesRow createRow(Map<String, dynamic> data) => ProgCodesRow(data);
}

class ProgCodesRow extends SupabaseDataRow {
  ProgCodesRow(super.data);

  @override
  SupabaseTable get table => ProgCodesTable();

  String get mastersheetUniqueId => getField<String>('mastersheet_unique_id')!;
  set mastersheetUniqueId(String value) =>
      setField<String>('mastersheet_unique_id', value);

  int get codeId => getField<int>('code_id')!;
  set codeId(int value) => setField<int>('code_id', value);
}

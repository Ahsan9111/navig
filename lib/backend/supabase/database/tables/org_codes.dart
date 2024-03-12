import '../database.dart';

class OrgCodesTable extends SupabaseTable<OrgCodesRow> {
  @override
  String get tableName => 'org_codes';

  @override
  OrgCodesRow createRow(Map<String, dynamic> data) => OrgCodesRow(data);
}

class OrgCodesRow extends SupabaseDataRow {
  OrgCodesRow(super.data);

  @override
  SupabaseTable get table => OrgCodesTable();

  String get mastersheetUniqueId => getField<String>('mastersheet_unique_id')!;
  set mastersheetUniqueId(String value) =>
      setField<String>('mastersheet_unique_id', value);

  int get codeId => getField<int>('code_id')!;
  set codeId(int value) => setField<int>('code_id', value);
}

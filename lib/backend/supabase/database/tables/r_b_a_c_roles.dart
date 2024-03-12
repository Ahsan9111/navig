import '../database.dart';

class RBACRolesTable extends SupabaseTable<RBACRolesRow> {
  @override
  String get tableName => 'RBAC roles';

  @override
  RBACRolesRow createRow(Map<String, dynamic> data) => RBACRolesRow(data);
}

class RBACRolesRow extends SupabaseDataRow {
  RBACRolesRow(super.data);

  @override
  SupabaseTable get table => RBACRolesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}

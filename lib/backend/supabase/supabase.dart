import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

const _kSupabaseUrl = 'https://yyzuzvpuuqmoxncuxwho.supabase.co';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inl5enV6dnB1dXFtb3huY3V4d2hvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDUwMDE2NjYsImV4cCI6MjAyMDU3NzY2Nn0.sJqh5bcTE52IO_VsdicUFNPUsBiYdx9oAlwceSWFUGs';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}

import 'package:supabase_flutter/supabase_flutter.dart';

/// Supabase client
final supabase = Supabase.instance.client;

/// 以下の２つの情報は外部に漏れても問題ないそうです。
/// Supabase URL
const supabaseUrl = 'https://xcbvfydfcrdsplvakrky.supabase.co';

/// Supabase anonymous key
const supabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhjYnZmeWRmY3Jkc3BsdmFrcmt5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTQ0ODcwNDEsImV4cCI6MjAxMDA2MzA0MX0.HxOqrVR9KMHsl8ZJ6r6cP75WGvbi4cUNgVuZRUNLf94';
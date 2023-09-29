import 'package:supabase_flutter/supabase_flutter.dart';

/// Supabase client
final supabase = Supabase.instance.client;

/// 以下の２つの情報は外部に漏れても問題ないそうです。
/// Supabase URL
const supabaseUrl = 'https://bnhwiurunffpsfagdqnw.supabase.co';

/// Supabase anonymous key
const supabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJuaHdpdXJ1bmZmcHNmYWdkcW53Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTU4MTI4NTcsImV4cCI6MjAxMTM4ODg1N30.vIkzpcEkhjbNqUOs6QHVZR0j3xuD8X5He2KvPoAbKDs';

/// Convers a date string from
/// 20240804065600 +0200
/// to
/// 2024-08-04 06:56:00 +0200
String reworkDateString(String source) {
  return '${source.substring(0, 4)}-${source.substring(4, 6)}-${source.substring(6, 8)} ${source.substring(8, 10)}:${source.substring(10, 12)}:${source.substring(12, 14)} ${source.substring(15)}';
}

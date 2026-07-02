int _metaInt(dynamic v, [int fallback = 0]) {
  if (v == null) return fallback;
  if (v is num) return v.toInt();
  if (v is String) return int.tryParse(v) ?? fallback;
  return fallback;
}

class PaginationMeta {
  final int currentPage;
  final int lastPage;
  final int perPage;
  final int total;
  final String? nextPageUrl;
  final String? prevPageUrl;

  PaginationMeta({
    required this.currentPage,
    required this.lastPage,
    required this.perPage,
    required this.total,
    this.nextPageUrl,
    this.prevPageUrl,
  });

  factory PaginationMeta.fromMap(Map<String, dynamic> map) => PaginationMeta(
        currentPage: map['current_page'] ?? 1,
        lastPage: map['last_page'] ?? 1,
        perPage: map['per_page'] ?? 15,
        total: map['total'] ?? 0,
        nextPageUrl: map['next_page_url'],
        prevPageUrl: map['prev_page_url'],
      );

  bool get hasNextPage => currentPage < lastPage;
}

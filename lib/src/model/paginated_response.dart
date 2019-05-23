abstract class PaginatedResponse<T> {
  final int total;
  final int page;
  final int size;
  final List<T> entries;

  PaginatedResponse(List<T> entries, this.total, {this.page = 1, this.size = 20})
    : this.entries = entries ?? <T>[];
  
}
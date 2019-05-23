abstract class TypedResponse {
  String objType;
  
  TypedResponse(this.objType);

}

abstract class PaginatedResponse<T> extends TypedResponse{
  final int total;
  final int page;
  final int size;
  final List<T> entries;

  PaginatedResponse(String objType,List<T> entries, this.total, {this.page = 1, this.size = 20})
    : this.entries = entries ?? <T>[],
      super(objType);
  
}
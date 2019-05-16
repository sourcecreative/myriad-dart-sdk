import 'package:myriad_dart_sdk/src/model/response/typed_response.dart';

abstract class PaginatedResponse<T> extends TypedResponse{
  final int total;
  final int page;
  final int size;
  final List<T> entries;

  PaginatedResponse(String objType,List<T> entries, this.total, {this.page = 1, this.size = 20})
    : this.entries = entries ?? <T>[],
      super(objType);
  
}
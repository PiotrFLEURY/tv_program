import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filter_provider.g.dart';

@riverpod
class Filter extends _$Filter {
  @override
  String build() {
    return '';
  }

  void setFilter(String filter) {
    state = filter;
  }

  void clearFilter() {
    state = '';
  }
}

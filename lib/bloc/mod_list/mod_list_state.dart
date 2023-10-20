part of 'mod_list_bloc.dart';

enum FetchStatus {
  loading,
  data,
  error,
}

class ModListState {
  final List<CategoryModel> categories;
  final FetchStatus status;

  ModListState({
    this.categories = const [],
    this.status = FetchStatus.data,
  });

  ModListState copyWith({
    List<CategoryModel>? categories,
    FetchStatus? status,
  }) {
    return ModListState(
      categories: categories ?? this.categories,
      status: status ?? this.status,
    );
  }
}

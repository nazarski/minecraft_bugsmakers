import 'dart:async';
import 'dart:developer';

import 'package:minecraft_bugsmakers/data/mods_data.dart';
import 'package:minecraft_bugsmakers/models/category_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'mod_list_event.dart';

part 'mod_list_state.dart';

class ModListBloc extends Bloc<ModListEvent, ModListState> {
  final modData = ModsData();

  ModListBloc() : super(ModListState()) {
    on<GetAllMods>((event, emit) async {
      log('message');
      final categories = await modData.getAllCategories();
      log(categories.toString());
      emit(state.copyWith(
        categories: categories,
        status: FetchStatus.data,
      ));
    });
  }
}

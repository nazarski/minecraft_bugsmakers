import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minecraft_bugsmakers/data/mods_data.dart';
import 'package:permission_handler/permission_handler.dart';

part 'download_event.dart';

part 'download_state.dart';

class DownloadBloc extends Bloc<DownloadEvent, DownloadState> {
  File downloadedFile = File('');
  DownloadBloc() : super(const DownloadState()) {
    on<StartDownloadEvent>((event, emit) async {
      try {
        final status = await Permission.storage.request();
        if (status.isGranted) {
          final File? file = await ModsData.getPathToNewFile(url: event.path);
          await ModsData.downloadMod(
              link: event.path,
              file: file!,
              onProgress: (received, total) {
                onProgress(received, total, emit);
              });
          downloadedFile = file;
          emit(
            state.copyWith(status: DownloadStatus.success, filePath: file.path),
          );
        } else {
          emit(
            state.copyWith(
              status: DownloadStatus.error,
            ),
          );
        }
      } on Exception catch (e) {
        emit(
          state.copyWith(
            status: DownloadStatus.error,
          ),
        );
      }
    });
    on<OpenFileEvent>((event, emit) async {
      await ModsData.openDownloadedFile(file: downloadedFile);
    });
  }



  void onProgress(int received, int total, Emitter emit) {
    emit(
      state.copyWith(
        status: DownloadStatus.loading,
      ),
    );

    if (total != -1) {
      double progress = received / total;
      emit(
        state.copyWith(
          progress: progress,
        ),
      );
    }
  }
}

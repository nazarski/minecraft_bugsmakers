part of 'download_bloc.dart';

@immutable
abstract class DownloadEvent {}

class StartDownloadEvent extends DownloadEvent {
  final String path;

  StartDownloadEvent({
    required this.path,
  });
}

class OpenFileEvent extends DownloadEvent{

}

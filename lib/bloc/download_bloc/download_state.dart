part of 'download_bloc.dart';

enum DownloadStatus {
  initial,
  loading,
  success,
  error,
}

@immutable
class DownloadState {
  final DownloadStatus status;
  final double progress;
  final String filePath;

  const DownloadState( {
    this.status = DownloadStatus.initial,
    this.progress = 0,
    this.filePath = '',
  });

  DownloadState copyWith({
    DownloadStatus? status,
    double? progress,
    String? filePath,
  }) {
    return DownloadState(
      status: status ?? this.status,
      progress: progress ?? this.progress,
      filePath: filePath ?? this.filePath,
    );
  }
}

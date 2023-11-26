import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minecraft_bugsmakers/bloc/download_bloc/download_bloc.dart';
import 'package:minecraft_bugsmakers/generated/assets.gen.dart';
import 'package:minecraft_bugsmakers/generated/l10n.dart';
import 'package:minecraft_bugsmakers/models/download_model.dart';
import 'package:minecraft_bugsmakers/resources/app_colors.dart';
import 'package:minecraft_bugsmakers/resources/app_styles.dart';

class DownloadItem extends StatelessWidget {
  const DownloadItem({
    Key? key,
    required this.downloadModel,
    required this.isShow,
  }) : super(key: key);
  final DownloadModel downloadModel;
  final bool isShow;

  String _statusString(S s, DownloadStatus status) {
    switch (status) {
      case DownloadStatus.initial:
        return s.download;
      case DownloadStatus.loading:
        return s.progress;
      case DownloadStatus.success:
        return s.open;
      case DownloadStatus.error:
        return s.failed;
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return BlocProvider(
      create: (context) => DownloadBloc(),
      child: BlocConsumer<DownloadBloc, DownloadState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final statusString = _statusString(s, state.status);

          return Container(
            height: 88.sp,
            padding: EdgeInsets.symmetric(
              horizontal: 12.sp,
              vertical: 8.sp,
            ),
            child: MaterialButton(
              minWidth: 0,
              splashColor: AppColors.green.withOpacity(
                0.3,
              ),
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    50.sp,
                  ),
                ),
              ),
              onPressed: () {
                if(state.status == DownloadStatus.success){
                  context.read<DownloadBloc>().add(OpenFileEvent());
                }else {
                  context.read<DownloadBloc>().add(
                        StartDownloadEvent(
                          path: downloadModel.path,
                        ),
                      );
                }
              },
              child: Stack(
                children: [
                  FractionallySizedBox(
                    widthFactor: state.progress,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            50.sp,
                          ),
                        ),
                        color: AppColors.green,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(12.sp),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          50.sp,
                        ),
                      ),
                      color: Colors.white.withOpacity(.5),
                      border: Border.all(
                        color: AppColors.green,
                        width: 3.sp,
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Image.asset(
                            isShow ? Assets.images.soulTorch.path : Assets.images.torch.path,
                            height: 32.sp,
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            children: [
                              Text(
                                statusString,
                                style: AppStyles.bungee.copyWith(
                                  fontSize: 20,
                                ),
                              ),
                              FittedBox(
                                child: Text(
                                  downloadModel.type,
                                  style: AppStyles.promptBody,
                                ),
                              )
                            ],
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

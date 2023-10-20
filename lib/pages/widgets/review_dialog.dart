import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minecraft_bugsmakers/generated/assets.gen.dart';
import 'package:minecraft_bugsmakers/generated/l10n.dart';
import 'package:minecraft_bugsmakers/pages/widgets/generic_dialog.dart';
import 'package:minecraft_bugsmakers/resources/app_colors.dart';
import 'package:minecraft_bugsmakers/resources/app_styles.dart';

class ReviewDialog extends GenericDialog {
  const ReviewDialog({super.key});

  @override
  State<ReviewDialog> createState() => _ReviewDialogState();
}

class _ReviewDialogState extends State<ReviewDialog> {
  int _rated = 0;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final goodRating = _rated >= 4;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: BorderRadius.all(
              Radius.circular(
                24,
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _RatingImage(
                rated: _rated,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  s.rateUs,
                  style: AppStyles.bungee.copyWith(fontSize: 24.sp),
                ),
              ),
              GenerateStars(
                onTap: (stars) {
                  setState(() {
                    _rated = stars;
                  });
                },
                stars: _rated,
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (goodRating) {
                      //TODO
                    }
                  },
                  style: AppStyles.greenButton,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: FittedBox(
                        child: Text(
                          goodRating ? s.rateUsAppStore : s.rate,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class GenerateStars extends StatelessWidget {
  const GenerateStars({
    super.key,
    required this.onTap,
    required this.stars,
  });

  final ValueChanged<int> onTap;
  final int stars;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        final active = stars >= index + 1;
        return GestureDetector(
          onTap: () {
            onTap(index + 1);
          },
          child: Icon(
            Icons.star_rate_rounded,
            color: active ? Colors.yellow : Colors.grey,
            size: 64.sp,
          ),
        );
      }),
    );
  }
}

class _RatingImage extends StatelessWidget {
  const _RatingImage({
    required this.rated,
  });

  final int rated;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Assets.images.workbench.image(
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          if (rated == 0)
            Assets.images.items.image()
          else if (rated <= 4)
            Positioned(
              top: 30.sp,
              child: _cakeImage(),
            )
          else
            Positioned(
              child: Assets.images.fiveStars.image(width: 200.sp),
            )
        ],
      ),
    );
  }

  Widget _cakeImage() {
    if (rated == 0) return Assets.images.items.image();
    if (rated == 1) return Assets.images.oneStar.image(width: 200.sp);
    if (rated == 2) return Assets.images.twoStars.image(width: 200.sp);
    if (rated == 3) return Assets.images.threeStars.image(width: 200.sp);
    if (rated == 4) return Assets.images.fourStars.image(width: 200.sp);
    return Assets.images.items.image();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/config/app_colors.dart';
import 'package:rick_and_morty/config/helpers.dart';
import 'package:rick_and_morty/config/router.dart';
import 'package:rick_and_morty/config/theme.dart';
import 'package:rick_and_morty/features/home/state/home_cubit.dart';
import 'package:rick_and_morty/gen/assets.gen.dart';
import 'package:rick_and_morty/models/character/character.dart';
import 'package:flutter_svg/flutter_svg.dart';



class CharacterCard extends StatelessWidget {
  static const double _borderRadius = 20;
  static const double _likeContainerSize = 30;
  static const double _loaderSize = 40;
  static const double _iconSize = 20;
  static const double _cardPadding = 10;
  static const double _nameHorizontalPadding = 10;
  static const double _nameVerticalPadding = 5;

  final Character character;
  final bool isFavorite;

  const CharacterCard({
    super.key,
    required this.character,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_borderRadius),
      ),
      elevation: 0,
      child: InkWell(
        borderRadius: BorderRadius.circular(_borderRadius),
        onTap: () async {
          await context.push('${AppRoutes().detailsPath}/${character.id}');
        },
        child: SizedBox(
          width: 160,
          height: 215,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(_borderRadius),
                      topRight: Radius.circular(_borderRadius),
                    ),
                    child: Image.network(
                      character.image,
                      frameBuilder: (BuildContext context, Widget child, int? frame,
                          bool wasSynchronouslyLoaded) {
                        if (wasSynchronouslyLoaded || frame != null) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(_borderRadius),
                            ),
                            child: child,
                          );
                        } else {
                          return SizedBox(
                            width: 160,
                            height: 160,
                            child: SizedBox(
                              height: _loaderSize,
                              width: _loaderSize,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          );
                        }
                      },
                      loadingBuilder:
                          (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return SizedBox(
                            width: 160,
                            height: 160,
                            child: SizedBox(
                              height: _loaderSize,
                              width: _loaderSize,
                              child: Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes != null
                                      ? getImageLoadingProgress(loadingProgress)
                                      : 0,
                                ),
                              ),
                            ),
                          );
                        }
                      },
                      errorBuilder:
                          (BuildContext context, Object exception, StackTrace? stackTrace) {
                        return SizedBox(
                          height: 160,
                          width: 160,
                          child: Expanded(
                            child: Container(),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    right: _cardPadding,
                    top: _cardPadding,
                    child: Material(
                      color: AppColors.whiteSmoke,
                      borderRadius: BorderRadius.circular(_borderRadius),
                      child: InkWell(
                        onTap: () async {
                          await context.read<HomeCubit>().toggleFavoriteCharacter(character.id);
                        },
                        borderRadius: BorderRadius.circular(_borderRadius),
                        child: SizedBox(
                          height: _likeContainerSize,
                          width: _likeContainerSize,
                          child: Center(
                            child: SvgPicture.asset(
                              isFavorite ? Assets.images.liked.path : Assets.images.unliked.path,
                              width: _iconSize,
                              height: _iconSize,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: _nameHorizontalPadding,
                  vertical: _nameVerticalPadding,
                ),
                child: Text(
                  character.name,
                  overflow: TextOverflow.ellipsis,
                  style: FontStyles.bodyBold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

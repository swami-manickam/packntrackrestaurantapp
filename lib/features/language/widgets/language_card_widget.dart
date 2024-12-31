import 'package:flutter/material.dart';
import 'package:packntrack_multivendor_restaurant/features/language/controllers/localization_controller.dart';
import 'package:packntrack_multivendor_restaurant/features/language/domain/models/language_model.dart';
import 'package:packntrack_multivendor_restaurant/util/app_constants.dart';
import 'package:packntrack_multivendor_restaurant/util/dimensions.dart';
import 'package:packntrack_multivendor_restaurant/util/styles.dart';

class LanguageCardWidget extends StatelessWidget {
  final LanguageModel languageModel;
  final LocalizationController localizationController;
  final int index;
  final bool fromBottomSheet;
  const LanguageCardWidget(
      {super.key,
      required this.languageModel,
      required this.localizationController,
      required this.index,
      this.fromBottomSheet = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        localizationController.setLanguage(
            Locale(
              AppConstants.languages[index].languageCode!,
              AppConstants.languages[index].countryCode,
            ),
            fromBottomSheet: fromBottomSheet);
        localizationController.setSelectLanguageIndex(index);
      },
      child: Container(
        height: 70,
        padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
        decoration: /*!fromWeb ? */ BoxDecoration(
          color: localizationController.selectedLanguageIndex == index
              ? Theme.of(context).primaryColor.withOpacity(0.05)
              : null,
          borderRadius: BorderRadius.circular(Dimensions.radiusLarge),
          border: localizationController.selectedLanguageIndex == index
              ? Border.all(
                  color: Theme.of(context).primaryColor.withOpacity(0.2))
              : null,
        ),
        child: Row(children: [
          Image.asset(languageModel.imageUrl ?? '', width: 36, height: 36),
          const SizedBox(width: Dimensions.paddingSizeSmall),
          Text(languageModel.languageName ?? '',
              style:
                  robotoRegular.copyWith(fontSize: Dimensions.fontSizeLarge)),
          const Spacer(),
          localizationController.selectedLanguageIndex == index
              ? Icon(Icons.check_circle,
                  color: Theme.of(context).primaryColor, size: 25)
              : const SizedBox(),
        ]),
      ),
    );
  }
}

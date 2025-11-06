import 'package:ezy_invoify/utils/size_config.dart';

extension SizeExtensions on num {
  double get h => SizeConfig.getHeight(toDouble());
  double get w => SizeConfig.getWidth(toDouble());
  double get sp => SizeConfig.getTextSize(toDouble());
  double get sh => SizeConfig.getIconSize(toDouble());
}

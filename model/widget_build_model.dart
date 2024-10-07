import 'package:freezed_annotation/freezed_annotation.dart';

part 'widget_build_model.freezed.dart';
part 'widget_build_model.g.dart';

@freezed
class WidgetBuildModel with _$WidgetBuildModel {
  const factory WidgetBuildModel({
    int? id,
    String? title,
    String? subTitle,
    String? description,
    String? value,
    String? count,
    String? svg,
    List<String>? valueList,
    List<String>? labelList,
  }) = _WidgetBuildModel;

  factory WidgetBuildModel.fromJson(Map<String, dynamic> json) => _$WidgetBuildModelFromJson(json);
}

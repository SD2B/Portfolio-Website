// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'widget_build_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WidgetBuildModelImpl _$$WidgetBuildModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WidgetBuildModelImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      subTitle: json['subTitle'] as String?,
      description: json['description'] as String?,
      value: json['value'] as String?,
      count: json['count'] as String?,
      svg: json['svg'] as String?,
      valueList: (json['valueList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      labelList: (json['labelList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$WidgetBuildModelImplToJson(
        _$WidgetBuildModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subTitle': instance.subTitle,
      'description': instance.description,
      'value': instance.value,
      'count': instance.count,
      'svg': instance.svg,
      'valueList': instance.valueList,
      'labelList': instance.labelList,
    };

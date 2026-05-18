// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'component_props_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ComponentPropsModel {

 String Function(AppLocalizations)? get label; String? get title; String? get subtitle; IconData? get regularIcon; IconData? get fillIcon; IconData? get duotone; Color? get color;
/// Create a copy of ComponentPropsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ComponentPropsModelCopyWith<ComponentPropsModel> get copyWith => _$ComponentPropsModelCopyWithImpl<ComponentPropsModel>(this as ComponentPropsModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ComponentPropsModel&&(identical(other.label, label) || other.label == label)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.regularIcon, regularIcon) || other.regularIcon == regularIcon)&&(identical(other.fillIcon, fillIcon) || other.fillIcon == fillIcon)&&(identical(other.duotone, duotone) || other.duotone == duotone)&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,label,title,subtitle,regularIcon,fillIcon,duotone,color);

@override
String toString() {
  return 'ComponentPropsModel(label: $label, title: $title, subtitle: $subtitle, regularIcon: $regularIcon, fillIcon: $fillIcon, duotone: $duotone, color: $color)';
}


}

/// @nodoc
abstract mixin class $ComponentPropsModelCopyWith<$Res>  {
  factory $ComponentPropsModelCopyWith(ComponentPropsModel value, $Res Function(ComponentPropsModel) _then) = _$ComponentPropsModelCopyWithImpl;
@useResult
$Res call({
 String Function(AppLocalizations)? label, String? title, String? subtitle, IconData? regularIcon, IconData? fillIcon, IconData? duotone, Color? color
});




}
/// @nodoc
class _$ComponentPropsModelCopyWithImpl<$Res>
    implements $ComponentPropsModelCopyWith<$Res> {
  _$ComponentPropsModelCopyWithImpl(this._self, this._then);

  final ComponentPropsModel _self;
  final $Res Function(ComponentPropsModel) _then;

/// Create a copy of ComponentPropsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = freezed,Object? title = freezed,Object? subtitle = freezed,Object? regularIcon = freezed,Object? fillIcon = freezed,Object? duotone = freezed,Object? color = freezed,}) {
  return _then(_self.copyWith(
label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String Function(AppLocalizations)?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,regularIcon: freezed == regularIcon ? _self.regularIcon : regularIcon // ignore: cast_nullable_to_non_nullable
as IconData?,fillIcon: freezed == fillIcon ? _self.fillIcon : fillIcon // ignore: cast_nullable_to_non_nullable
as IconData?,duotone: freezed == duotone ? _self.duotone : duotone // ignore: cast_nullable_to_non_nullable
as IconData?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color?,
  ));
}

}


/// Adds pattern-matching-related methods to [ComponentPropsModel].
extension ComponentPropsModelPatterns on ComponentPropsModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ComponentPropsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ComponentPropsModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ComponentPropsModel value)  $default,){
final _that = this;
switch (_that) {
case _ComponentPropsModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ComponentPropsModel value)?  $default,){
final _that = this;
switch (_that) {
case _ComponentPropsModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String Function(AppLocalizations)? label,  String? title,  String? subtitle,  IconData? regularIcon,  IconData? fillIcon,  IconData? duotone,  Color? color)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ComponentPropsModel() when $default != null:
return $default(_that.label,_that.title,_that.subtitle,_that.regularIcon,_that.fillIcon,_that.duotone,_that.color);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String Function(AppLocalizations)? label,  String? title,  String? subtitle,  IconData? regularIcon,  IconData? fillIcon,  IconData? duotone,  Color? color)  $default,) {final _that = this;
switch (_that) {
case _ComponentPropsModel():
return $default(_that.label,_that.title,_that.subtitle,_that.regularIcon,_that.fillIcon,_that.duotone,_that.color);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String Function(AppLocalizations)? label,  String? title,  String? subtitle,  IconData? regularIcon,  IconData? fillIcon,  IconData? duotone,  Color? color)?  $default,) {final _that = this;
switch (_that) {
case _ComponentPropsModel() when $default != null:
return $default(_that.label,_that.title,_that.subtitle,_that.regularIcon,_that.fillIcon,_that.duotone,_that.color);case _:
  return null;

}
}

}

/// @nodoc


class _ComponentPropsModel implements ComponentPropsModel {
  const _ComponentPropsModel({this.label, this.title, this.subtitle, this.regularIcon, this.fillIcon, this.duotone, this.color});
  

@override final  String Function(AppLocalizations)? label;
@override final  String? title;
@override final  String? subtitle;
@override final  IconData? regularIcon;
@override final  IconData? fillIcon;
@override final  IconData? duotone;
@override final  Color? color;

/// Create a copy of ComponentPropsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ComponentPropsModelCopyWith<_ComponentPropsModel> get copyWith => __$ComponentPropsModelCopyWithImpl<_ComponentPropsModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ComponentPropsModel&&(identical(other.label, label) || other.label == label)&&(identical(other.title, title) || other.title == title)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.regularIcon, regularIcon) || other.regularIcon == regularIcon)&&(identical(other.fillIcon, fillIcon) || other.fillIcon == fillIcon)&&(identical(other.duotone, duotone) || other.duotone == duotone)&&(identical(other.color, color) || other.color == color));
}


@override
int get hashCode => Object.hash(runtimeType,label,title,subtitle,regularIcon,fillIcon,duotone,color);

@override
String toString() {
  return 'ComponentPropsModel(label: $label, title: $title, subtitle: $subtitle, regularIcon: $regularIcon, fillIcon: $fillIcon, duotone: $duotone, color: $color)';
}


}

/// @nodoc
abstract mixin class _$ComponentPropsModelCopyWith<$Res> implements $ComponentPropsModelCopyWith<$Res> {
  factory _$ComponentPropsModelCopyWith(_ComponentPropsModel value, $Res Function(_ComponentPropsModel) _then) = __$ComponentPropsModelCopyWithImpl;
@override @useResult
$Res call({
 String Function(AppLocalizations)? label, String? title, String? subtitle, IconData? regularIcon, IconData? fillIcon, IconData? duotone, Color? color
});




}
/// @nodoc
class __$ComponentPropsModelCopyWithImpl<$Res>
    implements _$ComponentPropsModelCopyWith<$Res> {
  __$ComponentPropsModelCopyWithImpl(this._self, this._then);

  final _ComponentPropsModel _self;
  final $Res Function(_ComponentPropsModel) _then;

/// Create a copy of ComponentPropsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = freezed,Object? title = freezed,Object? subtitle = freezed,Object? regularIcon = freezed,Object? fillIcon = freezed,Object? duotone = freezed,Object? color = freezed,}) {
  return _then(_ComponentPropsModel(
label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String Function(AppLocalizations)?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,regularIcon: freezed == regularIcon ? _self.regularIcon : regularIcon // ignore: cast_nullable_to_non_nullable
as IconData?,fillIcon: freezed == fillIcon ? _self.fillIcon : fillIcon // ignore: cast_nullable_to_non_nullable
as IconData?,duotone: freezed == duotone ? _self.duotone : duotone // ignore: cast_nullable_to_non_nullable
as IconData?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color?,
  ));
}


}

// dart format on

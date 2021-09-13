// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'company_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CompanyStateTearOff {
  const _$CompanyStateTearOff();

  _CompanyState call(
      {Company? company,
      CompanyStatusJp companyStatusJp =
          const CompanyStatusJp(CompanyStatus.Explanation, "説明会"),
      Map<CompanyStatus, List<Company>> mapCompany = const {
        CompanyStatus.Explanation: const [],
        CompanyStatus.FirstInterview: const [],
        CompanyStatus.SecondInterview: const [],
        CompanyStatus.ThirdInterview: const [],
        CompanyStatus.FinalInterview: const [],
        CompanyStatus.Hunted: const []
      },
      String name = "",
      String detail = "",
      List<Company> companyList = const []}) {
    return _CompanyState(
      company: company,
      companyStatusJp: companyStatusJp,
      mapCompany: mapCompany,
      name: name,
      detail: detail,
      companyList: companyList,
    );
  }
}

/// @nodoc
const $CompanyState = _$CompanyStateTearOff();

/// @nodoc
mixin _$CompanyState {
  Company? get company => throw _privateConstructorUsedError;
  CompanyStatusJp get companyStatusJp => throw _privateConstructorUsedError;
  Map<CompanyStatus, List<Company>> get mapCompany =>
      throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get detail => throw _privateConstructorUsedError;
  List<Company> get companyList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CompanyStateCopyWith<CompanyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyStateCopyWith<$Res> {
  factory $CompanyStateCopyWith(
          CompanyState value, $Res Function(CompanyState) then) =
      _$CompanyStateCopyWithImpl<$Res>;
  $Res call(
      {Company? company,
      CompanyStatusJp companyStatusJp,
      Map<CompanyStatus, List<Company>> mapCompany,
      String name,
      String detail,
      List<Company> companyList});
}

/// @nodoc
class _$CompanyStateCopyWithImpl<$Res> implements $CompanyStateCopyWith<$Res> {
  _$CompanyStateCopyWithImpl(this._value, this._then);

  final CompanyState _value;
  // ignore: unused_field
  final $Res Function(CompanyState) _then;

  @override
  $Res call({
    Object? company = freezed,
    Object? companyStatusJp = freezed,
    Object? mapCompany = freezed,
    Object? name = freezed,
    Object? detail = freezed,
    Object? companyList = freezed,
  }) {
    return _then(_value.copyWith(
      company: company == freezed
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as Company?,
      companyStatusJp: companyStatusJp == freezed
          ? _value.companyStatusJp
          : companyStatusJp // ignore: cast_nullable_to_non_nullable
              as CompanyStatusJp,
      mapCompany: mapCompany == freezed
          ? _value.mapCompany
          : mapCompany // ignore: cast_nullable_to_non_nullable
              as Map<CompanyStatus, List<Company>>,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      detail: detail == freezed
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String,
      companyList: companyList == freezed
          ? _value.companyList
          : companyList // ignore: cast_nullable_to_non_nullable
              as List<Company>,
    ));
  }
}

/// @nodoc
abstract class _$CompanyStateCopyWith<$Res>
    implements $CompanyStateCopyWith<$Res> {
  factory _$CompanyStateCopyWith(
          _CompanyState value, $Res Function(_CompanyState) then) =
      __$CompanyStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Company? company,
      CompanyStatusJp companyStatusJp,
      Map<CompanyStatus, List<Company>> mapCompany,
      String name,
      String detail,
      List<Company> companyList});
}

/// @nodoc
class __$CompanyStateCopyWithImpl<$Res> extends _$CompanyStateCopyWithImpl<$Res>
    implements _$CompanyStateCopyWith<$Res> {
  __$CompanyStateCopyWithImpl(
      _CompanyState _value, $Res Function(_CompanyState) _then)
      : super(_value, (v) => _then(v as _CompanyState));

  @override
  _CompanyState get _value => super._value as _CompanyState;

  @override
  $Res call({
    Object? company = freezed,
    Object? companyStatusJp = freezed,
    Object? mapCompany = freezed,
    Object? name = freezed,
    Object? detail = freezed,
    Object? companyList = freezed,
  }) {
    return _then(_CompanyState(
      company: company == freezed
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as Company?,
      companyStatusJp: companyStatusJp == freezed
          ? _value.companyStatusJp
          : companyStatusJp // ignore: cast_nullable_to_non_nullable
              as CompanyStatusJp,
      mapCompany: mapCompany == freezed
          ? _value.mapCompany
          : mapCompany // ignore: cast_nullable_to_non_nullable
              as Map<CompanyStatus, List<Company>>,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      detail: detail == freezed
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as String,
      companyList: companyList == freezed
          ? _value.companyList
          : companyList // ignore: cast_nullable_to_non_nullable
              as List<Company>,
    ));
  }
}

/// @nodoc

class _$_CompanyState implements _CompanyState {
  const _$_CompanyState(
      {this.company,
      this.companyStatusJp =
          const CompanyStatusJp(CompanyStatus.Explanation, "説明会"),
      this.mapCompany = const {
        CompanyStatus.Explanation: const [],
        CompanyStatus.FirstInterview: const [],
        CompanyStatus.SecondInterview: const [],
        CompanyStatus.ThirdInterview: const [],
        CompanyStatus.FinalInterview: const [],
        CompanyStatus.Hunted: const []
      },
      this.name = "",
      this.detail = "",
      this.companyList = const []});

  @override
  final Company? company;
  @JsonKey(
      defaultValue: const CompanyStatusJp(CompanyStatus.Explanation, "説明会"))
  @override
  final CompanyStatusJp companyStatusJp;
  @JsonKey(defaultValue: const {
    CompanyStatus.Explanation: const [],
    CompanyStatus.FirstInterview: const [],
    CompanyStatus.SecondInterview: const [],
    CompanyStatus.ThirdInterview: const [],
    CompanyStatus.FinalInterview: const [],
    CompanyStatus.Hunted: const []
  })
  @override
  final Map<CompanyStatus, List<Company>> mapCompany;
  @JsonKey(defaultValue: "")
  @override
  final String name;
  @JsonKey(defaultValue: "")
  @override
  final String detail;
  @JsonKey(defaultValue: const [])
  @override
  final List<Company> companyList;

  @override
  String toString() {
    return 'CompanyState(company: $company, companyStatusJp: $companyStatusJp, mapCompany: $mapCompany, name: $name, detail: $detail, companyList: $companyList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CompanyState &&
            (identical(other.company, company) ||
                const DeepCollectionEquality()
                    .equals(other.company, company)) &&
            (identical(other.companyStatusJp, companyStatusJp) ||
                const DeepCollectionEquality()
                    .equals(other.companyStatusJp, companyStatusJp)) &&
            (identical(other.mapCompany, mapCompany) ||
                const DeepCollectionEquality()
                    .equals(other.mapCompany, mapCompany)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.detail, detail) ||
                const DeepCollectionEquality().equals(other.detail, detail)) &&
            (identical(other.companyList, companyList) ||
                const DeepCollectionEquality()
                    .equals(other.companyList, companyList)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(company) ^
      const DeepCollectionEquality().hash(companyStatusJp) ^
      const DeepCollectionEquality().hash(mapCompany) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(detail) ^
      const DeepCollectionEquality().hash(companyList);

  @JsonKey(ignore: true)
  @override
  _$CompanyStateCopyWith<_CompanyState> get copyWith =>
      __$CompanyStateCopyWithImpl<_CompanyState>(this, _$identity);
}

abstract class _CompanyState implements CompanyState {
  const factory _CompanyState(
      {Company? company,
      CompanyStatusJp companyStatusJp,
      Map<CompanyStatus, List<Company>> mapCompany,
      String name,
      String detail,
      List<Company> companyList}) = _$_CompanyState;

  @override
  Company? get company => throw _privateConstructorUsedError;
  @override
  CompanyStatusJp get companyStatusJp => throw _privateConstructorUsedError;
  @override
  Map<CompanyStatus, List<Company>> get mapCompany =>
      throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get detail => throw _privateConstructorUsedError;
  @override
  List<Company> get companyList => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CompanyStateCopyWith<_CompanyState> get copyWith =>
      throw _privateConstructorUsedError;
}

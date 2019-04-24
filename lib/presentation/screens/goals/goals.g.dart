// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goals.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GoalsModel extends GoalsModel {
  @override
  final bool loading;
  @override
  final BuiltList<Goal> goals;

  factory _$GoalsModel([void Function(GoalsModelBuilder) updates]) =>
      (new GoalsModelBuilder()..update(updates)).build();

  _$GoalsModel._({this.loading, this.goals}) : super._() {
    if (loading == null) {
      throw new BuiltValueNullFieldError('GoalsModel', 'loading');
    }
    if (goals == null) {
      throw new BuiltValueNullFieldError('GoalsModel', 'goals');
    }
  }

  @override
  GoalsModel rebuild(void Function(GoalsModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GoalsModelBuilder toBuilder() => new GoalsModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GoalsModel &&
        loading == other.loading &&
        goals == other.goals;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, loading.hashCode), goals.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GoalsModel')
          ..add('loading', loading)
          ..add('goals', goals))
        .toString();
  }
}

class GoalsModelBuilder implements Builder<GoalsModel, GoalsModelBuilder> {
  _$GoalsModel _$v;

  bool _loading;
  bool get loading => _$this._loading;
  set loading(bool loading) => _$this._loading = loading;

  ListBuilder<Goal> _goals;
  ListBuilder<Goal> get goals => _$this._goals ??= new ListBuilder<Goal>();
  set goals(ListBuilder<Goal> goals) => _$this._goals = goals;

  GoalsModelBuilder();

  GoalsModelBuilder get _$this {
    if (_$v != null) {
      _loading = _$v.loading;
      _goals = _$v.goals?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GoalsModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GoalsModel;
  }

  @override
  void update(void Function(GoalsModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GoalsModel build() {
    _$GoalsModel _$result;
    try {
      _$result =
          _$v ?? new _$GoalsModel._(loading: loading, goals: goals.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'goals';
        goals.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GoalsModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

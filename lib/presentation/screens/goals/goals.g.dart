// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goals.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GoalsViewState extends GoalsViewState {
  @override
  final bool loading;
  @override
  final BuiltList<Goal> goals;

  factory _$GoalsViewState([void Function(GoalsViewStateBuilder) updates]) =>
      (new GoalsViewStateBuilder()..update(updates)).build();

  _$GoalsViewState._({this.loading, this.goals}) : super._() {
    if (loading == null) {
      throw new BuiltValueNullFieldError('GoalsViewState', 'loading');
    }
    if (goals == null) {
      throw new BuiltValueNullFieldError('GoalsViewState', 'goals');
    }
  }

  @override
  GoalsViewState rebuild(void Function(GoalsViewStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GoalsViewStateBuilder toBuilder() =>
      new GoalsViewStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GoalsViewState &&
        loading == other.loading &&
        goals == other.goals;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, loading.hashCode), goals.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GoalsViewState')
          ..add('loading', loading)
          ..add('goals', goals))
        .toString();
  }
}

class GoalsViewStateBuilder
    implements Builder<GoalsViewState, GoalsViewStateBuilder> {
  _$GoalsViewState _$v;

  bool _loading;
  bool get loading => _$this._loading;
  set loading(bool loading) => _$this._loading = loading;

  ListBuilder<Goal> _goals;
  ListBuilder<Goal> get goals => _$this._goals ??= new ListBuilder<Goal>();
  set goals(ListBuilder<Goal> goals) => _$this._goals = goals;

  GoalsViewStateBuilder();

  GoalsViewStateBuilder get _$this {
    if (_$v != null) {
      _loading = _$v.loading;
      _goals = _$v.goals?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GoalsViewState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$GoalsViewState;
  }

  @override
  void update(void Function(GoalsViewStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GoalsViewState build() {
    _$GoalsViewState _$result;
    try {
      _$result =
          _$v ?? new _$GoalsViewState._(loading: loading, goals: goals.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'goals';
        goals.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GoalsViewState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

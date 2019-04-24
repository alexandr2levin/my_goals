// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_goal.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EditGoalModel extends EditGoalModel {
  @override
  final EditGoalMode mode;
  @override
  final bool loading;
  @override
  final bool saving;
  @override
  final Goal goal;

  factory _$EditGoalModel([void Function(EditGoalModelBuilder) updates]) =>
      (new EditGoalModelBuilder()..update(updates)).build();

  _$EditGoalModel._({this.mode, this.loading, this.saving, this.goal})
      : super._() {
    if (loading == null) {
      throw new BuiltValueNullFieldError('EditGoalModel', 'loading');
    }
    if (saving == null) {
      throw new BuiltValueNullFieldError('EditGoalModel', 'saving');
    }
  }

  @override
  EditGoalModel rebuild(void Function(EditGoalModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EditGoalModelBuilder toBuilder() => new EditGoalModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EditGoalModel &&
        mode == other.mode &&
        loading == other.loading &&
        saving == other.saving &&
        goal == other.goal;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, mode.hashCode), loading.hashCode), saving.hashCode),
        goal.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('EditGoalModel')
          ..add('mode', mode)
          ..add('loading', loading)
          ..add('saving', saving)
          ..add('goal', goal))
        .toString();
  }
}

class EditGoalModelBuilder
    implements Builder<EditGoalModel, EditGoalModelBuilder> {
  _$EditGoalModel _$v;

  EditGoalMode _mode;
  EditGoalMode get mode => _$this._mode;
  set mode(EditGoalMode mode) => _$this._mode = mode;

  bool _loading;
  bool get loading => _$this._loading;
  set loading(bool loading) => _$this._loading = loading;

  bool _saving;
  bool get saving => _$this._saving;
  set saving(bool saving) => _$this._saving = saving;

  GoalBuilder _goal;
  GoalBuilder get goal => _$this._goal ??= new GoalBuilder();
  set goal(GoalBuilder goal) => _$this._goal = goal;

  EditGoalModelBuilder();

  EditGoalModelBuilder get _$this {
    if (_$v != null) {
      _mode = _$v.mode;
      _loading = _$v.loading;
      _saving = _$v.saving;
      _goal = _$v.goal?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EditGoalModel other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$EditGoalModel;
  }

  @override
  void update(void Function(EditGoalModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$EditGoalModel build() {
    _$EditGoalModel _$result;
    try {
      _$result = _$v ??
          new _$EditGoalModel._(
              mode: mode,
              loading: loading,
              saving: saving,
              goal: _goal?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'goal';
        _goal?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'EditGoalModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

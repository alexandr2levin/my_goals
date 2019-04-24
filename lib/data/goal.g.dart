// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Goal extends Goal {
  @override
  final int id;
  @override
  final String name;
  @override
  final DateTime date;

  factory _$Goal([void Function(GoalBuilder) updates]) =>
      (new GoalBuilder()..update(updates)).build();

  _$Goal._({this.id, this.name, this.date}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Goal', 'id');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('Goal', 'name');
    }
  }

  @override
  Goal rebuild(void Function(GoalBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GoalBuilder toBuilder() => new GoalBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Goal &&
        id == other.id &&
        name == other.name &&
        date == other.date;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, id.hashCode), name.hashCode), date.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Goal')
          ..add('id', id)
          ..add('name', name)
          ..add('date', date))
        .toString();
  }
}

class GoalBuilder implements Builder<Goal, GoalBuilder> {
  _$Goal _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  DateTime _date;
  DateTime get date => _$this._date;
  set date(DateTime date) => _$this._date = date;

  GoalBuilder();

  GoalBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _date = _$v.date;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Goal other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Goal;
  }

  @override
  void update(void Function(GoalBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Goal build() {
    final _$result = _$v ?? new _$Goal._(id: id, name: name, date: date);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

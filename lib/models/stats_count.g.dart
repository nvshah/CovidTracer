// GENERATED CODE - DO NOT MODIFY BY HAND

part of stats_count;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StatsCount> _$statsCountSerializer = new _$StatsCountSerializer();

class _$StatsCountSerializer implements StructuredSerializer<StatsCount> {
  @override
  final Iterable<Type> types = const [StatsCount, _$StatsCount];
  @override
  final String wireName = 'StatsCount';

  @override
  Iterable<Object> serialize(Serializers serializers, StatsCount object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.total != null) {
      result
        ..add('total')
        ..add(serializers.serialize(object.total,
            specifiedType: const FullType(int)));
    }
    if (object.recovered != null) {
      result
        ..add('recovered')
        ..add(serializers.serialize(object.recovered,
            specifiedType: const FullType(int)));
    }
    if (object.deaths != null) {
      result
        ..add('deaths')
        ..add(serializers.serialize(object.deaths,
            specifiedType: const FullType(int)));
    }
    if (object.active != null) {
      result
        ..add('active')
        ..add(serializers.serialize(object.active,
            specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  StatsCount deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StatsCountBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'total':
          result.total = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'recovered':
          result.recovered = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'deaths':
          result.deaths = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'active':
          result.active = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$StatsCount extends StatsCount {
  @override
  final int total;
  @override
  final int recovered;
  @override
  final int deaths;
  @override
  final int active;

  factory _$StatsCount([void Function(StatsCountBuilder) updates]) =>
      (new StatsCountBuilder()..update(updates)).build();

  _$StatsCount._({this.total, this.recovered, this.deaths, this.active})
      : super._();

  @override
  StatsCount rebuild(void Function(StatsCountBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StatsCountBuilder toBuilder() => new StatsCountBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StatsCount &&
        total == other.total &&
        recovered == other.recovered &&
        deaths == other.deaths &&
        active == other.active;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, total.hashCode), recovered.hashCode), deaths.hashCode),
        active.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('StatsCount')
          ..add('total', total)
          ..add('recovered', recovered)
          ..add('deaths', deaths)
          ..add('active', active))
        .toString();
  }
}

class StatsCountBuilder implements Builder<StatsCount, StatsCountBuilder> {
  _$StatsCount _$v;

  int _total;
  int get total => _$this._total;
  set total(int total) => _$this._total = total;

  int _recovered;
  int get recovered => _$this._recovered;
  set recovered(int recovered) => _$this._recovered = recovered;

  int _deaths;
  int get deaths => _$this._deaths;
  set deaths(int deaths) => _$this._deaths = deaths;

  int _active;
  int get active => _$this._active;
  set active(int active) => _$this._active = active;

  StatsCountBuilder();

  StatsCountBuilder get _$this {
    if (_$v != null) {
      _total = _$v.total;
      _recovered = _$v.recovered;
      _deaths = _$v.deaths;
      _active = _$v.active;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StatsCount other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$StatsCount;
  }

  @override
  void update(void Function(StatsCountBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$StatsCount build() {
    final _$result = _$v ??
        new _$StatsCount._(
            total: total, recovered: recovered, deaths: deaths, active: active);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

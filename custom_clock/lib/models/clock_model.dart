import 'package:flutter/material.dart';

/// Class for current time
@immutable
class MyClocks {
  /// MyClock constructor
  const MyClocks(
    this._hours,
    this._minutes,
    this._seconds,
  );
  final int _hours;
  final int _minutes;
  final int _seconds;

  /// get curretn hour
  int get hours => _hours >= 12 ? _hours - 12 : _hours;

  /// get curretn minut
  int get minutes => _minutes;

  /// get curretn second
  int get seconds => _seconds;

  /// Copy with for MyClock class
  MyClocks copyWith(
    int? hours,
    int? minutes,
    int? seconds,
  ) {
    return MyClocks(
      hours ?? _hours,
      minutes ?? _minutes,
      seconds ?? _seconds,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MyClocks &&
        other._hours == _hours &&
        other._minutes == _minutes &&
        other._seconds == _seconds;
  }

  @override
  int get hashCode => _hours.hashCode ^ _minutes.hashCode ^ _seconds.hashCode;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_player_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AudioPlayerViewModel on _AudioPlayerViewModel, Store {
  late final _$isPlayingAtom =
      Atom(name: '_AudioPlayerViewModel.isPlaying', context: context);

  @override
  bool get isPlaying {
    _$isPlayingAtom.reportRead();
    return super.isPlaying;
  }

  @override
  set isPlaying(bool value) {
    _$isPlayingAtom.reportWrite(value, super.isPlaying, () {
      super.isPlaying = value;
    });
  }

  late final _$currentPositionAtom =
      Atom(name: '_AudioPlayerViewModel.currentPosition', context: context);

  @override
  Duration get currentPosition {
    _$currentPositionAtom.reportRead();
    return super.currentPosition;
  }

  @override
  set currentPosition(Duration value) {
    _$currentPositionAtom.reportWrite(value, super.currentPosition, () {
      super.currentPosition = value;
    });
  }

  late final _$durationAtom =
      Atom(name: '_AudioPlayerViewModel.duration', context: context);

  @override
  Duration get duration {
    _$durationAtom.reportRead();
    return super.duration;
  }

  @override
  set duration(Duration value) {
    _$durationAtom.reportWrite(value, super.duration, () {
      super.duration = value;
    });
  }

  late final _$playbackSpeedAtom =
      Atom(name: '_AudioPlayerViewModel.playbackSpeed', context: context);

  @override
  double get playbackSpeed {
    _$playbackSpeedAtom.reportRead();
    return super.playbackSpeed;
  }

  @override
  set playbackSpeed(double value) {
    _$playbackSpeedAtom.reportWrite(value, super.playbackSpeed, () {
      super.playbackSpeed = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('_AudioPlayerViewModel.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$_AudioPlayerViewModelActionController =
      ActionController(name: '_AudioPlayerViewModel', context: context);

  @override
  void togglePlay() {
    final _$actionInfo = _$_AudioPlayerViewModelActionController.startAction(
        name: '_AudioPlayerViewModel.togglePlay');
    try {
      return super.togglePlay();
    } finally {
      _$_AudioPlayerViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSpeed(double speed) {
    final _$actionInfo = _$_AudioPlayerViewModelActionController.startAction(
        name: '_AudioPlayerViewModel.setSpeed');
    try {
      return super.setSpeed(speed);
    } finally {
      _$_AudioPlayerViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void rewind() {
    final _$actionInfo = _$_AudioPlayerViewModelActionController.startAction(
        name: '_AudioPlayerViewModel.rewind');
    try {
      return super.rewind();
    } finally {
      _$_AudioPlayerViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void forward() {
    final _$actionInfo = _$_AudioPlayerViewModelActionController.startAction(
        name: '_AudioPlayerViewModel.forward');
    try {
      return super.forward();
    } finally {
      _$_AudioPlayerViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void seek(Duration position) {
    final _$actionInfo = _$_AudioPlayerViewModelActionController.startAction(
        name: '_AudioPlayerViewModel.seek');
    try {
      return super.seek(position);
    } finally {
      _$_AudioPlayerViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isPlaying: ${isPlaying},
currentPosition: ${currentPosition},
duration: ${duration},
playbackSpeed: ${playbackSpeed}
    ''';
  }
}

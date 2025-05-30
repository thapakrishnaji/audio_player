import 'package:audio_player_app/utils/audio_constants.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mobx/mobx.dart';

part 'audio_player_viewmodel.g.dart';

/// A MobX ViewModel to manage audio playback using just_audio.
/// 
/// This class plays a welcome message once on initialization, then plays
/// a looping main music track. It supports actions like play/pause, seek,
/// rewind/forward, and adjusting playback speed.
class AudioPlayerViewModel = _AudioPlayerViewModel with _$AudioPlayerViewModel;

abstract class _AudioPlayerViewModel with Store {
  final AudioPlayer _player = AudioPlayer();

  /// Indicates whether the audio is currently playing.
  @observable
  bool isPlaying = false;

  /// Current playback position of the audio.
  @observable
  Duration currentPosition = Duration.zero;

  /// Total duration of the current audio track.
  @observable
  Duration duration = Duration.zero;

  /// Current playback speed (1.0 = normal speed).
  @observable
  double playbackSpeed = 1.0;

  bool _welcomeStarted = false;
  bool _welcomeFinished = false;

  /// Initializes the audio player, listens to state changes,
  /// and starts the welcome audio (once).
  @action
  Future<void> init() async {
    // Avoid duplicate initialization
    if (_welcomeStarted) return;

    _welcomeStarted = true;

    // Listen for playback position updates
    _player.positionStream.listen((pos) => currentPosition = pos);

    // Listen for track duration changes
    _player.durationStream.listen((dur) {
      if (dur != null) duration = dur;
    });

    // Listen for playback state (playing/paused)
    _player.playerStateStream.listen((state) {
      isPlaying = state.playing;
    });

    await _playWelcomeAudio();
  }

  /// Plays the welcome audio only once, then proceeds to play main music.
  Future<void> _playWelcomeAudio() async {
    if (_welcomeFinished) return;

    await _player.setAsset(AudioConstants.welcomeAudio);
    await _player.play();

    // Wait until welcome audio finishes
    await _player.processingStateStream.firstWhere(
      (state) => state == ProcessingState.completed,
    );

    _welcomeFinished = true;

    await _playMainMusic();
  }

  /// Plays the main looping music after the welcome audio.
  Future<void> _playMainMusic() async {
    await _player.setAsset(AudioConstants.loopAudio);
    await _player.setLoopMode(LoopMode.one);
    await _player.setSpeed(playbackSpeed);
    await _player.play();
  }

  /// Toggles playback: pause if playing, play if paused.
  @action
  void togglePlay() {
    if (_player.playing) {
      _player.pause();
    } else {
      _player.play();
    }
  }

  /// Sets the playback speed.
  @action
  void setSpeed(double speed) {
    playbackSpeed = speed;
    _player.setSpeed(speed);
  }

  /// Rewinds the playback by 1 second, but not below 0.
  @action
  void rewind() {
    final pos = _player.position - const Duration(seconds: 1);
    _player.seek(pos < Duration.zero ? Duration.zero : pos);
  }

  /// Forwards the playback by 1 second, but not beyond total duration.
  @action
  void forward() {
    final pos = _player.position + const Duration(seconds: 1);
    if (pos <= duration) _player.seek(pos);
  }

  /// Seeks to a specific [position] in the audio track.
  @action
  void seek(Duration position) {
    _player.seek(position);
  }

  /// Disposes the audio player resources.
  void dispose() {
    _player.dispose();
  }
}

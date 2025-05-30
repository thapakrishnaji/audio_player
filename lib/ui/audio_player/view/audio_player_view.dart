import 'package:audio_player_app/ui/audio_player/view_model/audio_player_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A UI screen that interacts with the [AudioPlayerViewModel]
/// to control and display audio playback information.
class AudioPlayerView extends StatefulWidget {
  const AudioPlayerView({super.key});

  @override
  State<AudioPlayerView> createState() => _AudioPlayerViewState();
}

class _AudioPlayerViewState extends State<AudioPlayerView> {
  // ViewModel instance managing audio playback state and behavior
  final AudioPlayerViewModel _audioStore = AudioPlayerViewModel();

  @override
  void initState() {
    super.initState();
    // Initialize audio logic (plays welcome audio, sets up listeners, etc.)
    _audioStore.init();
  }

  @override
  void dispose() {
    // Dispose audio resources when the screen is destroyed
    _audioStore.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Audio Player")),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Observer(
          // Rebuilds UI when MobX observables change
          builder: (_) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Playback speed label
              Text(
                "Current Speed: ${_audioStore.playbackSpeed.toStringAsFixed(1)}x",
              ),

              // Playback speed slider (0.5x to 2.0x)
              Slider(
                value: _audioStore.playbackSpeed,
                min: 0.5,
                max: 2.0,
                divisions: 6,
                onChanged: _audioStore.setSpeed,
              ),

              // Playback control buttons: rewind, play/pause, forward
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.replay_10),
                    onPressed: _audioStore.rewind,
                  ),
                  IconButton(
                    icon: Icon(
                      _audioStore.isPlaying ? Icons.pause : Icons.play_arrow,
                    ),
                    onPressed: _audioStore.togglePlay,
                  ),
                  IconButton(
                    icon: const Icon(Icons.forward_10),
                    onPressed: _audioStore.forward,
                  ),
                ],
              ),

              // Audio seek slider (represents the current playback position)
              Slider(
                value: _audioStore.currentPosition.inSeconds.toDouble(),
                max: _audioStore.duration.inSeconds.toDouble(),
                onChanged: (value) =>
                    _audioStore.seek(Duration(seconds: value.toInt())),
              ),

              // Display current position / total duration
              Text(
                "${_audioStore.currentPosition.toString().split('.').first} / "
                "${_audioStore.duration.toString().split('.').first}",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

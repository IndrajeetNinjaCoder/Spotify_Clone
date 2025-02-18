//
//  SongPlayerViewModel.swift
//  Spotify_Clone
//
//  Created by test on 18/02/25.
//
import SwiftUI
import AVFoundation

class SongPlayerViewModel: ObservableObject {
    var player: AVAudioPlayer?
    @Published var currentTime: TimeInterval = 0 // Current playback time
    @Published var duration: TimeInterval = 1 // Total duration of the track
    
    var timer: Timer?
    
    func playMusic(song: String) {
        if let path = Bundle.main.path(forResource: song, ofType: "mp3") {
            let url = URL(fileURLWithPath: path)
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.play()
                
                // Set the total duration of the track
                duration = player?.duration ?? 1
                
                // Start a timer to update the current playback time
                startTimer()
            } catch {
                print("Error Playing sound: \(error.localizedDescription)")
            }
        } else {
            print("File not found.")
        }
    }
    
    func pauseMusic() {
        player?.pause()
        stopTimer()
    }
    
    func stopMusic() {
        player?.stop()
        player?.currentTime = 0
        currentTime = 0
        stopTimer()
    }
    
    func seek(to time: TimeInterval) {
        player?.currentTime = time
        currentTime = time
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            self.currentTime = self.player?.currentTime ?? 0
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}


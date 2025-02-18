//
//  SpofityPlayView.swift
//  SpotifyClone
//
//  Created by test on 17/02/25.
//

import SwiftUI

struct SpotifyPlayView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State var album: Album
    @StateObject var songVM: SongPlayerViewModel = SongPlayerViewModel()
    @State var isSongPlaying: Bool = false
    
    
    let songArray: [String] = [
        "Thursday",
        "Kiss Land",
        "House Of Balloons",
        "Echoes of silence",
        "Beauty Behind The Madness"
    ]
    @State var songIndex: Int = 0
    
    var body: some View {
        VStack(spacing: 16) {
            // Header Section
                        
            HStack {
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(.white)
                }
                Spacer()
                
                Button(action: {
                    // More options action
                }) {
                    Image(systemName: "ellipsis")
                        .rotationEffect(.degrees(90))
                        .font(.title2)
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            ImageLoaderView(urlString: album.strAlbumThumb ?? "")
                .scaledToFit()
                .frame(width: 300, height: 300)
                .cornerRadius(12)
                .shadow(radius: 10)
            
            Spacer()
            
            // Song Details
            VStack(spacing: 8) {
                Text(album.strAlbum)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text(album.strArtist)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            // Music Progress Bar
            VStack(spacing: 8) {
                Slider(
                    value: Binding(
                        get: { songVM.currentTime / songVM.duration },
                        set: { newValue in
                            let newTime = newValue * songVM.duration
                            songVM.seek(to: newTime)
                        }
                    ),
                    in: 0...1
                )
                .accentColor(.white)
                
                HStack {
                    Text(formatTime(songVM.currentTime))
                        .font(.caption)
                        .foregroundColor(.gray)
                    Spacer()
                    Text(formatTime(songVM.duration))
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .padding(.horizontal)
            
            // Playback Controls
            HStack(spacing: 32) {
                Button(action: {
                    // Shuffle action
                }) {
                    Image(systemName: "shuffle")
                        .font(.title2)
                        .foregroundColor(.green)
                }
                Button(action: {
                    songIndex = songIndex > 0 ? songIndex - 1 : songArray.count - 1
                    songVM.playMusic(song: songArray[songIndex])
                    isSongPlaying = true
                }) {
                    Image(systemName: "backward.fill")
                        .font(.title2)
                        .foregroundColor(.white)
                }
                
                Button(action: {
                    // Play/Pause action
                    isSongPlaying.toggle()
                    if isSongPlaying {
                        songVM.playMusic(song: songArray[songIndex])
                    } else {
                        songVM.pauseMusic()
                    }
                }) {
                    Image(systemName: isSongPlaying ? "pause.fill" : "play.fill")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
                
                Button(action: {
                    // Next action
                    songIndex = (songIndex + 1) % songArray.count
                    songVM.playMusic(song: songArray[songIndex])
                    isSongPlaying = true
                }) {
                    Image(systemName: "forward.fill")
                        .font(.title2)
                        .foregroundColor(.white)
                }
                Button(action: {
                    // Timer action
                }) {
                    Image(systemName: "timer")
                        .font(.title2)
                        .foregroundColor(.white)
                }
            }
            
            Spacer()
        }
        .padding(.vertical)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.red, Color.black]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
        )
        .toolbar(.hidden)
    }
    
    func formatTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
}

#Preview {
    SpotifyPlayView(album: .mock)
}


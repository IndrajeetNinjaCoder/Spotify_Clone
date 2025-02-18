//
//  PlaylistDescriptionCell.swift
//  SpotifyClone
//
//  Created by test on 13/02/25.
//

import SwiftUI

struct PlaylistDescriptionCell: View {
    
   
    var album: Album = .mock
    
//    var onAddToPlaylistPressed: (() -> Void)? = nil
//    var onDownloadPressed: (() -> Void)? = nil
//    var onSharePressed: (() -> Void)? = nil
//    var onEllipsisPressed: (() -> Void)? = nil
//    var onShufflePressed: (() -> Void)? = nil
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("\(album.strDescriptionEN ?? "")...")
                .lineLimit(2)
                .foregroundStyle(.spotifyLightGray)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            madeForYouSection
            
            Text(album.strLabel ?? "")
            
            buttonsRow
            
        }
        .font(.callout)
        .fontWeight(.medium)
        .foregroundStyle(.spotifyLightGray)
        
    }
    
    private var madeForYouSection: some View {
        HStack(spacing: 0){
            Image("Spotify")
                .resizable()
                .scaledToFit()
                .font(.title3)
                .frame(width: 18, height: 18)
                .padding(.trailing, 8)
            
            Text("Indrajeet Kumar")
                .fontWeight(.bold)
        }
    }
    
    private var buttonsRow: some View {
        HStack(spacing: 0) {
            HStack(spacing: 0) {
                Image(systemName: "plus.circle")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                
                Image(systemName: "arrow.down.circle")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                
                Image(systemName: "square.and.arrow.up")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                
                Image(systemName: "ellipsis")
                    .padding(8)
                    .background(Color.black.opacity(0.001))
                
                
            }
            .offset(x: -8)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
            
            HStack(spacing: 8) {
                Image(systemName: "shuffle")
                    .font(.system(size: 24))
                    .background(Color.black.opacity(0.001))
                NavigationLink(destination: SpotifyPlayView(album: album)) {
                    Image(systemName: "play.circle.fill")
                        .font(.system(size: 46))
                    
                }
            }
            .foregroundStyle(.spotifyGreen)
            
        }
        .font(.title2)
        
    }
    
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        PlaylistDescriptionCell()
            .padding()
    }
}

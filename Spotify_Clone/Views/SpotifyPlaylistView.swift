//
//  SpotifyPlaylistView.swift
//  SpotifyClone
//
//  Created by test on 13/02/25.
//

import SwiftUI

struct SpotifyPlaylistView: View {
    
    var album: Album = .mock
    
    @Environment(\.dismiss) private var dismiss
    
    @StateObject var vm: AlbumViewModel = AlbumViewModel()
    @State var navigateToPlayView: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                
                Color.spotifyBlack.ignoresSafeArea()
                
                VStack {
                    
                    ScrollView(.vertical) {
                        LazyVStack(spacing: 16) {
                            ZStack(alignment: .topLeading) {
                                PlaylistHeaderCell(
                                    height: 250,
                                    title: album.strAlbum,
                                    subtitle: album.strArtist,
                                    imageName: album.strAlbumThumb ?? ""
                                )
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.spotifyWhite)
                                    .font(.title3)
                                    .padding(10)
                                    .background(Color.spotifyGray.opacity(0.7))
                                    .clipShape(Circle())
                                    .padding()
                                    .padding(.top, 60)
                                    .onTapGesture {
                                        dismiss()
                                    }
                            }
                            
                            
                            PlaylistDescriptionCell(
                                album: album
                                //                            onAddToPlaylistPressed: nil,
                                //                            onDownloadPressed: nil,
                                //                            onSharePressed: nil,
                                //                            onEllipsisPressed: nil,
                                //                            onShufflePressed: nil,
                            )
                            .padding(.horizontal, 16)
                            
                            ForEach(vm.albums, id: \.idAlbum) { currentAlbum in
                                NavigationLink(destination: SpotifyPlayView(album: currentAlbum)) {
                                    
                                    SongRowCell(
                                        imageSize: 50,
                                        imageName: currentAlbum.strAlbumThumb ?? "",
                                        title: currentAlbum.strAlbum,
                                        subtitle: currentAlbum.strArtist,
                                        onCellPressed: {
                                            
                                        },
                                        onEllipsisPressed: {
                                            
                                        }
                                    )
                                }
                                .padding(.leading, 16)
                            }
                        }
                        
                    }
                    .scrollIndicators(.hidden)
                    .clipped()
                    
                    Spacer()
                    SpotifyTabBar()
                }
                .ignoresSafeArea()
            }
            
        }
        .ignoresSafeArea()
        .task {
            await vm.getData()
        }
        
        .toolbar(.hidden, for: .navigationBar)
        
    }
    
}


#Preview {
    SpotifyPlaylistView()
}

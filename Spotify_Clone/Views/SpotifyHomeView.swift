//
//  SpotifyHomeView.swift
//  SpotifyClone
//
//  Created by test on 05/02/25.
//


import SwiftUI

struct SpotifyHomeView: View {

    @State private var selectedCategory: Category = Category.all
    @StateObject var vm: AlbumViewModel = AlbumViewModel()
    @State var albumRow: [Album] = []
    
    @State var selectedAlbum: Album?
    
    var body: some View {
        NavigationView{
            ZStack {
                Color.spotifyBlack.ignoresSafeArea()
                
                
                ScrollView(.vertical) {
                    
                    LazyVStack(spacing: 1, pinnedViews: [.sectionHeaders]){
                        Section {
                            
                            VStack(spacing: 16) {
                                recentsSection
                                    .padding(.horizontal, 16)
                                
                                if let album = vm.albums.first {
                                    newReleasesSection(album: album)
                                        .padding(.horizontal, 16)
                                }
                                
                                listRows
                                
                            }
                        } header: {
                            header
                        }
                    }
                    .padding(.top, 8)
                    
                }
                .scrollIndicators(.hidden)
                .clipped()
            }
            
            .task {
                //            await getData()
                await vm.getData()
            }
        }
    }
 
    
    private var header: some View {
        HStack(spacing: 0) {
            ZStack {
                Image("Spotify")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
            }
            .frame(width: 30, height: 30)
            
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(Category.allCases, id: \.self) { category in
                        SpotifyCategoryCell(
                            title: category.rawValue.capitalized,
                            isSelected: category == selectedCategory
                        )
                        .onTapGesture {
                            withAnimation(.default) {
                                selectedCategory = category
                            }
                             
                        }
                    }
                    
                }
                .padding(.horizontal, 16)
            }
            .scrollIndicators(.hidden)
        }
        .padding(.vertical, 24)
        .padding(.leading, 8)
        .background(.spotifyBlack)
    }
    
    private var recentsSection: some View {
        LazyVGrid(
            columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 2),
            spacing: 10
        ) {
            ForEach(vm.albums.prefix(8), id: \.idAlbum) { album in
                NavigationLink(destination: SpotifyPlaylistView(album: album)) {
                    SpotifyRecentCell(
                        imageName: album.strAlbumThumb ?? "",
                        title: album.strAlbum
                    )
                }
            }
        }
    }

    
    private func newReleasesSection(album: Album) -> some View {
        NavigationLink(destination: SpotifyPlaylistView(album: album)) {
            SpotifyNewReleaseCell(
                imageName: album.strAlbumThumb ?? "",
                headline: album.strAlbum,
                subheadline: album.strArtist,
                title: album.strAlbum,
                subtitle: album.strDescriptionEN,
                onAddToPlaylistPressed: {
                    
                },
                onPlayPressed: {
                    
                }
            )
        }
    }
    
    
    private var listRows: some View {
        
        ForEach(vm.albums.prefix(5), id: \.idAlbum) { row in
            
            VStack(spacing: 8) {
                Text(row.strAlbum)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.spotifyWhite)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                
                
                ScrollView(.horizontal) {
                    HStack(alignment: .top, spacing: 16) {
                        ForEach(vm.albums, id: \.idAlbum) { album in
                            NavigationLink(destination: SpotifyPlaylistView(album: album)) {
                                ImageTitleRowCell(
                                    imageSize: 120,
                                    imageName: album.strAlbumThumb ?? "",
                                    title: "\(String(album.strAlbum.prefix(10)))..."
                                )
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                }
                .scrollIndicators(.hidden)
            }
            
            
        }
    }
    
}

#Preview {
    SpotifyHomeView()
}


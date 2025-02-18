//
//  SongVM.swift
//  SpotifyClone
//
//  Created by test on 14/02/25.
//
//
import Foundation

class AlbumViewModel: ObservableObject {
    @Published var albums: [Album] = []
    @Published var showPlayer: Bool = false
    
   
    func getData() async {
        guard let url = URL(string: "https://www.theaudiodb.com/api/v1/json/2/album.php?i=112024") else {
            print("Invalid URL.")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode(AlbumResponse.self, from: data)
            DispatchQueue.main.async {
                self.albums = decodedResponse.album
            }
        } catch {
            print("Error fetching albums: \(error.localizedDescription)")
        }
    }
}

/*
 Thursday
 House of Balloons
 Echoes of Silence
 Trilogy
 Kiss Land
 Beauty Behind the Madness
 
 Balloons of Haus
 The Weeknd Prequel: The Noise
 Balloons In October: PeachtreeGirl Remixes
 OVOXO Dear Valerie
 Starboy
 Wicked Games
 Feel It Coming
 My Dear Melancholy
 
*/

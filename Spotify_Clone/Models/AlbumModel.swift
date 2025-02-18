//
//  SongModel.swift
//  SpotifyClone
//
//  Created by test on 14/02/25.
//

import Foundation


struct AlbumResponse: Codable {
    let album: [Album]
}

struct Album: Codable {
    let idAlbum: String
    let idArtist: String
    let strAlbum: String
    let strArtist: String
    let intYearReleased: String?
    let strGenre: String?
    let strLabel: String?
    let strReleaseFormat: String?
    let strAlbumThumb: String?
    let strDescriptionEN: String?
   
    static var mock: Album {
        Album(
            idAlbum: "2115886",
            idArtist: "String",
            strAlbum: "Thursday",
            strArtist: "The Weeknd",
            intYearReleased: "2011",
            strGenre: "R&B",
            strLabel: "Republic Records",
            strReleaseFormat: "Mixtape/Street",
            strAlbumThumb: "https://www.theaudiodb.com/images/media/album/thumb/thursday-4ee69293cd094.jpg",
            strDescriptionEN: "Thursday is the second mixtape of Canadian artist, The Weeknd, released August 18, 2011 via his official website. "
        )
    }
    
}

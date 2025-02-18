//
//  ImageTitleRowCell.swift
//  SpotifyClone
//
//  Created by test on 13/02/25.
//

import SwiftUI

struct ImageTitleRowCell: View {
    
    var imageSize: CGFloat = 100
    var imageName: String = Constants.randomImage
    var title:String = "Some Item Name"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ImageLoaderView(urlString: imageName)
                .frame(width: imageSize, height: imageSize)
            
            Text(title)
                .lineLimit(2)
                .font(.callout)
                .foregroundStyle(.spotifyLightGray)
                .padding(4)
        }
        .frame(width: imageSize)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        ImageTitleRowCell()
    }
    
}

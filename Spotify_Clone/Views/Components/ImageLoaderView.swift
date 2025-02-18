//
//  ImageLoaderView.swift
//  SpotifyClone
//
//  Created by test on 05/02/25.
//

import SwiftUI

struct ImageLoaderView: View {
    
    var urlString: String = Constants.randomImage
        var resizingMode: ContentMode = .fill
        
        var body: some View {
            Rectangle()
                .opacity(0.001) // This will make the rectangle invisible, so it's still there as a container.
                .overlay(
                    AsyncImage(url: URL(string: urlString)) { phase in
                        switch phase {
                        case .empty:
                            // Show a loading indicator while the image is being fetched
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle())
                                .padding()
                        case .success(let image):
                            // Display the image once it's successfully loaded
                            image.resizable()
                                .aspectRatio(contentMode: resizingMode)
                                .allowsHitTesting(false)
                        case .failure:
                            // Display a fallback if the image fails to load
                            Text("Failed to load image")
                                .foregroundColor(.red)
                        @unknown default:
                            EmptyView()
                        }
                    }
                )
                .clipped()
        }
    }

#Preview {
    ImageLoaderView()
        .cornerRadius(30)
        .padding(40)
        .padding(.vertical, 60)
}

//
//  Library.swift
//  MangaApp
//
//  Created by Angelo on 18/11/2024.
//

import SwiftUI
import ExyteGrid

struct Library: View {
    @State var library: [Manga]
    
    init() {
        library = decodeUserDefaults(forKey: "library", defaultingTo: [])
    }
    
    var body: some View {
        Group {
            if library.isEmpty {
                VStack(alignment: .center) {
                    Text("🙁")
                        .font(.title)
                    Text("Your library is empty")
                        .foregroundStyle(.secondary)
                }
            } else {
                Grid(tracks: 3, spacing: 8) {
                    ForEach(library) { manga in
                        NavigationLink {
                            MangaOverview(manga: manga)
                        } label: {
                            MangaCover(manga: manga)
                        }
                    }
                }
                .gridContentMode(.scroll)
                .gridPacking(.dense)
                .gridFlow(.rows)
                .padding(.horizontal, 8)
                .gridContentAlignment(.leading)
            }
        }
        .navigationTitle("Library")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

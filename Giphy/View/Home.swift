//
//  Home.swift
//  Giphy
//
//  Created by Kadir Ince on 28.09.2020.
//

import SDWebImageSwiftUI
import SwiftUI

struct Home: View {
    @State var gifData: [String] = []
    @State var present = false
    @State var url = ""

    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false, content: {
                ForEach(gifData, id: \.self) { url in
                    HStack {
                        Spacer()
                        AnimatedImage(url: URL(string: url)!)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(CustomShape())
                            .contextMenu {
                                Button(action: {
                                    // for save gif
                                }) {
                                    HStack {
                                        Text("Save")
                                        Spacer()
                                        Image(systemName: "square.and.arrow.down")
                                    }
                                    .foregroundColor(.black)
                                }
                            }
                    }
                    .padding()
                }
                .onChange(of: url, perform: { value in
                    self.gifData.append(value)
                })
                .navigationTitle("Gif's")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar(content: {
                    Button(action: {
                        present.toggle()
                    }, label: {
                        Image(systemName: "plus.square")
                            .font(.title)
                    })
                })
            })
                .fullScreenCover(isPresented: $present, content: {
                    GifController(url: $url, present: $present)
                })
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

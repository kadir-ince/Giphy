//
//  Home.swift
//  Giphy
//
//  Created by Kadir Ince on 28.09.2020.
//

import SwiftUI
import SDWebImageSwiftUI

struct Home: View {
    @State var gifData: [String] = []
    @State var present = false
    @State var url = ""

    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false, content: {
                ForEach(gifData, id : \.self) { url in
                    HStack{
                        Spacer()
                        AnimatedImage(url: URL(string: url)!)
                            .resizable()
                            .frame(width: screen.width - 100, height: 200)
                            .cornerRadius(15)
                    }
                    .padding()
                }
            })
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

//
//  CustomShape.swift
//  Giphy
//
//  Created by Kadir Ince on 28.09.2020.
//

import SwiftUI
struct CustomShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight,.bottomLeft,.bottomRight], cornerRadii: CGSize(width: 15, height: 15  ))
        return Path(path.cgPath)
    }
}

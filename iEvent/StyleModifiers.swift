//
//  StyleModifiers.swift
//  iEvent
//
//  Created by Mohit Sharma on 30/1/2024.
//

import SwiftUI

enum FontWeight
{
    case bold
    case medium
    case regular
}

struct FontStyle : ViewModifier
{
    var fontSize: CGFloat = 14.0
    var fontWeight : FontWeight = .regular
    func body(content: Content) -> some View {
        content
            .font(getFontStyle())
    }
    
    func getFontStyle() -> Font
    {
        var font = Font.custom("Roboto-Regular", size: fontSize)
        switch fontWeight {
        case .bold:
            font  = Font.custom("Roboto-Bold", size: fontSize)
        case .medium:
            font = Font.custom("Roboto-Medium", size: fontSize)
        case .regular:
            font = Font.custom("Roboto-Regular", size: fontSize)
        }
        return font
    }
}

//struct RegularTextStyle : ViewModifier
//{
//    var fontSize: CGFloat = 14.0
//    func body(content: Content) -> some View {
//        content
//            .font(Font.custom("Roboto-Medium", size: fontSize))
//            .foregroundColor(.gray)
//    }
//}
//
//struct MediumTextStyle : ViewModifier
//{
//    var fontSize: CGFloat = 14.0
//    func body(content: Content) -> some View {
//        content
//            .font(Font.custom("Roboto-Medium", size: fontSize))
//            .foregroundColor(.gray)
//    }
//}


struct RedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .modifier(FontStyle(fontWeight: .bold))
            .padding(10)
            .background(Color.red)
            .foregroundColor(Color.white)
            .cornerRadius(4)
            .opacity(configuration.isPressed ? 0.8 : 1.0)
            .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0, y :10)
            .scaleEffect(configuration.isPressed ? 0.8 : 1.0)
    }
}

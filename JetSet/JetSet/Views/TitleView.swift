//
//  ContentView.swift
//  JetSet
//
//  Created by Trevor Sharnick on 10/8/23.
//
/* JetSet App Title page. 
 
 Will use a Radial Gradient View for the background
 */

import SwiftUI

// Extending text to include a custom title font 'JetSet'
extension Text {
    func titleFont() -> some View {
        font(.system(size: 80))
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .foregroundColor(.white)
    }
}

// The background gradient representing the title view, including the JetSet title and a navigation button to redirect to the main menu
struct TitleView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                RadialGradientView()
                Text("JetSet")
                    .titleFont()
                // Used overlay to add an airplane icon trailing the bottom curve of the 't' in the title
                    .overlay(
                        Image(systemName: "airplane")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .offset(x: 20, y: -11)
                            .alignmentGuide(.top) { _ in -10 }
                            .alignmentGuide(.trailing) { _ in 20 }
                        , alignment: .bottomTrailing
                    )
                /*
                 1) .offset(x: 20, y: -11): This modifier adjusts the position of the airplane icon within the Text view. It moves the icon 20 points to the right (x-axis) and 11 points upward (negative y-axis) relative to its original position. The offset allows you to precisely position the icon where you want it in relation to the text.
                 2) .alignmentGuide(.top) { _ in -10 }: This modifier specifies an alignment guide for the top edge of the Image. It effectively shifts the image upward by 10 points from where it would naturally be placed based on the text's baseline.
                 3) .alignmentGuide(.trailing) { _ in 20 }: This modifier specifies an alignment guide for the trailing edge of the Image. It shifts the image 20 points to the right from where it would naturally be placed based on the text's baseline.
                 4) alignment: .bottomTrailing: This sets the alignment of the Image within the overlay. In this case, you're aligning the image to the bottom trailing corner of the Text, which helps position it near the bottom curve of the 't' in 'JetSet'.
                 */
                NavigationLink {
                    MenuView()
                } label: {
                    Text("Go to Main Menu")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                            .fill(Color.green)
                            .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 5)
                        )
                }
                .offset(x: 0, y: 300)
            }
            .ignoresSafeArea()
        }
    }
}


#Preview {
    TitleView()
}

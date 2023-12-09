//
//  RadialGradientView.swift
//  JetSet
//
//  Created by Trevor Sharnick on 11/19/23.

// blank template for various app screens

import SwiftUI

struct RadialGradientView: View {
    var body: some View {
            ZStack {
                RadialGradient(
                    gradient:
                        Gradient(colors: [.orange, .green, .cyan, .black]),
                    center: .center,
                    startRadius: 20,
                    endRadius: 500)
            }
    }
}

#Preview {
    RadialGradientView()
}

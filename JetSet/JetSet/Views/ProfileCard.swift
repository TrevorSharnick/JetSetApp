//
//  ProfileCard.swift
//  JetSet
//
//  Created by Nathan Fuller on 12/9/23.
//

import SwiftUI

struct ProfileCard: View {
    var body: some View {
        VStack() {
            Spacer()
            // Aircraft name
            Text("A-10 Warthog")
                .font(.title.weight(.semibold))
                .foregroundColor(.white)
                .shadow(radius: 6)
                .padding()
        }
        .frame(width: 300, height: 250, alignment: .leading)
        .background {
            Image(.warthog)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .overlay {
                    LinearGradient(colors: [.black.opacity(0.4), .clear], startPoint: .bottom, endPoint: .center)
                }
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct ProfileCard_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            ProfileCard()
        }
    }
}

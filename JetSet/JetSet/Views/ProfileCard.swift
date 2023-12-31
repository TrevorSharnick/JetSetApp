//
//  ProfileCard.swift
//  JetSet
//
//  Created by Nathan Fuller on 12/9/23.
//

import SwiftUI
/// ** Passes in an instance of the AircraftProfile struct and the title and imageURL properties from it; displaying them as profile cards in the view:
struct ProfileCard: View {
    
    let profile: AircraftProfile
    
    var body: some View {
        
        VStack() {
            Spacer()
            // Aircraft name
            Text(profile.title)
                .font(.title.weight(.semibold))
                .foregroundColor(.white)
                .shadow(radius: 6)
                .padding()
        }
        .frame(width: 300, height: 250, alignment: .leading)
        .background {
            ZStack {
                Color.white.opacity(0.3)
                /// attempts to unwrap the optional AircraftProfile property (imageURL). If it is not nil, assign its value to url
                if let imageURL = profile.imageURL {
                    AsyncImage(url: imageURL) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .overlay { gradient }
                    } placeholder: {
                        placeholder
                    }
                } else {
                    placeholder
                }
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
    
    private var placeholder: some View {
        ZStack {
            Image(systemName: "airplane")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120)
                .foregroundStyle(.white)
            gradient
        }
    }
    
    private var gradient: some View {
        LinearGradient(colors: [.black.opacity(0.4), .clear], startPoint: .bottom, endPoint: .center)
    }
    
}

struct ProfileCard_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            ProfileCard(profile: .preview)
        }
    }
}

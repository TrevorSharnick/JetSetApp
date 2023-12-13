//  MenuView.swift
//
//  JetSet
//
//  Created by Trevor Sharnick on 11/19/23.
//

import SwiftUI

struct MenuView: View {
    @State var profiles: [AircraftProfile] = []
    
    var body: some View {
        ZStack {
            RadialGradientView().ignoresSafeArea()
            VStack {
                if !$profiles.isEmpty {
                    // Allows the HStack of Aircraft profiles to scroll side to side
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 0) {
                            ForEach(profiles) { profile in
                                // TODO: Redirects the user to their saved jet profile checklist group
                                ProfileCard(profile: profile)
                                    .containerRelativeFrame(.horizontal)
                            }
                        }
                    }
                    .scaledToFit()
                    .padding(.vertical)
                }
                
                // Decided to encapsulate the prompt and button necessary for creating new jet profiles in a separate VStack
                VStack {
                    Text("Create a New Jet Profile")
                        .font(.title.bold())
                        .foregroundStyle(.accent)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                    
                    // Button to Create a new Jet profile
                    Button(action: {
                        // Action to perform when the button is tapped
                        print("Button tapped: Create a new jet profile")
                        // TODO: Add the code and view necessary for the user to create their own jet profile
                        
                    }) {
                        
                        /*
                         In SwiftUI, views are layered in a Z-stack from back to front. Since the overlay is on top of the button, it can intercept touch events. To resolve this issue, you can modify your layout by placing the overlay inside the button itself rather than as a separate modifier.
                         */
                        ZStack {
                            Circle()
                                .frame(width: 80, height: 80)
                                .foregroundColor(.yellow)
                                .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 5)
                            
                            Image(systemName: "person.circle")
                                .font(.system(size: 80))
                                .foregroundColor(.white)
                            
                            
                        }
                    }
                }
            }
        }
        .navigationTitle("Profiles")
        .onAppear {
            fetchProfiles()
        }
    }
    
    private func fetchProfiles() {
        profiles = [AircraftProfile].preview
    }
}
#Preview {
//    NavigationStack {
        MenuView()
//    }
}

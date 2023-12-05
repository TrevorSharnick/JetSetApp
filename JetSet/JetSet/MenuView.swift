//
//  MenuView.swift
//  JetSet
//
//  Created by Trevor Sharnick on 11/19/23.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        
        NavigationView {
            ZStack {
                RadialGradientView()
                VStack {
                    // Allows the HStack of Aircraft profiles to scroll side to side
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            Spacer() // Centers the first profile
                            // TODO: Redirects the user to their saved jet profile checklist group
                            Button(action: {
                                print("Button tapped: Warthog profile")
                                
                            }) {
                                NavigationLink(destination: WarthogDemoTodos()) {
                                    Rectangle()
                                        .fill(Color.white)
                                        .frame(width: 300, height: 300)
                                        .cornerRadius(20)
                                        .overlay(
                                            VStack {
                                                // Aircraft name
                                                Text("A-10 Warthog")
                                                    .font(.system(size: 24, weight: .bold))
                                                    .foregroundColor(.black)
                                                    .offset(y: -30)
                                                
                                                Image("Warthog")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 150, height: 150)
                                                    .offset(y: -30)
                                                
                                            }
                                        )
                                }
                            }
                        }
                    }
                    
                    // Decided to encapsulate the prompt and button necessary for creating new jet profiles in a separate VStack
                    VStack {
                        Text("Create a New Jet Profile")
                            .font(.system(size: 24, weight: .bold))
                            .padding(.top, 59)
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
                        } .padding(.top, 20)
                       
                    }
                }
                .padding()
            }
            
            .navigationBarTitle("Profiles", displayMode: .inline)
            
        }
    }
}
#Preview {
    MenuView()
}

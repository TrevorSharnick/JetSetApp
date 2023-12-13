//
//  ChecklistsView.swift
//  JetSet
//
//  Created by Trevor Sharnick on 11/28/23.
//

import SwiftUI

struct ChecklistsView: View {
    @State var profile: AircraftProfile
    
    var body: some View {
        // The entire view should be enclosed within a list to scroll collectively
        List {
            ForEach ($profile.checklists, id: \.title) { $checklist in
                Section {
                    ForEach ($checklist.items) { $item in
                        HStack {                                      Text(item.description)
                                .strikethrough(item.done)
                            Spacer()
                            
                            Text(item.action)
                                .strikethrough(item.done)
                            Image(systemName: item.done ? "checkmark.square" : "square")
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            item.done.toggle()
                        }
                    }
                } header: {
                    Text(checklist.title)
                        .foregroundStyle(.accent)
                }
            }
        }
        .background(RadialGradientView().ignoresSafeArea())
        .scrollContentBackground(.hidden)
        .navigationTitle("A-10 Procedures")
    }
}

#Preview {
    NavigationStack {
        ChecklistsView(profile: [AircraftProfile].preview.first!)
    }
}


//
//  AddActivityView.swift
//  HabitTracker
//
//  Created by ardano on 25.08.2025.
//

import SwiftUI

struct AddActivityView: View {
    @State private var name = ""
    @State private var description = ""
    @State private var count = 0
    
    var activities: Activities
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.primaryBackground.ignoresSafeArea()
                
                VStack(spacing: 20) {
                        VStack(alignment: .leading, spacing: 12) {
                        Text("Habit Name")
                            .font(.habitSubtitle)
                            .foregroundStyle(.textSecondary)
                        
                        TextField("Enter habit name", text: $name)
                            .padding()
                            .background(Color.secondaryBackground)
                            .cornerRadius(12)
                            .foregroundStyle(.textPrimary)
                    }
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Description")
                            .font(.habitSubtitle)
                            .foregroundStyle(.textSecondary)
                        
                        TextField("Enter description", text: $description, axis: .vertical)
                            .padding()
                            .background(Color.secondaryBackground)
                            .cornerRadius(12)
                            .foregroundStyle(.textPrimary)
                    }
                    
                    Spacer()
                    
                    Button {
                        activities.items.append(
                            ActivityItem(name: name, description: description, count: count)
                        )
                        dismiss()
                    } label: {
                        Text("Add Activity")
                            .font(.habitSubtitle)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(name.isEmpty ? Color.gray : Color.accent)
                            .foregroundStyle(.white)
                            .cornerRadius(16)
                            .shadow(color: .black.opacity(0.2), radius: 6, x: 0, y: 4)
                    }
                    .disabled(name.isEmpty)
                }
                .padding()
            }
            .navigationTitle("Add Activity")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}



#Preview {
    AddActivityView(activities: Activities())
        .preferredColorScheme(.dark)
}

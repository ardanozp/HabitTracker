//
//  ActivityDetailView.swift
//  HabitTracker
//
//  Created by ardano on 25.08.2025.
//

import SwiftUI

struct ActivityDetailView: View {
    @Bindable var activities: Activities
    @Binding var activity: ActivityItem
    
    var body: some View {
        ZStack {
            Color.primaryBackground.ignoresSafeArea()
            
            VStack(spacing: 20) {
                Spacer()
                // MARK: - Aktivite başlık
                Text(activity.name)
                    .font(.habitTitle)
                    .foregroundStyle(.textPrimary)
                
                // MARK: - Aktivite açıklama
                Text(activity.description)
                    .font(.habitSubtitle)
                    .foregroundStyle(.textSecondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                // MARK: - Sayaç ve buton
                VStack(spacing: 16) {
                    Button {
                        withAnimation(.spring) {
                            activity.count += 1
                        }
                    } label: {
                        Label("Done", systemImage: "checkmark.circle.fill")
                            .padding()
                            .background(Color.success)
                            .foregroundStyle(.white)
                            .clipShape(Capsule())
                    }
                    
                    Text("\(activity.count) day(s) completed.")
                        .font(.habitTitle)
                        .foregroundStyle(.accent)
                        .animation(.easeInOut, value: activity.count)
                }
                .padding(.top, 20)
                
                Spacer()
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let activities = Activities()
    let activity = ActivityItem(name: "Swim", description: "Swim 30 minutes", count: 0)
    return NavigationStack {
        ActivityDetailView(activities: activities, activity: .constant(activities.items[0]))
    }
}

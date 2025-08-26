//
//  ContentView.swift
//  HabitTracker
//
//  Created by ardano on 25.08.2025.
//

import SwiftUI

struct ActivityItem: Identifiable, Codable, Equatable, Hashable {
    var id = UUID()
    var name: String
    var description: String
    var count: Int
}

@Observable
class Activities {
    var items = [ActivityItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ActivityItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}

struct ContentView: View {
    @State private var showingSheet = false
    @State private var activities = Activities()
    
    var body: some View {
        NavigationStack {
            ZStack {
                // MARK: - Tema arka plan rengi
                Color.primaryBackground.ignoresSafeArea()
                
                if activities.items.isEmpty {
                    // MARK: - Boş liste durumu için mesaj
                    VStack {
                        Image(systemName: "list.bullet.clipboard")
                            .font(.system(size: 60))
                            .foregroundStyle(.accent)
                            .padding(.bottom, 10)
                        
                        Text("You haven't added any activity yet.")
                            .font(.habitSubtitle)
                            .foregroundStyle(.textSecondary)
                    }
                } else {
                    List {
                        ForEach($activities.items) { $activity in
                            NavigationLink {
                                ActivityDetailView(activities: activities, activity: $activity)
                            } label: {
                                HabitCard(activity: activity)
                            }
                            .listRowBackground(Color.clear)
                        }
                        .onDelete(perform: delete)
                    }
                    .scrollContentBackground(.hidden)
                }
            }
            .navigationTitle("Habit Tracker")
            .toolbar {
                Button {
                    showingSheet.toggle()
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.title2)
                        .foregroundStyle(.accent)
                }
                .sheet(isPresented: $showingSheet) {
                    AddActivityView(activities: activities)
                }
            }
        }
    }
    
    func delete(at offsets: IndexSet) {
        activities.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}

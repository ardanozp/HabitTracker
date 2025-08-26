//
//  Theme.swift
//  HabitTracker
//
//  Created by ardano on 20.08.2025.
//

import SwiftUI

// MARK: - Color Theme
extension ShapeStyle where Self == Color {
    static var primaryBackground: Color {
        Color(red: 0.08, green: 0.10, blue: 0.15) // koyu ana arka plan
    }
    
    static var secondaryBackground: Color {
        Color(red: 0.15, green: 0.18, blue: 0.25) // kart arka planı
    }
    
    static var accent: Color {
        Color(red: 0.3, green: 0.6, blue: 0.9) // vurgu rengi
    }
    
    static var success: Color {
        Color(red: 0.2, green: 0.7, blue: 0.4) // alışkanlık tamamlandı
    }
    
    static var warning: Color {
        Color(red: 0.9, green: 0.6, blue: 0.2) // uyarı, hatırlatma
    }
    
    static var danger: Color {
        Color(red: 0.9, green: 0.2, blue: 0.2) // kötü alışkanlık/iptal
    }
    
    static var textPrimary: Color {
        Color.white
    }
    
    static var textSecondary: Color {
        Color.gray.opacity(0.7)
    }
}

// MARK: - Font Theme
extension Font {
    static var habitTitle: Font {
        .system(size: 22, weight: .bold, design: .rounded)
    }
    
    static var habitSubtitle: Font {
        .system(size: 16, weight: .medium, design: .rounded)
    }
    
    static var habitBody: Font {
        .system(size: 14, weight: .regular, design: .rounded)
    }
}

// MARK: - View Helpers
extension View {
    func habitCardStyle() -> some View {
        self
            .padding()
            .background(Color.secondaryBackground)
            .cornerRadius(12)
            .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 4)
    }
}

struct HabitCard: View {
    var activity: ActivityItem
    
    var body: some View {
        HStack {
      
            // MARK: - Metinler
            VStack(alignment: .leading, spacing: 4) {
                Text(activity.name)
                    .font(.headline)
                    .foregroundColor(.textPrimary)
                Text(activity.description)
                    .font(.subheadline)
                    .foregroundColor(.textSecondary)
            }
            
            Spacer()
            
            // MARK: - Sayaç
            Text("\(activity.count)")
                .font(.subheadline)
                .padding(8)
                .background(Color.accent.opacity(0.2))
                .cornerRadius(8)
        }
        .padding()
        .background(Color.secondaryBackground)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.15), radius: 6, x: 0, y: 4)
    }
}


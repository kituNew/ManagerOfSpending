//
//  DetailRow.swift
//  ManagerOfSpending
//
//  Created by Zaitsev Vladislav on 12.02.2025.
//

import SwiftUI

struct DetailRow: View {
    let icon: String
    let value: String
    
    var body: some View {
        HStack {
            Image(systemName: getIconName(icon))
                .font(.headline)
                .foregroundColor(.accentColor)
                .frame(width: 24)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(icon)
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Text(value)
                    .font(.body)
                    .fontWeight(.medium)
                    .textSelection(.enabled)
            }
            Spacer()
        }
        .padding(.vertical, 8)
    }
    
    private func getIconName(_ icon: String) -> String {
        switch icon {
        case "Категория": return "tag.fill"
        case "Дата": return "calendar"
        case "Заметки": return "note.text"
        case "Сумма": return "reblesign.circle"
        default: return "info.circle"
        }
    }
}

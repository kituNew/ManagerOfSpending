//
//  ExstantionUserDefaults.swift
//  ManagerOfSpending
//
//  Created by Zaitsev Vladislav on 26.02.2025.
//

import Foundation

extension UserDefaults {
    func save(value: [Transaction], forKey key: String) {
        do {
            let data = try JSONEncoder().encode(value)
            self.set(data, forKey: key)
        } catch {
            print("Ошибка при сохранении данных: \(error)")
        }
    }
    
    func load(forKey key: String) -> [Transaction]? {
        guard let data = self.data(forKey: key) else { return nil }
        do {
            let value = try JSONDecoder().decode([Transaction].self, from: data)
            return value
        } catch {
            print("Ошибка при загрузке данных: \(error)")
            return nil
        }
    }
}

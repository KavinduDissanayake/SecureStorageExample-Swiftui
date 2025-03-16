//
//  SecureStorage.swift
//  hmacSigning
//
//  Created by KavinduDissanayake on 2025-03-16.
//
import Security
import CryptoKit
import Foundation

@propertyWrapper
struct SecureStorage<T: Codable> {
    
    private let filename: String
    private let secureManager = SecureDocumentDataManager(
        secureEnclaveManager: .init(),
        hmacDataSignManager: .init()
    )
    
    var wrappedValue: T? {
        get { SecureStorage.loadData(filename) }
        set { saveData(newValue) }
    }
    
    init(_ filename: String) {
        self.filename = filename
    }
    
    private func saveData(_ value: T?) {
        do {
            let data = try JSONEncoder().encode(value)  // Encode optional value
            try secureManager.save(data: data, filename: filename)
        } catch {
            print("❌ Secure save failed: \(error)")
        }
    }
    
    private static func loadData(_ filename: String) -> T? {
        do {
            let secureManager = SecureDocumentDataManager(
                secureEnclaveManager: .init(),
                hmacDataSignManager: .init()
            )
            let decryptedData = try secureManager.load(filename: filename)
            return try JSONDecoder().decode(T.self, from: decryptedData)  // Decode JSON to model
        } catch {
            print("⚠️ Secure load failed: \(error)")
            return nil
        }
    }
}

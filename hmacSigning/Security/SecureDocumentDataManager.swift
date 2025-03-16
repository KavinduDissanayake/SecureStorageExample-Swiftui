//
//  SecureDocumentDataManager.swift
//  hmacSigning
//
//  Created by KavinduDissanayake on 2025-03-16.
//
import Security
import CryptoKit
import Foundation


struct SecureDocumentDataManager {
    
    let secureEnclaveManager: SecureEnclaveManager
    let hmacDataSignManager: HMACDataSignManager
    
    var url: URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    func save(data: Data, filename: String) throws {
        let encryptedData = try secureEnclaveManager.encrypt(data: data)
        let signedData = try hmacDataSignManager.sign(data: encryptedData)
        let fileURL = url.appendingPathComponent(filename)
        try signedData.write(to: fileURL)
    }
    
    func load(filename: String) throws -> Data {
        let fileURL = url.appendingPathComponent(filename)
        print("URLSAVEPATH: FOR DEBUG \(fileURL)")
        let signedData = try Data(contentsOf: fileURL)
        let privateKey = try secureEnclaveManager.getPrivateKey()
        let encryptedData = try hmacDataSignManager.validateHMAC(signedData: signedData)
        let decryptedData = try secureEnclaveManager.decrypt(encryptedData: encryptedData, privateKey: privateKey)
        return decryptedData
    }
    
}

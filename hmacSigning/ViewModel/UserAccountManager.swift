//
//  UserAccountManager.swift
//  hmacSigning
//
//  Created by KavinduDissanayake on 2025-03-16.
//
import Foundation

class UserAccountViewModel: ObservableObject {
    
    @SecureStorage("balance") var balance: Balance?

    func updateBalance(newAmount: Double) {
        balance = Balance(userId: 123456, amount: newAmount)
    }
}

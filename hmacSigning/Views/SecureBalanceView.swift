//
//  DocumentDataManager.swift
//  hmacSigning
//
//  Created by KavinduDissanayake on 2025-03-16.
//

import CryptoKit
import Foundation
import Security
import SwiftUI

struct SecureBalanceView: View {
    
    @StateObject private var viewModel = UserAccountViewModel()
    @State private var inputBalance: String = ""

    var body: some View {
        VStack(spacing: 20) {
            
            Text("💰 Secure Balance")
                .font(.largeTitle)
                .bold()
            
            Text("Current Balance: $\(viewModel.balance?.amount ?? 0.0, specifier: "%.2f")")
                .font(.title)
                .padding()

            TextField("Enter new balance", text: $inputBalance)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
                .padding()

            Button("Update Balance") {
                if let newAmount = Double(inputBalance) {
                    viewModel.updateBalance(newAmount: newAmount)
                }
                inputBalance = ""
            }
            .buttonStyle(.borderedProminent)
            .padding()

        }
        .padding()
    }
}


// Preview
#Preview {
    SecureBalanceView()
}


# hmacSigning

![Untitled](https://github.com/user-attachments/assets/7bbaff94-204b-4167-8c06-bb4f90ac6645)

## Overview
hmacSigning is a secure document storage system for iOS applications that leverages HMAC signing and Secure Enclave encryption to ensure data integrity and confidentiality. It provides a safe way to store, retrieve, and verify sensitive data using Apple's security framework.

## Features
- Secure file storage with encryption and HMAC signing.
- Uses Secure Enclave for key generation and storage.
- SwiftUI-based UI to display and update secure balances.
- Property wrapper (`@SecureStorage`) for easy secure data management.
- Ensures data integrity by validating HMAC signatures.

## Folder Structure
```
hmacSigning/
│─── App/                          # SwiftUI Views & ViewModels
│    ├── SecureBalanceView.swift
│    ├── UserAccountManager.swift
│
│─── Models/                       # Data models
│    ├── Balance.swift
│
│─── Security/                     # Security-related managers
│    ├── SecureStorage.swift       # @SecureStorage property wrapper
│    ├── SecureDocumentDataManager.swift
│    ├── HMACDataSignManager.swift
│    ├── SecureEnclaveManager.swift
│
│─── Services/                     # Business logic & data handling
│    ├── DocumentDataManager.swift
│
│─── Extensions/                   # Swift extensions
│    ├── Optional+RawRepresentable.swift
│
│─── Resources/                    # Assets, JSON files, etc.
│
│─── Tests/                        # Unit & UI tests
│    ├── hmacSigningTests/
│    ├── hmacSigningUITests/
│
│─── hmacSigningApp.swift          # App entry point
│─── Info.plist
│─── Package.swift                 # If using Swift Package Manager
```

## Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/yourusername/hmacSigning.git
   ```
2. Open the Xcode project:
   ```sh
   cd hmacSigning
   open hmacSigning.xcodeproj
   ```
3. Build and run the project on an iOS simulator or device.

## Usage
### Secure Data Storage
To store and retrieve data securely, use the `@SecureStorage` property wrapper:
```swift
@SecureStorage("balance") var balance: Balance?
```
Updating balance securely:
```swift
func updateBalance(newAmount: Double) {
    balance = Balance(userId: 123456, amount: newAmount)
}
```

### Secure Encryption & Signing
- **Encryption**: Data is encrypted using Secure Enclave.
- **HMAC Signing**: Ensures data integrity by appending an HMAC signature.
- **Validation**: HMAC is checked before decrypting to verify authenticity.

## Security Implementation
- **Secure Enclave**: Used for private key storage and encryption.
- **HMAC SHA-256**: Used for signing data.
- **Keychain Storage**: Stores generated keys securely.

## License
This project is licensed under the MIT License.

## Contributions
Contributions are welcome! Please create a pull request or open an issue if you find any bugs or improvements.

## Author
Developed by Kavindu Dissanayake.

## Contact
For any inquiries, reach out via email: [kcrdissanayake@gmail.com]


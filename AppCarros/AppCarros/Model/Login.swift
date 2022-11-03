import Foundation

// MARK: - Login
struct Login: Codable {
    let id: Int?
    let login, nome, email: String?
    let urlFoto: String?
    let token: String?
    let roles: [String]?
}

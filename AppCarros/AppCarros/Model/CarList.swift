import Foundation

// MARK: - CarListElement
struct CarList: Codable {
    let id: Int?
    let nome: String?
    let tipo: String?
    let descricao: String?
    let urlFoto: String?
    let urlVideo: String?
    let latitude, longitude: String?
}

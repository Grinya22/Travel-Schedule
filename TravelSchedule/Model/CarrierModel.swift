import Foundation

struct Carrier: Identifiable {
    let id = UUID()
    let name: String
    let transferInfo: String?
    let date: String
    let departureTime: String
    let duration: String
    let arrivalTime: String
    let logoURL: String?
}

import OpenAPIRuntime
import OpenAPIURLSession

typealias StationsSchedule = Components.Schemas.ScheduleResponse

protocol StationsScheduleServiceProtocol {
    func getStationSchedule(station: String) async throws -> StationsSchedule
    
}

final class StationsScheduleService: StationsScheduleServiceProtocol {
    private let client: Client
    private let apikey: String
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    func getStationSchedule(station: String) async throws -> StationsSchedule {
        let response = try await client.getStationSchedule(query: .init(
            apikey: apikey,
            station: station
        ))
        
        return try response.ok.body.json
    }
}


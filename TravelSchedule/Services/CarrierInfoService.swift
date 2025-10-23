import OpenAPIRuntime
import OpenAPIURLSession

typealias carrierInfo = Components.Schemas.CarrierResponse

protocol carrierInfoServiceProtocol {
    func getCarrierInfo(code: String) async throws -> carrierInfo
}

final class carrierInfoService: carrierInfoServiceProtocol {
    private let client: Client
    private let apikey: String
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    func getCarrierInfo(code: String) async throws -> carrierInfo {
        let response = try await client.getCarrierInfo(query: .init(
            apikey: apikey,
            code: code
        ))
        
        return try response.ok.body.json
    }
}


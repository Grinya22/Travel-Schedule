//
//  ContentView.swift
//  TravelSchedule
//
//  Created by gregory maier on 10/22/25.
//

import SwiftUI
import OpenAPIURLSession

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            testNearestStations()
            testScheduleBetweenStations()
            testStationSchedule()
            testRouteStations()
            testNearestCity()
            testCarrierInfo()
            testAllStations()
            testCopyright()
        }
    }

    func testNearestStations() {
        Task {
            do {
                let client = Client(
                    serverURL: try Servers.Server1.url(),
                    transport: URLSessionTransport()
                )
                
                // 2. Создаём экземпляр нашего сервиса, передавая ему клиент и API-ключ
                let service = NearestStationsService(
                    client: client,
                    apikey: "0e297253-03cc-4fdd-9ecf-c220e435aeec"
                )
                
                // 3. Вызываем метод сервиса
                print("Fetching stations...")
                let stations = try await service.getNearestStations(
                    lat: 59.864177, // Пример координат
                    lng: 30.319163, // Пример координат
                    distance: 50    // Пример дистанции
                )
                
                // 4. Если всё успешно, печатаем результат в консоль
                print("Successfully fetched stations: \(stations)")
            } catch {
                // 5. Если произошла ошибка на любом из этапов (создание клиента, вызов сервиса, обработка ответа),
                //    она будет поймана здесь, и мы выведем её в консоль
                print("Error fetching stations: \(error)")
                // В реальном приложении здесь должна быть логика обработки ошибок (показ алерта и т. д.)
            }
        }
    }
    
    func testScheduleBetweenStations() {
        Task {
            do {
                let client = Client(
                    serverURL: try Servers.Server1.url(),
                    transport: URLSessionTransport()
                )
                
                let service = ScheduleBetweenStationsService(
                    client: client,
                    apikey: "0e297253-03cc-4fdd-9ecf-c220e435aeec"
                )
                
                print("Fetching stations...")
                let schedule = try await service.getScheduleBetweenStations(
                    from: "s9602496",
                    to: "s9602498"
                )
                
                print("Successfully fetched schedule: \(schedule)")
            } catch {
                print("Error fetching schedule: \(error)")
            }
        }
    }
    
    func testStationSchedule() {
        Task {
            do {
                let client = Client(
                    serverURL: try Servers.Server1.url(),
                    transport: URLSessionTransport()
                )
                
                let service = StationsScheduleService(
                    client: client,
                    apikey: "0e297253-03cc-4fdd-9ecf-c220e435aeec"
                )
                
                print("Fetching schedule for station...")
                let schedule = try await service.getStationSchedule(
                    station: "s9602496"
                )
                
                print("Successfully fetched schedule: \(schedule)")
            } catch {
                print("Error fetching schedule: \(error)")
            }
        }
    }
    
    func testRouteStations() {
        Task {
            do {
                let client = Client(
                    serverURL: try Servers.Server1.url(),
                    transport: URLSessionTransport()
                )
                
                let service = RouteStationsService(
                    client: client,
                    apikey: "0e297253-03cc-4fdd-9ecf-c220e435aeec"
                )
                
                print("Fetching route stations...")
                let routeStations = try await service.getRouteStations(
                    uid: "t2-1234567890"
                )
                
                print("Successfully fetched route stations: \(routeStations)")
            } catch {
                print("Error fetching route stations: \(error)")
            }
        }
    }
    
    func testNearestCity() {
        Task {
            do {
                let client = Client(
                    serverURL: try Servers.Server1.url(),
                    transport: URLSessionTransport()
                )
                
                let service = NearestCityStationsService(
                    client: client,
                    apikey: "0e297253-03cc-4fdd-9ecf-c220e435aeec"
                )
                
                let city = try await service.getNearestCity(
                    lat: 59.864177,
                    lng: 30.319163
                )
                
                print("Successfully fetched nearest city: \(city)")
            } catch {
                print("Error fetching nearest city: \(error)")
            }
        }
    }
    
    func testCarrierInfo() {
        Task {
            do {
                let client = Client(
                    serverURL: try Servers.Server1.url(),
                    transport: URLSessionTransport()
                )
                
                let service = carrierInfoService(
                    client: client,
                    apikey: "0e297253-03cc-4fdd-9ecf-c220e435aeec"
                )
                
                let carrier = try await service.getCarrierInfo(code: "S7")
                
                print("Successfully fetched carrier info: \(carrier)")
            } catch {
                print("Error fetching carrier info: \(error)")
            }
        }
    }
    
    func testAllStations() {
        Task {
            do {
                let client = Client(
                    serverURL: try Servers.Server1.url(),
                    transport: URLSessionTransport()
                )
                
                let service = AllStationsService(
                    client: client,
                    apikey: "0e297253-03cc-4fdd-9ecf-c220e435aeec"
                )
                
                let allStations = try await service.getAllStations()
                
                print("Successfully fetched all stations: \(allStations)")
            } catch {
                print("Error fetching all stations: \(error)")
            }
        }
    }
    
    func testCopyright() {
        Task {
            do {
                let client = Client(
                    serverURL: try Servers.Server1.url(),
                    transport: URLSessionTransport()
                )
                
                let service = CopyrightService(
                    client: client,
                    apikey: "0e297253-03cc-4fdd-9ecf-c220e435aeec"
                )
                
                let copyrightData = try await service.getCopyright()
                
                print("Successfully fetched copyright info: \(copyrightData)")
            } catch {
                print("Error fetching copyright info: \(error)")
            }
        }
    }
}

#Preview {
    ContentView()
}


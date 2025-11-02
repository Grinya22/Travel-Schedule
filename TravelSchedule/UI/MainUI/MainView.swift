import SwiftUI

struct MainView: View {
    let api = APIManager()

    var body: some View {
        TabView {
            FromToView()
                .tabItem {
                    Image("TabBarScheduleLeftItem")
                }
            
            SettingsView()
                .tabItem {
                    Image("TabBarSettingsRightItem")
                }
        }
        
        
        .onAppear {
//            api.testNearestStations()
//            api.testScheduleBetweenStations()
//            api.testStationSchedule()
//            api.testRouteStations()
//            api.testNearestCity()
//            api.testCarrierInfo()
//            api.testAllStations()
//            api.testCopyright()
        }
    }
    
    
}

#Preview {
    MainView()
}


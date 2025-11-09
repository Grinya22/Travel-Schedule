import SwiftUI

struct MainView: View {
    let api = APIManager()

    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .whiteDay
        
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.blackDay
        ]
        appearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.blackDay
        ]
        appearance.shadowColor = .clear
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
    }
    
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


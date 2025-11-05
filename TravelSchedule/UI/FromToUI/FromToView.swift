import SwiftUI

struct FromToView: View {
    @State private var path: [String] = []
    @State private var fromCity = ""
    @State private var fromStation = ""
    @State private var toCity = ""
    @State private var toStation = ""
    @State private var selectedTimes: Set<String> = []
    @State private var showTransfers: String? = nil
    
    var fromRoute: String {
        if fromStation.isEmpty {
            return fromCity
        } else {
            return "\(fromCity) (\(fromStation))"
        }
    }

    var toRoute: String {
        if toStation.isEmpty {
            return toCity
        } else {
            return "\(toCity) (\(toStation))"
        }
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(1..<9) { index in
                            StoryCardView(imageName: "\(index)StoryCard")
                        }
                    }
                    .padding(.horizontal)
                }
                HStack {
                    VStack(spacing: 0) {
                        HStack {
                            Text(fromCity.isEmpty ? "Откуда" : fromRoute)
                                .foregroundStyle(fromCity.isEmpty ? .secondary : .primary)
                            Spacer()
                        }
                        .padding()
                        .background(.whiteDay)
                        .onTapGesture {
                            path.append("CitySelectFrom")
                        }
                        HStack {
                            Text(toCity.isEmpty ? "Куда" : toRoute)
                                .foregroundStyle(toCity.isEmpty ? .secondary : .primary)
                            Spacer()
                        }
                        .padding()
                        .background(.whiteDay)
                        .onTapGesture {
                            path.append("CitySelectTo")
                        }
                    }
                    .cornerRadius(20)
                    Button(action: swapLocations) {
                        Image("ChangeBlueButton")
                            .frame(width: 36, height: 36)
                            .background(.whiteDay)
                            .clipShape(Circle())
                            .padding()
                    }
                }
                .padding()
                .background(.blueUniversal)
                .cornerRadius(20)
                .padding()
                
                if !fromCity.isEmpty && !toCity.isEmpty {
                    Button("Найти", action: find)
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.whiteUniversal)
                        .padding(.vertical, 20)
                        .padding(.horizontal, 60)
                        .background(.blueUniversal)
                        .cornerRadius(16)
                }
                
                Spacer()
            }
            .navigationDestination(for: String.self) { screen in
                switch screen {
                case "CitySelectFrom":
                    CitySelectView(
                        path: $path,
                        selectedCity: $fromCity,
                        nextScreen: "StationSelectFrom"
                    )
                case "CitySelectTo":
                    CitySelectView(
                        path: $path,
                        selectedCity: $toCity,
                        nextScreen: "StationSelectTo"
                    )
                case "StationSelectFrom":
                    StationSelectView(
                        path: $path,
                        selectedStation: $fromStation,
                        selectedCity: fromCity
                    )
                case "StationSelectTo":
                    StationSelectView(
                        path: $path,
                        selectedStation: $toStation,
                        selectedCity: toCity
                    )
                case "ListOfCarriersView":
                    ListOfCarriersView(
                        path: $path,
                        selectedTimes: $selectedTimes,
                        showTransfers: $showTransfers,
                        fromRoute: fromRoute,
                        toRoute: toRoute
                    )
                case "FiltrationView":
                    FiltrationView(
                        path: $path,
                        selectedTimes: $selectedTimes,
                        showTransfers: $showTransfers
                    )
                default:
                    EmptyView()
                }
            }
        }
    }
    
    private func swapLocations() {
        swap(&fromCity, &toCity)
        swap(&fromStation, &toStation)
    }
    
    private func find() {
        path.append("ListOfCarriersView")
    }
}

#Preview {
    FromToView()
}

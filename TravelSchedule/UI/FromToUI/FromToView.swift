import SwiftUI

struct FromToView: View {
    @State private var fromCity = ""
    @State private var fromStation = ""
    @State private var toCity = ""
    @State private var toStation = ""
    @State private var path: [String] = []
    
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
                            Text(fromCity.isEmpty ? "Откуда" : "\(fromCity)\(fromStation.isEmpty ? "" : " (\(fromStation))")")
                                .foregroundStyle(fromCity.isEmpty ? .secondary : .primary)
                            Spacer()
                        }
                        .padding()
                        .background(.whiteDay)
                        .onTapGesture {
                            path.append("CitySelectFrom")
                        }
                        HStack {
                            Text(toCity.isEmpty ? "Куда" : "\(toCity)\(toStation.isEmpty ? "" : " (\(toStation))")")
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
                        .padding(.horizontal, 50)
                        .background(Color.blueUniversal)
                        .cornerRadius(16)
                }
                
                Spacer()
            }
            .navigationDestination(for: String.self) { screen in
                switch screen {
                case "CitySelectFrom":
                    CitySelectView(
                        selectedCity: $fromCity,
                        path: $path,
                        nextScreen: "StationSelectFrom"
                    )
                case "CitySelectTo":
                    CitySelectView(
                        selectedCity: $toCity,
                        path: $path,
                        nextScreen: "StationSelectTo"
                    )
                case "StationSelectFrom":
                    StationSelectView(
                        selectedCity: fromCity,
                        selectedStation: $fromStation,
                        path: $path
                    )
                case "StationSelectTo":
                    StationSelectView(
                        selectedCity: toCity,
                        selectedStation: $toStation,
                        path: $path
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
        
    }
}

#Preview {
    FromToView()
}

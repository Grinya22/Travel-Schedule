import SwiftUI

struct StationSelectView: View {
    @Binding var path: [String]
    @Binding var selectedStation: String
    let selectedCity: String
    @State private var searchText = ""
    @Environment(\.colorScheme) var colorScheme
    
    private let stations = [
        "Киевский вокзал",
        "Курский вокзал",
        "Ярославский вокзал",
        "Белорусский вокзал",
        "Савеловский вокзал",
        "Ленинградский вокзал"
    ]
    
    var filteredStations: [String] {
        if searchText.isEmpty {
            return stations
        } else {
            return stations.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        VStack {
            Label {
                TextField("Поиск", text: $searchText)
                    .foregroundStyle(.blackDay)
                    .tint(.blackDay)
            } icon: {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.grayUniversal)
            }
            .padding(8)
            .background(colorScheme == .dark ? .lightGray.opacity(0.24) : .lightGray)
            .cornerRadius(10)
            .padding(.horizontal)
            
            if filteredStations.isEmpty {
                Spacer()
                Text("Станция не найдена")
                    .font(.system(size: 24, weight: .bold))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.blackDay)
                Spacer()
            } else {
                ScrollView {
                    VStack {
                        ForEach(filteredStations, id: \.self) { station in
                            Button {
                                selectedStation = station
                                path.removeAll()
                            } label: {
                                HStack {
                                    Text(station)
                                        .foregroundStyle(.blackDay)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .foregroundStyle(.blackDay)
                                }
                                .padding()
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("Выбор станции")
        .navigationBarTitleDisplayMode(.inline)
        .background(.whiteDay)
    }
}

#Preview {
    NavigationStack {
        StationSelectView(path: .constant([]), selectedStation: .constant(""), selectedCity: "")
    }
}

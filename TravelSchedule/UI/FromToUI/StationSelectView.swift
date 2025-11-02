import SwiftUI

struct StationSelectView: View {
    let selectedCity: String
    @Binding var selectedStation: String
    @Binding var path: [String]
    @State private var searchText = ""
    
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
            } icon: {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.grayUniversal)
            }
            .padding(8)
            .background(.lightGray)
            .cornerRadius(10)
            .padding(.horizontal)
            
            if filteredStations.isEmpty {
                Spacer()
                Text("Станция не найдена")
                    .font(.system(size: 24, weight: .bold))
                    .multilineTextAlignment(.center)
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
                                        .foregroundStyle(.blackUniversal)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .foregroundStyle(.blackUniversal)
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
    }
}

#Preview {
    NavigationStack {
        StationSelectView(selectedCity: "", selectedStation: .constant(""), path: .constant([]))
    }
}

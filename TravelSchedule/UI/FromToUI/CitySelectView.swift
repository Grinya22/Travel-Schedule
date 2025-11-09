import SwiftUI

struct CitySelectView: View {
    @Binding var path: [String]
    @Binding var selectedCity: String
    var nextScreen: String
    @State private var searchText = ""
    @Environment(\.colorScheme) var colorScheme
    
    private let cities = [
        "Москва",
        "Санкт-Петербург",
        "Сочи",
        "Горный воздух",
        "Краснодар",
        "Казань",
        "Омск"
    ]
    
    var filteredCities: [String] {
        if searchText.isEmpty {
            return cities
        } else {
            return cities.filter { $0.localizedCaseInsensitiveContains(searchText) }
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
            
            if filteredCities.isEmpty {
                Spacer()
                Text("Город не найден")
                    .font(.system(size: 24, weight: .bold))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.blackDay)
                Spacer()
            } else {
                ScrollView {
                    VStack {
                        ForEach(filteredCities, id: \.self) { city in
                            Button {
                                selectedCity = city
                                path.append(nextScreen)
                            } label: {
                                HStack {
                                    Text(city)
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
        .navigationTitle("Выбор города")
        .navigationBarTitleDisplayMode(.inline)
        .background(.whiteDay)
    }
}

#Preview {
    NavigationStack {
        CitySelectView(path: .constant([]), selectedCity: .constant(""), nextScreen: "")
    }
}

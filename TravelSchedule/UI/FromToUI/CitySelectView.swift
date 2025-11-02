import SwiftUI

struct CitySelectView: View {
    @Binding var selectedCity: String
    @Binding var path: [String]
    var nextScreen: String
    @State private var searchText = ""
    
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
            } icon: {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.grayUniversal)
            }
            .padding(8)
            .background(.lightGray)
            .cornerRadius(10)
            .padding(.horizontal)
            
            if filteredCities.isEmpty {
                Spacer()
                Text("Город не найден")
                    .font(.system(size: 24, weight: .bold))
                    .multilineTextAlignment(.center)
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
        .navigationTitle("Выбор города")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        CitySelectView(selectedCity: .constant(""), path: .constant([]), nextScreen: "")
    }
}

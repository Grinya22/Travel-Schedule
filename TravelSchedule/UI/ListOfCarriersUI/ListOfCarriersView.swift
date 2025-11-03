import SwiftUI

struct ListOfCarriersView: View {
    let fromRoute: String
    let toRoute: String
    @Binding var path: [String]
    
    var body: some View {
        VStack(spacing: 0) {
            Text("\(fromRoute) → \(toRoute)")
                .font(.system(size: 24, weight: .bold))
                .multilineTextAlignment(.leading)
                .foregroundColor(.blackUniversal)
                .padding(.bottom, 16)
            ScrollView {
                ForEach(0..<8) { index in
                    CarrierCardView(
                        carrierName: index % 2 == 0 ? "РЖД" : "ФГК",
                        transferInfo: index % 2 == 0 ? "С пересадкой в Костроме" : nil,
                        date: "14 января",
                        departureTime: "22:30",
                        duration: "20 часов",
                        arrivalTime: "08:15",
                        logoURL: nil
                    )
                }
                
            }
            
            Button("Уточнить время", action: filtration)
                .font(.system(size: 17, weight: .bold))
                .foregroundColor(.whiteUniversal)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(Color.blueUniversal)
                .cornerRadius(16)
                .padding(.horizontal, 16)
        }
        .navigationTitle("Список перевозчиков")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(.hidden, for: .tabBar)
    }
    func filtration() {
    }
}

#Preview {
    ListOfCarriersView(fromRoute: "Москва (Ярославский вокзал)", toRoute: "Санкт Петербург (Балтийский вокзал)", path: .constant([]))
}


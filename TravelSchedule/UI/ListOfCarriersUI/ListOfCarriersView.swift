import SwiftUI

struct ListOfCarriersView: View {
    @Binding var path: [String]
    @Binding var selectedTimes: Set<String>
    @Binding var showTransfers: String?
    
    let mockCarriers: [Carrier] = []

//    let mockCarriers: [Carrier] = [
//        Carrier(
//            name: "РЖД",
//            transferInfo: "С пересадкой в Костроме",
//            date: "14 января",
//            departureTime: "22:30",
//            duration: "20 часов",
//            arrivalTime: "08:15",
//            logoURL: nil
//        ),
//        Carrier(
//            name: "ФГК",
//            transferInfo: nil,
//            date: "15 января",
//            departureTime: "01:15",
//            duration: "8 часов",
//            arrivalTime: "09:00",
//            logoURL: nil
//        )
//    ]
    
    let fromRoute: String
    let toRoute: String
    
    private var hasActiveFilters: Bool {
        !selectedTimes.isEmpty || showTransfers != nil
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Text("\(fromRoute) → \(toRoute)")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.blackDay)
                .padding(.bottom, 16)
            ZStack(alignment: .bottom) {
                VStack {
                    if mockCarriers.isEmpty {
                        Spacer()
                        Text("Вариантов нет")
                            .font(.system(size: 24, weight: .bold))
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.blackDay)
                        Spacer()
                    } else {
                        ScrollView {
                            VStack {
                                ForEach(mockCarriers) { carrier in
                                    CarrierCardView(
                                        carrierName: carrier.name,
                                        transferInfo: carrier.transferInfo,
                                        date: carrier.date,
                                        departureTime: carrier.departureTime,
                                        duration: carrier.duration,
                                        arrivalTime: carrier.arrivalTime,
                                        logoURL: carrier.logoURL
                                    )
                                }
                            }
                            .padding(.bottom, 26)
                        }
                        .ignoresSafeArea(edges: .bottom)
                    }
                }

                Button(action: filtration) {
                    HStack(spacing: 8) {
                        Text("Уточнить время")
                            .font(.system(size: 17, weight: .bold))
                            .foregroundColor(.white)
                        if hasActiveFilters {
                            Circle()
                                .fill(.redUniversal)
                                .frame(width: 8, height: 8)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(.blueUniversal)
                    .cornerRadius(16)
                    .padding(.horizontal, 16)
                }
            }
        }
        .padding(.horizontal, 16)
        .toolbar(.hidden, for: .tabBar)
        .background(.whiteDay)
    }
    
    private func filtration() {
        path.append("FiltrationView")
    }
}

#Preview {
    NavigationStack {
        ListOfCarriersView(
            path: .constant([]),
            selectedTimes: .constant([]),
            showTransfers: .constant(nil),
            fromRoute: "Москва (Ярославский вокзал)",
            toRoute: "Санкт Петербург (Балтийский вокзал)"
        )
    }
}

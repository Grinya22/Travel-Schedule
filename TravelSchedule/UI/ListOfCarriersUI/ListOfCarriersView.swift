import SwiftUI

struct ListOfCarriersView: View {
    @Binding var path: [String]
    @Binding var selectedTimes: Set<String>
    @Binding var showTransfers: String?
    
    let fromRoute: String
    let toRoute: String
    
    private var hasActiveFilters: Bool {
        !selectedTimes.isEmpty || showTransfers != nil
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Text("\(fromRoute) → \(toRoute)")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.blackUniversal)
                .padding(.bottom, 16)
            ZStack(alignment: .bottom) {
                ScrollView {
                    VStack {
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
                }
                .ignoresSafeArea(edges: .bottom)
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

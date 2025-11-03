import SwiftUI

struct CarrierCardView: View {
    let carrierName: String
    let transferInfo: String?
    let date: String
    let departureTime: String
    let duration: String
    let arrivalTime: String
    let logoURL: String?
    
    var body: some View {
        VStack {
            HStack() {
                ZStack() {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.grayUniversal.opacity(0.3))
                        .frame(width: 38, height: 38)
                    Image(systemName: "train.side.front.car")
                }

                VStack(alignment: .leading) {
                    Text(carrierName)
                        .font(.system(size: 17))
                        .foregroundStyle(.blackUniversal)
                    if let transferInfo = transferInfo {
                        Text(transferInfo)
                            .font(.system(size: 12))
                            .foregroundStyle(.redUniversal)
                    }
                }
                Spacer()
                
                Text(date)
                    .font(.system(size: 12))
                    .foregroundStyle(.blackUniversal)
                    .padding(.bottom, 22)
            }
            .padding(.bottom, 16)
            
            HStack {
                Text(departureTime)
                    .font(.system(size: 17))
                    .foregroundStyle(.blackUniversal)
                    .fixedSize()
                Rectangle()
                    .fill(.grayUniversal)
                    .frame(height: 1)
                Text(duration)
                    .font(.system(size: 12))
                    .foregroundStyle(.blackUniversal)
                    .fixedSize()
                Rectangle()
                    .fill(.grayUniversal)
                    .frame(height: 1)
                Text(arrivalTime)
                    .font(.system(size: 17))
                    .foregroundStyle(.blackUniversal)
                    .fixedSize()
            }
        }
        .padding(20)
        .background(.lightGray)
        .cornerRadius(24)
        .padding(.horizontal, 16)
    }
}

#Preview {
    VStack(spacing: 8) {
        CarrierCardView(
            carrierName: "РЖД",
            transferInfo: "С пересадкой в Костроме",
            date: "14 января",
            departureTime: "22:30",
            duration: "20 часов",
            arrivalTime: "08:15",
            logoURL: nil
        )
        
        CarrierCardView(
            carrierName: "ФГК",
            transferInfo: nil,
            date: "15 января",
            departureTime: "01:15",
            duration: "8 часов",
            arrivalTime: "09:00",
            logoURL: nil
        )
    }
}

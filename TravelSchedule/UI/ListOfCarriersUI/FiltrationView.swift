import SwiftUI

struct FiltrationView: View {
    @Binding var path: [String]
    @Binding var selectedTimes: Set<String>
    @Binding var showTransfers: String?
    
    let timeOptions = [
        "Утро 06:00 - 12:00",
        "День 12:00 - 18:00",
        "Вечер 18:00 - 00:00",
        "Ночь 00:00 - 06:00"
    ]
    
    let yesNoOptions = [
        "Да",
        "Нет"
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 35) {
            VStack(alignment: .leading, spacing: 35) {
                Text("Время отправления")
                    .font(.system(size: 24, weight: .bold))
                    .multilineTextAlignment(.leading)
                ForEach(timeOptions, id: \.self) { option in
                    HStack {
                        Text(option)
                            .font(.system(size: 17))
                        Spacer()
                        if !selectedTimes.contains(option) {
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(.blackDay, lineWidth: 2)
                                .frame(width: 20, height: 20)
                        } else {
                            ZStack {
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(.blackDay)
                                    .frame(width: 20, height: 20)
                                Image(systemName: "checkmark")
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundColor(.whiteDay)
                            }
                        }
                    }
                    .onTapGesture {
                        toggleTime(option)
                    }
                }
            }
            .padding(.horizontal, 16)
            
            VStack(alignment: .leading, spacing: 35) {
                Text("Показывать варианты с пересадками")
                    .font(.system(size: 24, weight: .bold))
                    .multilineTextAlignment(.leading)
                ForEach(yesNoOptions, id: \.self) { option in
                    HStack {
                        Text(option)
                            .font(.system(size: 17))
                        Spacer()
                        if showTransfers != option {
                            Circle()
                                .stroke(.blackDay, lineWidth: 2)
                                .frame(width: 20, height: 20)
                        } else {
                            ZStack {
                                Circle()
                                    .stroke(.blackDay, lineWidth: 2)
                                    .frame(width: 20, height: 20)
                                Circle()
                                    .fill(.blackDay)
                                    .frame(width: 10, height: 10)
                            }
                        }
                    }
                    .onTapGesture {
                        toggleYesNo(option)
                    }
                }
            }
            .padding(.horizontal, 16)
            Spacer()
            Button("Применить", action: apply)
                .font(.system(size: 17, weight: .bold))
                .foregroundColor(.whiteUniversal)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.blueUniversal)
                .cornerRadius(16)
                .padding(.horizontal, 16)
        }
        .background(.whiteDay)
    }
    
    func apply() {
        path.removeLast()
    }
    
    private func toggleTime(_ option: String) {
        if selectedTimes.contains(option) {
            selectedTimes.remove(option)
        } else {
            selectedTimes.insert(option)
        }
    }
    
    private func toggleYesNo(_ option: String) {
        if showTransfers == option {
            showTransfers = nil
        } else {
            showTransfers = option
        }
    }
}

#Preview {
    FiltrationView(path: .constant([""]), selectedTimes: .constant([]), showTransfers: .constant(nil))
}

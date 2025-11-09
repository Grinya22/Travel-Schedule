import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Toggle("Темная тема", isOn: $isDarkMode)
                    .padding()
                NavigationLink {
                    UserAgreementView()
                } label: {
                    HStack {
                        Text("Пользовательское соглашение")
                            .foregroundStyle(.blackDay)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.blackDay)
                    }
                    .padding()
                }
                Spacer()
                Text("Приложение использует API «Яндекс.Расписания» \nВерсия 1.0 (beta)")
                    .font(.system(size: 12, weight: .regular))
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            .background(.whiteDay)
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

#Preview {
    SettingsView()
}

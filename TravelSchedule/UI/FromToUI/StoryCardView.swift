import SwiftUI

struct StoryCardView: View {
    let imageName: String
    @State private var isSelected = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 92, height: 140)
                .cornerRadius(16)
            
            VStack(alignment: .leading) {
                Text("Text Text")
                    .foregroundStyle(.whiteUniversal)
                Text("Text Text")
                    .foregroundStyle(.whiteUniversal)
                Text("Text Text")
                    .foregroundStyle(.whiteUniversal)
            }
            .font(.system(size: 12, weight: .regular))
            .padding(.leading, 8)
            .padding(.bottom, 12)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .strokeBorder(Color(.blueUniversal), lineWidth: (isSelected ? 0 : 4))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .fill(
                    colorScheme == .dark ?
                        .blackUniversal.opacity(isSelected ? 0.5 : 0) :
                        .whiteUniversal.opacity(isSelected ? 0.5 : 0)
                )
        )
        .onTapGesture {
            isSelected.toggle()
        }
    }
}

#Preview {
    StoryCardView(imageName: "1StoryCard")
}

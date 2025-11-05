import SwiftUI

struct StoryCardView: View {
    let imageName: String
    @State private var isSelected = false
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 92, height: 140)
                .cornerRadius(16)
                .opacity(isSelected ? 0.2 : 1)
                
            VStack(alignment: .leading) {
                Text("Text Text")
                Text("Text Text")
                Text("Text Text")
            }
            .font(.system(size: 12, weight: .regular))
            .foregroundColor(.whiteDay)
            .padding(.leading, 8)
            .padding(.bottom, 12)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .strokeBorder(Color(.blueUniversal), lineWidth: (isSelected ? 0 : 4))
        )
        .onTapGesture {
            isSelected.toggle()
        }
    }
}

#Preview {
    StoryCardView(imageName: "1StoryCard")
}

import SwiftUI

struct GenerateResultView: View {
    @Binding var imageData: Data
    @State private var showAlert = false

    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .ignoresSafeArea()
            Color.black.opacity(0.0001)
                .background(.thinMaterial)
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Generate Art for 3d render robot")
                        .font(.system(size: 30))
                        .bold()
                        .foregroundStyle(
                            LinearGradient(colors: [.yellow, .orange, .red, .purple, .blue], startPoint: .leading, endPoint: .trailing)
                        )
                    Image(uiImage: UIImage(data: imageData) ?? UIImage(systemName: "xmark")!)
                        .resizable()
                        .aspectRatio(1.0, contentMode: .fit)
                        .cornerRadius(12.0)
                    
                    HStack {
                        Button(action: {
                            if let image = UIImage(data: imageData) {
                                UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                                showAlert = true
                            }
                        }, label: {
                            Text("Kaydet")
                                .frame(maxWidth: .infinity)
                                .padding(.vertical)
                                .background(Color.orange)
                        })
                        .alert(isPresented: $showAlert) {
                            Alert(title: Text("Başarılı!"), message: Text("Resim başarıyla kaydedildi."))
                        }
                        Spacer(minLength: 16)
                        Button(action: {
                            shareImage()
                        }, label: {
                            Text("Paylaş")
                                .frame(maxWidth: .infinity)
                                .padding(.vertical)
                                .background(Color.orange)
                        })
                    }
                    
                    Button(action: { }, label: {
                        Text("Button")
                            .frame(maxWidth: .infinity)
                            .padding(.vertical)
                            .background(Color.orange)
                    })
                }
                .padding(.horizontal)
            }
        }
    }
    
    func shareImage() {
        guard let image = UIImage(data: imageData) else {
            return
        }
        
        let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activityViewController, animated: true, completion: nil)
    }
}

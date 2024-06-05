//
//  MainView.swift
//  VisionCraft
//
//  Created by Can on 11.03.2024.
//

import SwiftUI

struct MainView: View {
    @State private var prompt: String = ""
    let data = (1...20).map{ $0 }
    let style: StyleModel = .init(title: "NeonPunk", thumbImage: Image(.bg), prompt: "neonpunk style {prompt} . cyberpunk, vaporwave, neon, vibes, vibrant, stunningly beautiful, crisp, detailed, sleek, ultramodern, magenta highlights, dark purple shadows, high contrast, cinematic, ultra detailed, intricate, professional", negativePrompt: "painting, drawing, illustration, glitch, deformed, mutated, cross-eyed, ugly, disfigured")
    let gridLayout = [
        GridItem(.flexible(minimum: 100, maximum: 160)),
        GridItem(.flexible(minimum: 100, maximum: 160))
    ]
    @State var generated: Bool = false
    @State var imageData: Data = Data()
    @ObservedObject var styleData = StyleData()
    var body: some View {
        NavigationView(content: {
            ZStack {
                Image("bg")
                    .resizable()
                    .ignoresSafeArea()
                Color.black.opacity(0.0001)
                    .background(.thinMaterial)
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("Generate Art from your imagination with AI")
                            .font(.system(size: 30))
                            .bold()
                            .foregroundStyle(
                                LinearGradient(colors: [.yellow, .orange, .red, .purple, .blue], startPoint: .leading, endPoint: .trailing)
                            )
                        
                        Text("Enter Your Prompt")
                            .padding(.top, 16)
                        
                        TextEditor(text: $prompt)
                            .frame(height: 100)
                            .scrollContentBackground(.hidden)
                            .background(Color(uiColor: .tertiarySystemBackground).cornerRadius(12.0))
                        
                        Button(action: {
                            print("promot: \(prompt)")
                            StableDiffusionManager.shared.sendStableDiffusionRequest(req: .init(textPrompts: [.init(text: prompt)])) { data, _ in
                                self.imageData = Data(base64Encoded: data?.artifacts.first?.base64 ?? "", options: .ignoreUnknownCharacters)!
                                self.generated = true
                            }
//                            StableDiffusionManager.shared.generateImage(with: prompt) { data in
//                                
//                                print("foo data: \(data)")
//                                self.imageData = Data(base64Encoded: data?.first?.base64 ?? "", options: .ignoreUnknownCharacters)!
//                                self.generated = true
//                                
//                                print("foo data: \(data)")
//                            }
                        }, label: {
                            Text("Generate")
                                .bold()
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(Color("ButtonYellow"))
                                .foregroundColor(.black)
                                .cornerRadius(12.0)
                        })
                        .background(
                            NavigationLink(
                                destination: GenerateResultView(imageData: $imageData),
                                isActive: $generated,
                                label: {
                                    Text("")
                                })
                        )

                        
                        .padding(.top, 16)
                        
                        Text("Choose Your Art")
                            .padding(.top, 16)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHGrid(rows: gridLayout, content: {
                                ForEach(styleData.styleList.indices, id: \.self) { index in
                                    Button(action: {
                                        styleData.makeUnSelect()
                                        styleData.styleList[index].isSelected = true }, label: {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 12.0)
                                                .background(Color(uiColor: .secondarySystemBackground))
                                            VStack {
                                                styleData.styleList[index].thumbImage
                                                    .resizable()
                                                    .frame(width: 180, height: 120)
                                                    .cornerRadius(12.0)
                                                 HStack {
                                                    Text("\(styleData.styleList[index].title)")
                                                        .foregroundStyle(Color(uiColor: .label))
                                                    Spacer()
                                                    Image(systemName: styleData.styleList[index].isSelected ? "circle.fill" : "circle")
                                                        .foregroundStyle(Color(.buttonYellow))
                                                }
                                                .padding(.horizontal, 8)

                                            }
                                        }
                                        .frame(width: 200, height: 160)
                                        .foregroundColor(Color(uiColor: .secondarySystemBackground))
                                        .cornerRadius(12.0)
                                    })
                                }
                            })
                            .padding(.bottom, 16)
                        }
                        .cornerRadius(12)
                        .onAppear(perform: {
                            let prompt = style.prompt.replacingOccurrences(of: "{prompt}", with: "John Wick")
                        })
                    }
                    .padding(.horizontal, 16)
                }
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        })
    }
}

#Preview {
        MainView()
}

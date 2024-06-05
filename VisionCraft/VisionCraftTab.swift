//
//  TabView.swift
//  VisionCraft
//
//  Created by Can on 13.03.2024.
//

import SwiftUI

struct VisionCraftTab: View {
    @State var selectedTab = 0
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            MainView()
                .toolbarBackground(.hidden, for: .tabBar)
                .tag(0)

            GenerateResultView(imageData: .constant(Data()))
                .toolbarBackground(.hidden, for: .tabBar)
                .tag(1)
            
            ContentView()
                .toolbarBackground(.hidden, for: .tabBar)
                .tag(2)
        }
        .overlay(alignment: .bottom) {
                HStack {
                    ForEach((TabbedItems.allCases), id: \.self){ item in
                        Button{
                            withAnimation {
                                selectedTab = item.rawValue
                            }
                        } label: {
                            CustomTabItem(imageName: item.iconName, title: item.title, isActive: (selectedTab == item.rawValue))
                        }
                    }
                }
                .padding(8)
                .background(.ultraThinMaterial)
                .cornerRadius(12.0)
                .padding(.horizontal, 16)
                .padding(.bottom, 8)
        }
    }
}


extension VisionCraftTab{
    func CustomTabItem(imageName: String, title: String, isActive: Bool) -> some View{
        HStack(alignment: .center, spacing: 10){
            Image(systemName:isActive ? imageName + ".fill" : imageName)
                .resizable()
                .foregroundColor(isActive ? .black : .black)
                .frame(width: 20, height: 20)
            if isActive{
                Text(title)
                    .font(.system(size: 14))
                    .foregroundColor(isActive ? .black : .black)
            }
        }
        .frame(maxWidth: isActive ? .infinity : 60)
        .frame(height: 45)
        .background(isActive ? .buttonYellow : .clear)
        .cornerRadius(30)
        .padding(.horizontal)
    }
    
}

#Preview {
    VisionCraftTab()
}


/**
 
 StableDiffusionManager.shared.generateImage(with: prompt) { data, error in
     
     if let error = error {
         print(error.localizedDescription)
         return
       }
       
       guard let data = data else { return }
       print("Resim oluşturuldu!")
 }
 
 
 */

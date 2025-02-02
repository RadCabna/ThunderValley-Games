//
//  Inventory.swift
//  ThunderValley Games
//
//  Created by Алкександр Степанов on 02.02.2025.
//

import SwiftUI

struct Inventory: View {
    @EnvironmentObject var coordinator: Coordinator
    @AppStorage("coinCount") var coinCount = 0
    @AppStorage("selectedThunder") var selectedThunder = 1
    @State private var shopItemsArray = Arrays.shopItemsArray
    @State private var shopItemsData = UserDefaults.standard.array(forKey: "shopItemsData") as? [Int] ?? [2,0,0,0,0]
    var body: some View {
        ZStack {
            Background()
            HStack {
                Image("backButton")
                      .resizable()
                      .scaledToFit()
                      .frame(height: screenWidth*0.05)
                      .onTapGesture {
//                          coordinator.navigate(to: .mainMenu)
                          shopItemsData = [2,1,1,1,1]
                          saveItemData()
                      }
                Spacer()
                Image("coinCountFrame")
                      .resizable()
                      .scaledToFit()
                      .frame(height: screenWidth*0.05)
                      .overlay(
                      Text("\(coinCount)")
                          .font(Font.custom("Helvetica-bold", size: screenWidth*0.035))
                          .foregroundColor(.white)
                          .shadow(color: .black, radius: 1)
                          .shadow(color: .black, radius: 1)
                          .offset(x: screenWidth*0.022)
                      )
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding()
            Image("inventoryFrame")
                .resizable()
                .scaledToFit()
                .frame(width: screenWidth*0.84)
                .overlay(
                    HStack {
                        ForEach(0..<shopItemsArray.count, id: \.self) { item in
                        Image("shopItemFrame")
                                .resizable()
                                .scaledToFit()
                                .frame(width: screenWidth*0.15)
                                .overlay(
                                    VStack {
                                        Image(shopItemsArray[item].itemImage)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: screenWidth*0.04)
                                        Text(shopItemsArray[item].itemName)
                                            .font(Font.custom("Helvetica-bold", size: screenWidth*0.02))
                                            .foregroundColor(.white)
                                            .shadow(color: .black, radius: 1)
                                            .shadow(color: .black, radius: 1)
                                            .multilineTextAlignment(.center)
                                        if shopItemsData[item] == 2 {
                                            Image("selectedButton")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: screenWidth*0.12)
                                        }
                                        if shopItemsData[item] == 1 {
                                            Image("choseButton")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: screenWidth*0.12)
                                                .onTapGesture {
                                                    selectItem(item: item)
                                                }
                                        }
                                        if shopItemsData[item] == 0 {
                                            Image("buy50Button")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: screenWidth*0.12)
                                                .onTapGesture {
                                                    if coinCount >= 50 {
                                                        coinCount -= 50
                                                        shopItemsData[item] = 1
                                                        saveItemData()
                                                    }
                                                }
                                        }
                                    }
                                )
                        }
                        .offset(y:screenHeight*0.06)
                    }
                )
                .offset(y: screenWidth*0.02)
        }
    }
    
    func saveItemData() {
        UserDefaults.standard.setValue(shopItemsData, forKey: "shopItemsData")
    }
    
    func selectItem(item: Int) {
        for i in 0..<shopItemsData.count {
            if shopItemsData[i] == 2 {
                shopItemsData[i] = 1
            }
        }
        shopItemsData[item] = 2
        saveItemData()
//        selectedThunder = shopItemsData[shopItemsData.firstIndex(where: {$0 == 2}) ?? 0] + 1
        selectedThunder = item + 1
        print(selectedThunder)
    }
    
}

#Preview {
    Inventory()
}

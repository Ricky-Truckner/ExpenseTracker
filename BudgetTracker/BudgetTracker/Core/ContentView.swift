//
//  ContentView.swift
//  caloriesApp
//
//  Created by Danca Nguyen on 12/6/23.
//

import SwiftUI

struct TabBar: Identifiable {
  let id = UUID()
  let iconName: String
  let destinationView: AnyView
  let index: Int
}

enum TabIcon: String {
  case Home
  case Profile
  case Tracker
}

struct ContentView: View {
    @State private var selectedIndex = 0
    
    var body: some View {
        
        NavigationView {
                ZStack {
                    Image("background")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                    
                        Image("iconuser")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100,height: 100)
                            .padding(.vertical, 32)
                    
                    VStack {
                        Spacer()
                        HStack(spacing: 75) {
                            ForEach(tabItems.indices) { index in
                                NavigationLink(destination: tabItems[index].destinationView.navigationBarBackButtonHidden(false)) {
                                    Image(systemName: tabItems[index].iconName)
                                        .foregroundColor(.white)
                                        .opacity(selectedIndex == index ? 1 : 0.5)
                                }
                            }
                        }
                        .frame(width: 280, height: 60)
                        .background(.black, in: RoundedRectangle(cornerRadius: 10))
                        .overlay(alignment: .bottomLeading) {
                            Circle()
                                .frame(width: 8, height: 10)
                                .foregroundColor(.white)
                                .offset(x: 137, y: -5)
                                .offset(x: CGFloat(selectedIndex) * 70)
                        }
                    }
                    .onTapGesture {
                        withAnimation(.spring()) {
                            selectedIndex = (selectedIndex + 1) % tabItems.count
                        }
                    }
                }
              }
            }
        }

let tabItems: [TabBar] = [
  .init(iconName: "magnifyingglass", destinationView: AnyView(ExpenseView()), index: 0),
  .init(iconName: "house", destinationView: AnyView(ExpenseView()), index: 1),
  .init(iconName: "person", destinationView: AnyView(ExpenseView()), index: 2),
]

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()

  }
}

//
//  ContentViewTwo.swift
//  TextNavBar
//
//  Created by Thomas Cowern New on 1/20/21.
//

import SwiftUI

struct ContentViewTwo: View {
    var body: some View {
        NavigationView {
            GeometryReader { geo in
            ScrollView {
                
                LinearGradient(gradient: Gradient(colors: [.pink, .black]), startPoint: .top, endPoint: .bottom)
                VStack {
                    
                    
                Button(action: {
                    print("Height: ", geo.size.height)
                }, label: {
                    Text("Click Me")
                })

                }
                
                   
                
            }
            .frame(height: geo.size.height)
            .ignoresSafeArea()
            
            
                    .navigationBarColor(.black) // This is how you will use it
            .navigationBarItems(leading:
                            HStack {
                                Image(systemName: "arrow.backward")
                                Button("The story of my first customer") {
                                    print("About tapped!")
                                }
                            }
                                    .foregroundColor(.white)
                                    .font(.title3)
                        )
            }
        }
    }
}

struct NavigationBarModifier: ViewModifier {
        
    var backgroundColor: UIColor?
    
    init( backgroundColor: UIColor?) {
        self.backgroundColor = backgroundColor
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.backgroundColor = .clear
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        UINavigationBar.appearance().tintColor = .white

    }
    
    func body(content: Content) -> some View {
        ZStack{
            content
            VStack {
                GeometryReader { geometry in
                    Color(self.backgroundColor ?? .clear)
                        .frame(height: geometry.safeAreaInsets.top)
                        .edgesIgnoringSafeArea(.top)
                    Spacer()
                }
            }
        }
    }
}

struct ContentViewTwo_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewTwo()
    }
}

extension View {
    func navigationBarColor(_ backgroundColor: UIColor?) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor))
    }
}


//
//  ContentView.swift
//  TextNavBar
//
//  Created by Thomas Cowern New on 1/20/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
                   ScrollView {
                       Text("Don't use .appearance()!")
                   }
                   .navigationBarTitle("Try it!", displayMode: .inline)
                   .background(NavigationConfigurator { nc in
                       nc.navigationBar.barTintColor = .blue
                       nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
                   })
               }
           .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }

    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

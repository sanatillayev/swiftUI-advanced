//
//  UITestingView.swift
//  SwiftfulThinkingAdvanced
//
//  Created by Bilol Sanatillayev on 29/12/23.
//

import SwiftUI

class UITestingViewModel: ObservableObject {
    
    let placeholderText: String = "Add your name.."
    @Published var textFieldText: String = ""
    @Published var currentUserIsSignedIn: Bool
    
    init(currentUserIsSignedIn: Bool) {
        self.currentUserIsSignedIn = currentUserIsSignedIn
    }
    func signUpButtonPressed() {
        guard !textFieldText.isEmpty else { return }
        currentUserIsSignedIn = true
    }
}

struct UITestingView: View {
    
    @StateObject private var vm: UITestingViewModel
    
    init(currentUserIsSignedIn: Bool) {
        _vm = StateObject(wrappedValue: UITestingViewModel(currentUserIsSignedIn: currentUserIsSignedIn))
    }
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.green, Color.black]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
            .ignoresSafeArea()
            
            ZStack {
                if vm.currentUserIsSignedIn {
                    SignedInHomeView()
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .transition(.move(edge: .trailing))

                }
                
                if !vm.currentUserIsSignedIn {
                    signUpLayer
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .transition(.move(edge: .leading))
                }

            }
        }
    }
}

#Preview {
    UITestingView(currentUserIsSignedIn: false)
}

extension UITestingView {
    
    private var signUpLayer: some View {
        VStack {
            TextField(vm.placeholderText, text: $vm.textFieldText)
                .font(.headline)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.25),
                        radius: 10, x: 0.0, y: 10.0)
                .accessibilityIdentifier("SignUpTextField")

            Button(action: {
                withAnimation(.spring()) {
                    vm.signUpButtonPressed()
                }
            }, label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.25),
                            radius: 10, x: 0.0, y: 10.0)
                
            })
            .accessibilityIdentifier("SignUpButton")
        }
        .padding()
    }
}


struct SignedInHomeView: View {
    
    @State private var showAlert: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                Button(action: {
                    showAlert.toggle()
                }, label: {
                    Text("Show welcome alert!")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(10)
                })
                .accessibilityIdentifier("ShowAlertButton")
                .alert(isPresented: $showAlert, content: {
                    return Alert(title: Text("Welcome to the app!"))
                })
                
                NavigationLink {
                    Text("Destination")
                        .foregroundColor(.black)

                } label: {
                    Text("Navigate")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .accessibilityIdentifier("NavigationLinkToDestination")
                
            }
            .padding()
            .navigationTitle("Welcome")
        }
    }
}

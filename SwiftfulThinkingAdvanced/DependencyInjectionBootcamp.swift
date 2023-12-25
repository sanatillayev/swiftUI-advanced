//
//  DependencyInjectionBootcamp.swift
//  SwiftfulThinkingAdvanced
//
//  Created by Bilol Sanatillayev on 18/12/23.
//

import SwiftUI
import Combine

// PROBLEMS WITH SINGLETONS
// 1. Singleton's are GLOBAL
// 2. Can't customize the init!
// 3. Can't swap out dependencies

struct PostModel: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

protocol DataServiceProtocol {
    func getData() -> AnyPublisher<[PostModel], Error>
}

class ProductionDataService: DataServiceProtocol {
    
//    static let instance = ProductionDataService() // Singleton

    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    func getData() -> AnyPublisher<[PostModel], Error>{
        URLSession.shared.dataTaskPublisher(for: url)
            .map({ $0.data })
            .decode(type: [PostModel].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
/// for multiple dependecies
class Dependencies {
    var dataService: DataServiceProtocol
    
    init(dataService:DataServiceProtocol) {
        self.dataService = dataService
        // and so on ....
        /// we can use this class for multiple dependencies and we should inject it to our view
    }
}
// -----------------

class MockDataService: DataServiceProtocol {
    
    let testData: [PostModel]
    
    init (data: [PostModel]?) {
        self.testData = data ?? [
            PostModel(userId: 1, id: 1, title: "One", body: "One"),
            PostModel(userId: 2, id: 2, title: "Two", body: "Two")
        ]
    }

    
    func getData() -> AnyPublisher<[PostModel], Error> {
        Just(testData)
            .tryMap({ $0 })
            .eraseToAnyPublisher()
    }
    
}

class DependencyInjectionViewModel: ObservableObject {
    
    @Published var dataArray: [PostModel] = []
    var cancellables = Set<AnyCancellable>()
    var dataService: DataServiceProtocol
    
    init(dataService: DataServiceProtocol) {
        self.dataService = dataService
        loadPost()
    }
    
    private func loadPost() {
        dataService.getData()
            .sink { _ in
                
            } receiveValue: { [weak self] receivedPosts in
                self?.dataArray = receivedPosts
            }
            .store(in: &cancellables)

    }
}

struct DependencyInjectionBootcamp: View {
    @StateObject private var viewModel: DependencyInjectionViewModel
    
    init(dataService: DataServiceProtocol) {
        _viewModel = StateObject(wrappedValue: DependencyInjectionViewModel(dataService: dataService))
    }
    var body: some View {
        ScrollView {
            VStack {
                ForEach(viewModel.dataArray) { post in
                    Text(post.title)
                }
            }
        }
    }
}
let dataService = ProductionDataService(url: URL(string: "https://jsonplaceholder.typicode.com/posts")!)
let mockDataService = MockDataService(data: nil) // here is sample for swapping data service by using DI
#Preview {
    
    
    DependencyInjectionBootcamp(dataService: mockDataService)
}

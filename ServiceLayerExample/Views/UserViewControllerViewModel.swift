//
//  UserViewControllerViewModel.swift
//  ServiceLayerExample
//
//  Created by zxz  on 3/22/24.
//

import Combine
import Foundation

final class UserViewControllerViewModel: ObservableObject {
    
    // 通过 @Published 属性包装器创建可观察属性
    @Published var users: [User] = []

    // 1 - used to access the `fetchUsers` method
    private let service: JsonPlaceholderServiceProtocol

    // 2 - pass in an instance of `JsonPlaceholderServiceProtocol`.
    // This will be used to pass in a mock during testing.
    init(service: JsonPlaceholderServiceProtocol = JsonPlaceholderService()) {
        self.service = service

        retrieveUsers()
    }

    // 3 - fetches users from the service.
    private func retrieveUsers() {
        service.fetchUsers { [weak self] result in
            switch result {
            case .success(let users):
                self?.users = users.sorted(by: { $0.name < $1.name })
            case .failure(let error):
                print("Error retrieving users: \(error.localizedDescription)")
            }
        }
    }
}

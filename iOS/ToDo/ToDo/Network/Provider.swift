//
//  Provider.swift
//  ToDo
//
//  Created by Cloud on 2020/04/14.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

struct Provider {
    
    private static let provider = URLSession(configuration: .default)
    private static let decoder: TodoCodable = TodoCodable<TodoProject>()
    private static let encoder: TodoCodable = TodoCodable<Contents>()
    
    static func request(completion: @escaping (TodoProject?) -> Void) {
        DispatchQueue.main.async {
            provider.dataTask(with: Service.baseURLRequest) { data, _, _ in
                guard let data = data else { return }
                completion(decoder.decode(TodoProject.self, data: data))
            }.resume()
        }
    }
    
    static func delete(categoryId: Int, cardId: Int) {
        provider.dataTask(with: Service.deleteURLRequset(categoryId, cardId))
            .resume()
    }
    
    static func post(categoryId: Int, contents: Contents) {
        provider.dataTask(with: Service.addURLRequest(categoryId,
                                                      data: encoder.encode(data: contents)!))
            .resume()
    }
}

struct TodoCodable<T: Codable> {
    
    private let decoder: JSONDecoder = JSONDecoder()
    private let encoder: JSONEncoder = JSONEncoder()
    
    func decode(_ type: T.Type ,data: Data) -> T? {
        do {
            return try decoder.decode(type, from: data)
        } catch {
            print("Decode fail")
            return nil
        }
    }
    
    func encode(data: T) -> Data? {
        do {
            return try encoder.encode(data)
        } catch {
            print("Encode fail")
            return nil
        }
    }
}

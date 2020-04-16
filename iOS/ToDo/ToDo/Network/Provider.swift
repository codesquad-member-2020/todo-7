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
    private static let decoder: TodoDecoder = TodoDecoder<TodoProject>()
    
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
}

struct TodoDecoder<T: Decodable> {
    
    let decoder: JSONDecoder = JSONDecoder()
    
    func decode(_ type: T.Type ,data: Data) -> T? {
        do {
            return try decoder.decode(type, from: data)
        } catch {
            print("Decode fail")
            return nil
        }
    }
}

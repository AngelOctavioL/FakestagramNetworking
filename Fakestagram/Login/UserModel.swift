//
//  This file is for educational purposes only. It may contain code snippets, examples, images, and explanations
//  intended to help understand concepts and improve programming skills.
//

import Foundation

enum UserModelError: Error, LocalizedError {
    case userNotFound
    case fileError
    case parseError
    
    var errorDescription: String? {
        switch self {
        case .userNotFound: "User not found"
        case .fileError: "File not found"
        case .parseError: "Not able to deserialize users"
        }
    }
}


class UserModel {
    var user: User? {
        didSet {
            Settings.user = user
        }
    }
}

extension UserModel {
    func saveUser(from dto: UserDTO) {
        guard let id = dto.id, let name = dto.name, let email = dto.email, let username = dto.username else { return }
        
        user = User(id: id, name: name, username: username, email: email)
    }
    
    func findUser_byDictionary(by email: String) throws {
        let url = Bundle.main.url(forResource: "Users", withExtension: "json")!
        
        // buscando la url para pedir los datos
        guard let data = try? Data(contentsOf: url) else {
            throw UserModelError.fileError
        }
        
        // convirtiendo de un elemento DATA a una arreglo de diccionarios para este caso
        // pero enrealidad es para el tipo de dato que necesitamos
        guard let usersFromFile = try? JSONSerialization.jsonObject(with: data) as? [[String: Any]] else {
            throw UserModelError.parseError
        }
        
        let userDTO = usersFromFile.first { user in
            let userEmail = user["email"] as? String
            return userEmail == email
        }
        
        // asignandole los datos a la estructura
        guard let userDTO,
              let id = userDTO["id"] as? Int,
              let name = userDTO["name"] as? String,
              let userName = userDTO["username"] as? String else {
            throw UserModelError.userNotFound
        }
        user = User(id: id, name: name, username: userName, email: email)
    }
    
    func findUser(by email: String) throws {
        guard let url = Bundle.main.url(forResource: "Users", withExtension: "json"),
              let data = try? Data(contentsOf: url) else { throw UserModelError.fileError }
        //let usersDTOs = try JSONDecoder().decode([UserDTO].self, from: data)
        
        let usersDTOs = try [UserDTO](data: data)
        guard let userDTO = usersDTOs.first(where: { email == $0.email }) else { throw UserModelError.userNotFound }
        saveUser(from: userDTO)
    }
}


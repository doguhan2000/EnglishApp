import Foundation

extension UserDefaults {
    private enum UserDefaultsKeys: String {
        case savedUsers
    }

    func saveUser(_ user: User) {
        var users = getUsers()
        users.append(user)
        if let encoded = try? JSONEncoder().encode(users) {
            self.set(encoded, forKey: UserDefaultsKeys.savedUsers.rawValue)
        }
    }

    func getUsers() -> [User] {
        if let savedUsersData = self.data(forKey: UserDefaultsKeys.savedUsers.rawValue),
           let savedUsers = try? JSONDecoder().decode([User].self, from: savedUsersData) {
            return savedUsers
        }
        return []
    }
}


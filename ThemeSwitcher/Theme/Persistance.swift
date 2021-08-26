import Foundation


    //MARK: - UserDefaults
        //MARK: You can use any database to store the theme state (CoreData, Realm, etc.)

@propertyWrapper
struct Persistance<T> {
    let key: String
    let defaultValue: T
    var container: UserDefaults = .standard
    
    var wrappedValue: T {
        get { container.object(forKey: key) as? T ?? defaultValue }
        set { container.set(newValue, forKey: key) }
    }
    
    init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
}

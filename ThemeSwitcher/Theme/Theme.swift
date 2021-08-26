import UIKit


    //MARK: - Theme's Enum

enum Theme: Int {
    case system = 0
    case light
    case dark
}


    //MARK: - Theme's extension

extension Theme {
    
        //MARK: UserDefault property wrappers
    @Persistance(key: "theme", defaultValue: Theme.system.rawValue)
    private static var appTheme: Int
    
    
        //MARK: Saving a theme in UserDefaults
    func save() {
        Theme.appTheme = self.rawValue
    }
    
    
        //MARK: Current theme
    static var current: Theme {
        Theme(rawValue: appTheme) ?? .light
    }
    
    
        //MARK: Setting UserInterfaceStyle
    var userInterfaceStyle: UIUserInterfaceStyle {
          switch self {
          case .light:
            return .light
          case .dark:
            return .dark
          case .system:
            return .unspecified
          }
    }
    
    
        //MARK: Setting the active theme for all application windows
    func setTheme() {
        save()
        UIApplication.shared.windows.forEach { $0.overrideUserInterfaceStyle = userInterfaceStyle }
    }
}


        //MARK: - Setting the current theme for the window.

extension UIWindow {
    func initTheme() {
        overrideUserInterfaceStyle = Theme.current.userInterfaceStyle
    }
}

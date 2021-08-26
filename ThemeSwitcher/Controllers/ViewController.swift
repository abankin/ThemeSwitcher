import UIKit

class ViewController: UIViewController {
    
    //MARK: - Segment Control outlet abd action
    
    @IBOutlet weak var themesSegmentControl: UISegmentedControl!
    @IBAction func themesSegmentControl(_ sender: UISegmentedControl) {
        
        //MARK: Switching the theme and saving the state to the database (User Defaults)
        
        switch sender.selectedSegmentIndex {
        case 0:
            Theme.system.setTheme()
        case 1:
            Theme.light.setTheme()
        case 2:
            Theme.dark.setTheme()
        default:
            Theme.system.setTheme()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: (for initial ViewController)
        //MARK: Loading the theme state from the database and applying it to the interface
        
        switch Theme.current {
        case .system:
            Theme.system.setTheme()
        case .light:
            Theme.light.setTheme()
        case .dark:
            Theme.dark.setTheme()
        }
        
        //MARK: Loading the theme status from the database and setting the SegmentControl to the current position
        
        switch Theme.current {
        case .system:
            themesSegmentControl.selectedSegmentIndex = 0
        case .light:
            themesSegmentControl.selectedSegmentIndex = 1
        case .dark:
            themesSegmentControl.selectedSegmentIndex = 2
        }
    }
}

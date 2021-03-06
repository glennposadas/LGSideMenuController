//
//  ChooseTableViewController.swift
//  LGSideMenuControllerDemo
//

class ChooseTableViewController: UITableViewController {
    
    private let titlesArray = ["Style \"Scale From Big\"",
                               "Style \"Slide Above\"",
                               "Style \"Slide Below\"",
                               "Style \"Scale From Little\"",
                               "Blurred root view cover",
                               "Blurred covers of side views",
                               "Blurred backgrounds side views",
                               "Landscape is always visible",
                               "Status bar is always visible",
                               "Gesture area is full screen",
                               "Concurrent touch actions",
                               "Custom style example"]
    
    init() {
        super.init(style: .plain)
        
        self.title = "LGSideMenuController"
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titlesArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.accessoryType = .disclosureIndicator
        cell.textLabel!.font = UIFont.systemFont(ofSize: 16.0)
        cell.textLabel!.text = titlesArray[indexPath.row]
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController: RootViewController
        if (indexPath.row == self.titlesArray.count - 2) {
            viewController = RootViewController(withTableView: true)
        }
        else {
            viewController = RootViewController()
        }
        
        let navigationController = RootNavigationController(rootViewController: viewController)
        
        let mainViewController = MainViewController()
        mainViewController.rootViewController = navigationController
        mainViewController.setup(type: DemoType(rawValue: indexPath.row)!)
        
        let window = UIApplication.shared.delegate!.window!!
        window.rootViewController = mainViewController
        UIView.transition(with: window, duration: 0.3, options: [.transitionCrossDissolve], animations: nil, completion: nil)
    }
    
}

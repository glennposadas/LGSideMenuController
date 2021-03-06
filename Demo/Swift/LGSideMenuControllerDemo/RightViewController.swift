//
//  RightViewController.swift
//  LGSideMenuControllerDemo
//

class RightViewController: UITableViewController {

    private let titlesArray = ["Open Left View",
                               "",
                               "1",
                               "2",
                               "3",
                               "4",
                               "5",
                               "6",
                               "7",
                               "8",
                               "9",
                               "10"]

    init() {
        super.init(style: .plain)

        self.view.backgroundColor = .clear

        self.tableView.register(RightViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.separatorStyle = .none
        self.tableView.contentInset = UIEdgeInsets(top: 44.0, left: 0.0, bottom: 44.0, right: 0.0)
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.backgroundColor = .clear
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }

    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }

    // MARK: - UITableViewDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titlesArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RightViewCell

        cell.textLabel!.text = titlesArray[indexPath.row]
        cell.textLabel!.font = UIFont.boldSystemFont(ofSize: indexPath.row == 0 ? 15.0 : 30.0)
        cell.separatorView.isHidden = (indexPath.row <= 1 || indexPath.row == titlesArray.count - 1)
        cell.isUserInteractionEnabled = (indexPath.row != 1)

        return cell
    }

    // MARK: - UITableViewDelegate

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 1 ? 50.0 : 100.0
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let sideMenuController = self.sideMenuController else { return }

        if indexPath.row == 0 {
            if sideMenuController.isRightViewAlwaysVisibleForCurrentOrientation {
                sideMenuController.showLeftView(animated: true, completionHandler: nil)
            }
            else {
                sideMenuController.hideRightView(animated: true, completionHandler: {
                    sideMenuController.showLeftView(animated: true, completionHandler: nil)
                })
            }
        }
        else {
            let viewController = UIViewController()
            viewController.view.backgroundColor = (isLightTheme() ? .white : .black)
            viewController.title = "Test \(titlesArray[indexPath.row])"

            if let navigationController = sideMenuController.rootViewController as? RootNavigationController {
                navigationController.pushViewController(viewController, animated: true)
            }

            sideMenuController.hideRightView(animated: true, completionHandler: nil)
        }
    }

    // MARK: - Logging

    deinit {
        struct Counter { static var count = 0 }
        Counter.count += 1
        print("RightViewController.deinit(), counter: \(Counter.count)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        struct Counter { static var count = 0 }
        Counter.count += 1
        print("RightViewController.viewDidLoad(), counter: \(Counter.count)")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        struct Counter { static var count = 0 }
        Counter.count += 1
        print("RightViewController.viewWillAppear(\(animated)), counter: \(Counter.count)")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        struct Counter { static var count = 0 }
        Counter.count += 1
        print("RightViewController.viewDidAppear(\(animated)), counter: \(Counter.count)")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        struct Counter { static var count = 0 }
        Counter.count += 1
        print("RightViewController.viewWillDisappear(\(animated)), counter: \(Counter.count)")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        struct Counter { static var count = 0 }
        Counter.count += 1
        print("RightViewController.viewDidDisappear(\(animated)), counter: \(Counter.count)")
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        struct Counter { static var count = 0 }
        Counter.count += 1
        print("RightViewController.viewWillLayoutSubviews(), counter: \(Counter.count)")
    }

}

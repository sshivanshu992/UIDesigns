//
//  DashboardForFinancial.swift
//  UIDesigns
//
//  Created by Shivanshu Verma on 02/11/24.
//

import UIKit

class DashboardForFinancial: UIViewController {

    @IBOutlet private weak var transactionsContainerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet private weak var buttionsContainerView: UIViewCornerRadius!
    
    /// Variable to store the last content offset
    var lastContentOffset: CGFloat = 0
    let threshold: CGFloat = 10.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialConifiguration()
        // navagiation()
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        transactionsContainerView.roundCorners(corners: [.topLeft, .topRight], radius: 35)
    }
    
    private func initialConifiguration() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        tableView.register(FinancialCell.self, forCellReuseIdentifier: String(describing: FinancialCell.self))
    }
    
    private func navagiation() {
        guard let customView = Bundle.main.loadNibNamed(String(describing: CustomNavigationView.self), owner: nil, options: nil)?.first as? CustomNavigationView else {
            return
        }
        customView.configureValue(name: "Hey, Dean", image: UIImage(systemName: "person.circle"))
        let barButtonItem = UIBarButtonItem(customView: customView)
        navigationItem.leftBarButtonItem = barButtonItem
        //navigationItem.rightBarButtonItem = UIBarButtonItem(customView: notificationButton)
    }
}

extension DashboardForFinancial: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FinancialCell.self), for: indexPath) as? FinancialCell else {
            return UITableViewCell()
        }
        let object = transactions[indexPath.row]
        
        cell.configure(image: object.profileImage, name: object.name, type: object.category, amount: String(object.amount), date: object.time ?? object.date)
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentOffset = scrollView.contentOffset.y
        
        /// Calculate the difference
        let difference = currentOffset - lastContentOffset
        
        /// hide when scrolling down, show when scrolling up
        if difference > threshold {
            /// Scrolling down, hide the view
            buttionsContainerView.isHidden = true
        } else if difference < -threshold {
            /// Scrolling up, show the view
            buttionsContainerView.isHidden = false
        }
        /// Update last content offset
        lastContentOffset = currentOffset
    }
}


extension DashboardForFinancial {
    /// Sample transactions
    var transactions: [Transaction] {
        
        return [
            Transaction(profileImage: UIImage(named: "cwancu") ?? UIImage(), name: "Adam West ", category: "Received ", amount: 200.0, date: "Oct 25", time: "3:25 PM"),
            Transaction(profileImage: UIImage(named: "cwancu") ?? UIImage(), name: "Spotify", category: "Subscription", amount: -4.99, date: "Dec 19", time: nil),
            Transaction(profileImage: UIImage(named: "cwancu") ?? UIImage(), name: "Jenny Adam", category: "Transfer", amount: 50.0, date: "Dec 17", time: nil),
            Transaction(profileImage: UIImage(named: "cwancu") ?? UIImage(), name: "Levi's", category: "Shopping", amount: -520.0, date: "Dec 15", time: nil),
            Transaction(profileImage: UIImage(named: "cwancu") ?? UIImage(), name: "Adam West", category: "Received ", amount: 200.0, date: "Oct 25", time: "3:25PM"),
            Transaction(profileImage: UIImage(named: "cwancu") ?? UIImage(), name: "Spotify", category: "Subscription", amount: -4.99, date: "Dec 19", time: nil),
            Transaction(profileImage: UIImage(named: "cwancu") ?? UIImage(), name: "Jenny Wilson", category: "Transfer", amount: 50.0, date: "Dec 17", time: nil),
            Transaction(profileImage: UIImage(named: "cwancu") ?? UIImage(), name: "Levi's", category: "Shopping", amount: -520.0, date: "Dec 15", time: nil)
        ]
    }
}

/// Model for each transaction in the history list
struct Transaction {
    let profileImage: UIImage
    let name: String
    let category: String
    let amount: Double
    let date: String
    let time: String?
}

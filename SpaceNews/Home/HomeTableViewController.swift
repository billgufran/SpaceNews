//
//  HomeTableViewController.swift
//  SpaceNews
//
//  Created by Muhammad Fikri Bill Gufran on 7/5/23.
//

import UIKit
import SDWebImage

class HomeTableViewController: UITableViewController {
    var newsList: [News] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let refreshControl = UIRefreshControl()
        
        self.refreshControl = refreshControl
        
        tableView.dataSource = self
        tableView.delegate = self
        
        loadNews()
        tableView.reloadData()
        
        refreshControl.addTarget(
            self,
            action: #selector(self.refresh(_:)),
            for: .valueChanged
        )
        refreshControl.beginRefreshing()
    }
    
    @objc func refresh(_ sender: Any) {
        loadNews()
        tableView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()

            let yPadding: CGFloat = 10
            tableView.contentInset = UIEdgeInsets(
                top: yPadding,
                left: 0,
                bottom: yPadding,
                right: 0
            )
        }
    
    func loadNews() {
        ApiService.shared.loadNews { [weak self] result in
            guard let `self` = self else { return }
            
            self.refreshControl?.endRefreshing()
            
            switch result {
            case .success(let newsList):
                self.newsList = newsList
                self.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return newsList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "news_cell", for: indexPath) as! NewsTableViewCell
        
        let news = newsList[indexPath.row]
        
        cell.titleLabel.text = news.title
        cell.summaryLabel.text = news.summary
        cell.thumbnailImage.sd_setImage(with: URL(string: news.imageUrl))
        
        // the delegate handle visitButton tapped
        cell.delegate = self
        
        return cell
    }
}

// MARK: - NewsTableViewCellDelegate
extension HomeTableViewController: NewsTableViewCellDelegate {
    func visitButtonTapped(_ cell: UITableViewCell) {
        if let indexPath = tableView.indexPath(for: cell) {
            let news = newsList[indexPath.row]
            
            if let url = URL(string: news.url) {
                UIApplication.shared.open(url)
            }
        }
    }
}

//
//  ItemsTableViewController.swift
//  UITestWorkshops
//
//  Copyright © 2017 Netguru. All rights reserved.
//

import UIKit
import RealmSwift

final internal class ItemsTableViewController: UITableViewController {

    fileprivate let itemsProvider = ItemsProvider()
    fileprivate let userProvider = UserProvider()
    fileprivate var currentUser: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        currentUser = try? userProvider.current()
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let items = currentUser?.items else { return 0 }
        if items.count > 0 {
            tableView.separatorColor = UIColor.gray.withAlphaComponent(0.75)
        } else {
            tableView.separatorColor = .clear
        }
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(ItemCell.self)

        if let item = currentUser?.items[indexPath.row] {
            cell.nameLabel.text = item.name
            cell.testableAccessibilityLabel(item.name)
        }
        
        return cell
    }
 
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ItemCell.defaultHeight
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        
        if let user = currentUser,
            let item = currentUser?.items[indexPath.row]{
           try? itemsProvider.remove(item, for: user)
        }
        tableView.deleteRows(at: [indexPath], with: .left)
    }

}

private extension ItemsTableViewController {
    
    func setupTableView() {
        navigationItem.leftBarButtonItem = editButtonItem
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewItem))
        tableView.register(ItemCell.self, forCellReuseIdentifier: ItemCell.identifier)
        tableView.allowsSelection = false
        
        navigationItem.leftBarButtonItem?.testableAccessibilityLabel("button.edit")
        navigationItem.rightBarButtonItem?.testableAccessibilityLabel("button.add")
        tableView.testableAccessibilityLabel("itemsList")
        
        navigationController?.navigationBar.testableAccessibilityLabel("navigationBar")
        
    }
    
    dynamic func addNewItem() {
        let controller = UIAlertController(title: .localized(key: "List.newItem.title"), message: .localized(key: "List.newItem.message"), preferredStyle: .alert)
        controller.addTextField { (field) in
            field.testableAccessibilityLabel("textField.name")
        }
        
        let addAction = UIAlertAction(title: .localized(key: "Add"), style: .default, handler: { action in
            guard let field = controller.textFields?.first,
                  let name = field.text,
                  name.characters.count > 0 else {
                    self.showError(message: .localized(key:"List.newItem.error.message"))
                return
            }
            
            let item = Item()
            item.name = name
            
            if let user = self.currentUser {
                try? self.itemsProvider.add(item, for: user)
            }
            self.tableView.reloadData()
        })
        
        let cancelAction = UIAlertAction(title: .localized(key: "Cancel"), style: .destructive, handler: nil)
        
        controller.addAction(addAction)
        controller.addAction(cancelAction)
        
        present(controller, animated: true, completion: nil)
    }
    
    func showError(message: String) {
        let controller = UIAlertController(title: .localized(key: "Error"), message: message, preferredStyle: .alert)
        controller.addAction(UIAlertAction(title: "Ok", style: .default))
        present(controller, animated: true)
    }
}

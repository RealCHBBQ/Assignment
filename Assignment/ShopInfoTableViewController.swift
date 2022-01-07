//
//  ShopInfoTableViewController.swift
//  Assignment
//
//  Created by RealCH on 7/1/2022.
//

import UIKit

class ShopInfoTableViewController: UITableViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var telTextField: UITextField!
    @IBAction func sendBtnClicked(_ sender: UIButton) {
        let name = nameTextField.text!;
        let tel = telTextField.text!;
        
        let urlStr = "http://www.invivo.me/reg/demo/index_json2.php"
        if let url = URL(string: urlStr) {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "POST"
            let body = "name=\(name)&telephone=\(tel)"
            if let data  = body.data(using: .utf8) {
                let dataTask = URLSession.shared.uploadTask(with: urlRequest,
                                                            from: data, completionHandler: {
                    data, response, error in
                    if let error = error{
                        print("error: \(error.localizedDescription)")
                    }
                    self.refreshBtnClicked(self)
                })
                dataTask.resume()
            }
        }
    }
    
    @IBAction func refreshBtnClicked(_ sender: Any) {
        let urlStr = "http://www.invivo.me/reg/demo/index_json2.php"
        if let url = URL(string: urlStr) {
            let urlRequest = URLRequest(url: url)
            let dataTask = URLSession.shared.dataTask(with: urlRequest, completionHandler: {
                data, response, error in
                if let data = data {
                    self.contacts.removeAll()
                    
                    let decoder = JSONDecoder()
                    guard let contacts = try? decoder.decode([SimpleContact].self, from: data) else
                    {   return  }
                    self.contacts = contacts
                    DispatchQueue.main.async{
                        self.tableView.reloadData()
                    }
                }
            })
            dataTask.resume()
        }
    }
    
    var contacts = [SimpleContact]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1 }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
    UITableViewCell {let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        let simpleContact = self.contacts[indexPath.row]
        cell.textLabel?.text = simpleContact.name
        cell.detailTextLabel?.text = simpleContact.tel
        return cell
    }
    
}

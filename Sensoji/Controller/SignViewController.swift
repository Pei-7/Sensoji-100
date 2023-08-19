//
//  SignViewController.swift
//  Sensoji
//
//  Created by 陳佩琪 on 2023/8/19.
//

import UIKit

class SignViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var signs = [Sign]()
    var index = 0
    
    @IBOutlet var startButton: UIButton!
    
    @IBOutlet var upperPattern: UIImageView!
    
    @IBOutlet var lowerPattern: UIImageView!
    
    @IBOutlet var coverView: UIView!
    
    
    @IBOutlet var signNum: UILabel!
    
    @IBOutlet var signType: UILabel!
    
    @IBOutlet var signPoem: UITextView!
    
    @IBOutlet var tableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ExplainTableViewCell", for: indexPath) as! ExplainTableViewCell
            if signs.isEmpty == false {
                cell.explainTextView.text = signs[index].explain
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as! DetailTableViewCell
            if signs.isEmpty == false {
                
                let keyArray = Array(signs[index].result.keys)
                print(indexPath.row)
                cell.detailKeyLabel.text = keyArray[indexPath.row-1]
                
                let valueArray = Array(signs[index].result.values)
                cell.detailValueLabel.text = valueArray[indexPath.row-1]
            }
            
            return cell
        }
    }
    
    
    

    fileprivate func updateUI() {
        let urlString = "https://gist.githubusercontent.com/mmis1000/d94bb0a9f37cfd362453/raw/0e3a7b06688fd7950a8d5f1ae858b27be2be7e09/%25E6%25B7%25BA%25E8%258D%2589%25E7%25B1%25A4.json"
        URLSession.shared.dataTask(with: URL(string: urlString)!) { data, response, error in
            if let data {
                let decoder = JSONDecoder()
                do {
                    let signs = try decoder.decode([Sign].self, from: data)
                    self.signs = signs
                    
                    let index = Int.random(in: 0..<signs.count)
                    self.index = index
                    DispatchQueue.main.async {
                        self.signNum.text = "第 \(signs[index].id) 籤"
                        self.signType.text = signs[index].type
                        self.signPoem.text = signs[index].poem + "。"
                        self.tableView.reloadData()
                        
                        
                    }
                } catch {
                    print(error)
                }
            } else {
                print(error ?? "URLSession error")
            }
        }.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        
        updateUI()

    }
    

    @IBAction func start(_ sender: UIButton) {
        
        UIView.animate(withDuration: 2, delay: 0) {
            self.upperPattern.transform = CGAffineTransform(translationX: 390, y: 0)
            self.lowerPattern.transform = CGAffineTransform(translationX: -390, y: 0)
            self.coverView.alpha = 0
        }

    }
    
    
    @IBAction func reset(_ sender: Any) {
        coverView.alpha = 1
        upperPattern.transform = CGAffineTransform(translationX: 0, y: 0)
        lowerPattern.transform = CGAffineTransform(translationX: 0, y: 0)
        
        updateUI()
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

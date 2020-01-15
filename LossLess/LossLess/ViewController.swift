import UIKit
import YSCheckBox

class ViewController: UIViewController, YSCheckBoxViewControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var container: UIView!
    
    fileprivate var articles: [[String: Any]] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let checkBox = YSCheckBoxViewController(labels: ["Orange","GrapeFruits","Banana"])
        
        checkBox.delegate = self
        checkBox.font = UIFont.systemFont(ofSize: 18)
        checkBox.labelColor = UIColor(red: 0, green: 122 / 255, blue: 1, alpha: 1)
        checkBox.labelMargin = 0
        checkBox.lineWidth = 1
        checkBox.checkBoxSelectedFillSize = 1
        checkBox.checkBoxMargin = 6
        checkBox.checkBoxCorner = 7
        checkBox.checkBoxStroke = .lightGray
        checkBox.checkBoxCheckStroke = .white
        checkBox.checkBoxSelectedFill = UIColor(red: 0, green: 122 / 255, blue: 1, alpha: 1)
        checkBox.checkBoxBGFill = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)

        addChild(checkBox)
        checkBox.view.frame = container.bounds
        container.addSubview(checkBox.view)
        checkBox.didMove(toParent: self)
        
        fetchArticles()
        initTableView()
    }
    
    func didYSCeckBoxSelect(checks: [Bool]) {
        print(checks)
    }
    
    private func fetchArticles() {
        super.viewDidLoad()
        
        let url: URL = URL(string: "http://qiita.com/api/v2/items")!
        let task: URLSessionTask = URLSession.shared.dataTask(with: url, completionHandler: {data, response, error in
            
            do {
                guard let data = data else {return}
                guard let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? [Any] else {return}
                let articles = json.compactMap { (article) -> [String: Any]? in
                    return article as? [String: Any]
                }
                
                DispatchQueue.main.async() { () -> Void in
                    self.articles = articles
                }
            }
            catch {
                print(error)
            }
        })
        task.resume() //実行する
    }
    
    private func initTableView() {
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
}

extension ViewController: UITableViewDataSource {
    
    // セクションの個数を返す
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // セクションごとにセルの個数を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    // セルの中身を返す
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        if indexPath.row < articles.count / 2 - 1 {
            let article1 = articles[2 * indexPath.row]
            let article2 = articles[2 * indexPath.row + 1]
            let title1 = article1["title"] as? String ?? ""
            let title2 = article2["title"] as? String ?? ""
            cell.bindData(text1: "\(title1)", text2: "\(title2)")
            return cell
        }
        else {
            return cell
        }
    }
    
    // セルの高さを返す
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}

extension ViewController: UITableViewDelegate {
    
    // セルがタップされたときの処理を書く
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("section: \(indexPath.section) index: \(indexPath.row)")
    }
    
    // スクロールしたときの処理を書く
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        return
    }
}

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var articles: [[String: Any]] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    @IBAction func button(_ sender: Any) {
        performSegue(withIdentifier: "ModalSegue", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchArticles()
        initTableView()
    }
    
    
    private func fetchArticles() {
        super.viewDidLoad()
        
        let url: URL = URL(string: "")!
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
        tableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductTableViewCell")
    }
}

extension ProductViewController: UITableViewDataSource {
    
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
        let cell:ProductTableViewCell = tableView.dequeueReusableCell(withIdentifier:
            "ProductTableViewCell") as! ProductTableViewCell
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
        return 190
    }
}

extension ProductViewController: UITableViewDelegate {
    
    // セルがタップされたときの処理を書く
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("section: \(indexPath.section) index: \(indexPath.row)")
    }
    
    // スクロールしたときの処理を書く
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        return
    }
    
    func checkboxmethod() {
        
    }
}

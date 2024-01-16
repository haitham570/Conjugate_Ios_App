import UIKit

class HomePageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var txtConjugate: UITextField!
    
    var fetchedVerbs: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    func initialize() {
        FrenchVerbProvider.generateMockData()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedVerbs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
//
//        let verb = FrenchVerbProvider.all[indexPath.row]
//        cell.textLabel?.text = verb
        
//        return cell
        
        let verb = fetchedVerbs[indexPath.row]
        cell.textLabel?.text = verb
        cell.textLabel?.numberOfLines = 0

        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segue.toLibraryViewController {
            let libraryViewController = segue.destination as! LibraryViewController
        }
    }
    
//    @IBAction func btnConjugateTouchUpInside(_ sender: Any) {
//        FrenchVerbAPI.getVerb(verb: "habiter") { verb in
//            self.fetchedVerbs.append(verb.indicatif!.passeCompose!.heSheIt!)
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//
//        } failHandler: { httpStatusCode, errorMessage in
//            print(errorMessage)
//        }
//
//    }
    
    @IBAction func btnConjugateTouchUpInside(_ sender: Any) {
        
        let userEnteredVerb = txtConjugate.text!
        
        FrenchVerbAPI.getVerb(verb: userEnteredVerb) { verb in
            
            if let passeCompose = verb.indicatif?.passeCompose {
                        let lines = [
                            passeCompose.heSheIt ?? "",
                            passeCompose.i ?? "",
                            passeCompose.they ?? "",
                            passeCompose.we ?? "",
                            passeCompose.you ?? "",
                            passeCompose.youAll ?? ""
                        ]
                
                self.fetchedVerbs.removeAll()
                for line in lines {
                    self.fetchedVerbs.append(line)
                }

                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        } failHandler: { httpStatusCode, errorMessage in
            print(errorMessage)
        }
    }
}

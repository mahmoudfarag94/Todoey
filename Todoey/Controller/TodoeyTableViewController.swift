import UIKit

class TodoeyTableViewController: UITableViewController {
    
    var arr = ["malek","baraa","mahmoud","farag"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    //MARK:- declear tableView Functions here :
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoItemCell", for: indexPath)
        cell.textLabel?.text = arr[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
            tableView.cellForRow(at: indexPath )?.accessoryType = .checkmark
        }
    }
    
    @IBAction func AddButtonPressed(_ sender: UIBarButtonItem) {
        var txtFild = UITextField()
        let addAlert = UIAlertController(title: "ToDo", message: "", preferredStyle: .alert)
        let addAction = UIAlertAction(title: "Add New Item", style: .default) { (action) in
            
            if (txtFild.text?.isEmpty)!{
                let wrongAlert = UIAlertController(title: "ToDo", message: "Please type something", preferredStyle: .alert)
                let wrongAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                wrongAlert.addAction(wrongAction)
                self.present(wrongAlert, animated: true, completion: nil)
            
            }else{
                self.arr.append(txtFild.text!)
                self.tableView.reloadData()
            }
        }
            
        addAlert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add New Item!"
            txtFild = alertTextField
        }
        addAlert.addAction(addAction)
        present(addAlert, animated: true, completion: nil)
    }
    
    
    
    
}


//
//  MainTableViewController.swift
//  OmdbApi
//
//  Created by cice on 13/1/17.
//  Copyright © 2017 cice. All rights reserved.
//



//GCD - Grand Central Dispatch
//Threads
//Async ()
//FIFO - First In First Out
//QoS - Quality of Service
    //4 Tipos de colas
    //User Interactive (Mayor prioridad)
    //User Initiated (Tareas que se ejecutan cuando el usuaro queira que se ejecuten)
    //Utility Queue (Tarda un poco)
    //Background (Procesos que pueden tardar un tiempo y el usuario no tiene porqué saber que está ocurriendo)
//DEFAULT
//DispatchQueue.global().async { _ in

//DispatchQueue.global(qos: .uderInitiated).async { _ in }




import UIKit

class MainTableViewController: UITableViewController {

    var petitions = [[String: String]]() //Crear diccionario
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlString: String
        
        if navigationController?.tabBarItem.tag == 0 {
        urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
        }
        else{
        urlString = "https://api.whitehouse.gov/v1/petitions.json?signatureCountFloor=1000&limit=10"
        }
        
        DispatchQueue.global(qos: .userInitiated).async {//Para iniciar la carga en segundo plano
            
            if let url = URL(string: urlString){ //Comprueba si esta vacio o no
                if let data = try? Data(contentsOf: url){
                    let json = JSON(data: data)
                    
                    //Parsea
                    print(json["metadata"]["responseInfo"]["status"])
                    
                    if json["metadata"]["responseInfo"]["status"].intValue == 200 {
                        //Si es valido, podemos parsearlo
                        self.parse(json: json) //Hay que ponerlo como self, para que sepa que no es un metodo dentro del hilo sino un metodo de la clase
                        
                    }
                }
            }
        }
    }

    
    func parse(json: JSON){
        //print(json["results"])
        
        for results in json["results"].arrayValue{
            let title = results["title"].stringValue
            let body = results["body"].stringValue
            let sigs = results["signatureCount"].stringValue
            let obj = ["title": title, "body": body, "sigs": sigs]
            petitions.append(obj)
        }
        
        DispatchQueue.main.async { //Para salir al codigo principal	
            self.tableView.reloadData()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return petitions.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        let petition = petitions[indexPath.row]
        cell.textLabel?.text = petition["title"]
        cell.detailTextLabel?.text = petition["body"]

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetalleViewController()  //Para cargar una vista sin segue
        vc.itemDetalle = petitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

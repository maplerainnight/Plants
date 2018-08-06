//
//  PlantTableViewController.swift
//  Plants
//
//  Created by viplab on 2018/8/6.
//  Copyright © 2018年 viplab. All rights reserved.
//

import UIKit

class PlantTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var PlantName = ["台灣海桐","九芎","變葉木","欖仁樹","石栗"]
    var PlantLocation = ["科一館停車場前","機車道","學人會館前","通識停車場旁","香楠步道旁"]
    var PlantImage = ["台灣海桐","九芎","變葉木","欖仁樹","石栗_花"]

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PlantName.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! PlantTableViewCell

        // Configure the cell...
        cell.plantImageView.image = UIImage(named: PlantImage[indexPath.row])
        cell.nameLabel.text = PlantName[indexPath.row]
        cell.locationLabel.text = PlantLocation[indexPath.row]

        return cell
    }
    //向左滑動
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        //UIContextualAction可以在使用者按下按鈕後出現特定標題，樣式，與一段程式（也就是完成處理器）
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){
            (action,sourceView,completionHandler) in
            //刪除資料
            self.PlantName.remove(at:indexPath.row)
            self.PlantLocation.remove(at:indexPath.row)
            self.PlantImage.remove(at:indexPath.row)
            
            //刪除列
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            
            completionHandler(true)
        }
        let shareAction = UIContextualAction(style: .normal, title: "Share"){
            (action,sourceView,completionHandler) in
            let txt = "Check " + self.PlantName[indexPath.row]
            let activityController: UIActivityViewController
            if let imageToShare = UIImage(named: self.PlantImage[indexPath.row]){
                activityController = UIActivityViewController(activityItems: [txt,imageToShare], applicationActivities: nil)
            }else{
                activityController = UIActivityViewController(activityItems: [txt], applicationActivities: nil)
            }
            self.present(activityController, animated: true, completion:nil)
            completionHandler(true)
        }
        let swipeConfiguration = UISwipeActionsConfiguration(actions:[deleteAction,shareAction])
        return swipeConfiguration
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

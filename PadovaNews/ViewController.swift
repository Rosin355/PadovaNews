//
//  ViewController.swift
//  PadovaNews
//
//  Created by Romesh Singhabahu on 28/07/14.
//  Copyright (c) 2014 Romesh Singhabahu. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, MWFeedParserDelegate {
    
    var items = [MWFeedItem] ()
    let URL_FEED = "feed://mattinopadova.gelocal.it/rss/cmlink/rss-mattino-padova-1.841537"
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // qui metti il colore oppure un background della tua tableview.
        
        self.tableView.rowHeight = 70
        //self.tableView.backgroundView = UIImageView (image: UIImage(named: "Background"))
        
        //------------------ Qui sotto invece solo se vuoi in codice un colore unico -----------------------
        self.tableView.backgroundColor = UIColor.orangeColor()
        
        // con questo linea di codice ti permette di nascondere la Navigatio bar con uno swipe...Ci sarebbe anche la maniera per farlo quando tocchi una cella oppure anche quando lanci il keyboard pad...basta cambiare il secondoparamentro dopo la ?.
        navigationController?.hidesBarsOnSwipe = true
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        
        request()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func request () {
        let URL = NSURL (string: URL_FEED)
        let feedParser = MWFeedParser (feedURL: URL)
        feedParser.delegate = self
        feedParser.parse()
    }
    
    func feedParserDidStart(parser: MWFeedParser!) {
        SVProgressHUD.show()
        self.items = [MWFeedItem] ()
    }
    
    func feedParserDidFinish(parser: MWFeedParser!) {
        SVProgressHUD.dismiss()
        self.tableView.reloadData()
    }
    
    func feedParser(parser: MWFeedParser!, didParseFeedInfo info: MWFeedInfo!) {
        self.title = info.title
    }
    
    func feedParser(parser: MWFeedParser!, didParseFeedItem item: MWFeedItem!) {
        self.items.append(item)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell (style: UITableViewCellStyle.Default, reuseIdentifier: "FeedCell")
        self.configureCell(cell, atIndexPath: indexPath)
        
        // Per colorare la cella della table view
        if (indexPath.row % 2 == 0){
            cell.backgroundColor = UIColor.clearColor()
        } else {
            cell.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.2)
            cell.textLabel.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.0)
        }
        return cell
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let item = self.items[indexPath.row] as MWFeedItem
        let con = KINWebBrowserViewController ()
        let URL = NSURL (string: item.link)
        con.loadURL(URL)
        //self.navigationController.pushViewController(con, animated: true)
        self.navigationController?.pushViewController(con, animated: true)
    }
    
    
    
    func configureCell (cell: UITableViewCell, atIndexPath indexPath:NSIndexPath) {
        let item = self.items [indexPath.row] as MWFeedItem
        cell.textLabel.text = item.title
        cell.textLabel.font = UIFont.systemFontOfSize(14.0)
        cell.textLabel.numberOfLines = 0
        cell.textLabel.textColor = UIColor.blackColor()
    }
    
    
    
    
    
    
    
}


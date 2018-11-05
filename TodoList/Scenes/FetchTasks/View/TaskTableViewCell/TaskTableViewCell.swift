//
//  TaskTableViewCell.swift
//  TodoList
//
//  Created by Achraf Trabelsi on 10/31/18.
//  Copyright © 2018 Achraf Trabelsi. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setup(with task: TaskCellViewModel) {
        titleLabel.text = task.title
    }
}

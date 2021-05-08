//
//  GruopTableViewCell.swift
//  MyMessager_GB
//
//  Created by Valentin Mironov on 07.05.2021.
//

import UIKit


class GroupTableViewCell: UITableViewCell {
    static let idetifier: String = "GroupTableViewCell"

    var vm: GroupCellViewModel? {
        didSet{
            vm?.updateInformation = { [weak self] in
                guard let vm = self?.vm else{
                    print("VM equal nil", #function)
                    return
                }
                self?.configure(title: vm.title, picture: vm.image, subscription: vm.subscription, imageOnButtonSubscribe: vm.imageOnButtonSubscribe)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        vm?.updateInformation()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        vm?.updateInformation()
        // Configure the view for the selected state
    }
    
    
    @IBOutlet weak var subscriptionButton: UIButton!
    @IBOutlet weak var subscription: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var picture: UIImageView!
    
    func configure(title: String, picture: UIImage?, subscription: String, imageOnButtonSubscribe: UIImage?) {
        self.subscriptionButton.setImage(imageOnButtonSubscribe, for: .normal)
        self.title.text = title
        self.subscription.text = subscription
        self.picture.image = picture
    }
    @IBAction func onClickSubscribe(_ sender: Any) {
        vm?.subscribeAndUnsubscribe()
    }
}

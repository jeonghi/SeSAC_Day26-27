//
//  UpdateUserProfileViewController.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 2/11/24.
//

import UIKit
import Then

class UpdateUserProfileViewController: BaseViewController {
  
  var titleText: String?
  var onSave: ((String?) -> Void)?
  
  let updateUserProfileView = UpdateUserProfileView()
  
  override func loadView() {
    self.view = updateUserProfileView
    // super.loadView() ! 이거 쓰지 말라구!
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
  }
  
  
  // MARK: Action
  @objc
  func tappedSaveButton(){
    onSave?(updateUserProfileView.textField.text)
  }
  
  @objc
  func tappedAroundView(){
    self.view.endEditing(true)
  }
  
  override func configView() {
    navigationItem.title = "\(titleText ?? "")"
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(tappedSaveButton))
    view.addGestureRecognizer(.init(target: self, action: #selector(tappedAroundView)))
  }
}

@available(iOS 17.0, *)
#Preview {
  UpdateUserProfileViewController().wrapToNavVC()
}

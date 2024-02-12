//
//  SettingUserProfileViewController.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 2/11/24.
//

import UIKit
import Then

class UserProfileViewController: BaseViewController {
  
  // MARK: Property
  var userProfile: UserProfile? = .init(UserProfile(
    nickName: "곰돌이",
    userName: "정환",
    introduction: "개발자입니다",
    websiteUrl: "https://naver.com"
  ))
  
  let userProfileView: UserProfileView = .init()
  
  // MARK: Life cycle
  override func loadView() {
    self.view = userProfileView.then {
      $0.tableView.do {
        $0.dataSource = self
        $0.delegate = self
        
        // no custom subtitle cell을 사용하려면 어떠한 셀도 등록하지 않으면 된다.
        $0.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.identifier)
      }
    }
  }
}

extension UserProfileViewController {
  
  // MARK: Base Configuration
  override func configView() {
    navigationItem.title = "프로필 편집"
  }
}

extension UserProfileViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = UITableViewCell(style: UITableViewCell.CellStyle.value2, reuseIdentifier: UITableViewCell.identifier)
    
    cell.textLabel?.textColor = Style.Foundation.Color.pointColor
    cell.textLabel?.font = Style.Foundation.Font.subheadline
    cell.detailTextLabel?.textColor = Style.Foundation.Color.tintColor
    cell.detailTextLabel?.font = Style.Foundation.Font.caption
//    cell.selectionStyle = .none
    cell.backgroundColor = Style.Foundation.Color.backgroundColor
    cell.accessoryView?.tintColor = Style.Foundation.Color.tintColor
    
    
    switch indexPath.row {
    case 0:
      cell.textLabel?.text = "닉네임"
      cell.detailTextLabel?.text = userProfile?.nickName
    case 1:
      cell.textLabel?.text = "유저 이름"
      cell.detailTextLabel?.text = userProfile?.userName
    case 2:
      cell.textLabel?.text = "자기 소개"
      cell.detailTextLabel?.text = userProfile?.introduction
    case 3:
      cell.textLabel?.text = "웹 사이트"
      cell.detailTextLabel?.text = userProfile?.websiteUrl
      cell.accessoryType = .disclosureIndicator
      
    default:
      break
    }
    
    return cell
  }
  
  /// 행의 높이 지정
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    40
  }
  
  /// 테이블 뷰 섹션당 행의 갯수 지정
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    4
  }
  
  /// 테이블 뷰 섹션의 갯수 설정
  func numberOfSections(in tableView: UITableView) -> Int {
    1
  }
}

extension UserProfileViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    
    let vc = UpdateUserProfileViewController().then {
      $0.titleText = self.getTitleForIndexPath(indexPath)
      $0.updateUserProfileView.textField.text = self.getContentForIndexPath(indexPath)
    }
    
    vc.onSave = { [weak self] newText in
      self?.updateUserProfile(with: newText, at: indexPath)
      self?.userProfileView.tableView.reloadData()
      vc.navigationController?.popViewController(animated: true)
    }
    
    
    navigationController?.pushViewController(vc, animated: true)
  }
  
  func getTitleForIndexPath(_ indexPath: IndexPath) -> String? {
    switch indexPath.row {
    case 0: return "이름"
    case 1: return "사용자 이름"
    case 2: return "자기소개"
    case 3: return "웹 사이트"
    default: return nil
    }
  }
  
  func getContentForIndexPath(_ indexPath: IndexPath) -> String? {
    switch indexPath.row {
    case 0: return userProfile?.nickName
    case 1: return userProfile?.userName
    case 2: return userProfile?.introduction
    case 3: return userProfile?.websiteUrl
    default: return nil
    }
  }
  
  func updateUserProfile(with newText: String?, at indexPath: IndexPath) {
    guard let newText = newText else { return }
    switch indexPath.row {
    case 0: userProfile?.nickName = newText
    case 1: userProfile?.userName = newText
    case 2: userProfile?.introduction = newText
    case 3: userProfile?.websiteUrl = newText
    default: break
    }
  }
}


@available(iOS 17.0, *)
#Preview {
  UserProfileViewController().wrapToNavVC()
}

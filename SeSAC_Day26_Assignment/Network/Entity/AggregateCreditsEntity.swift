//
//  AggregateCreditsEntity.swift
//  SeSAC_Day26_Assignment
//
//  Created by 쩡화니 on 2/2/24.
//

import Foundation

enum AggregateCreditsEntity {
  
  enum Gender: Int, Codable {
    case unknown = 0
    case female = 1
    case male = 2
  }
  
  enum Department: String, Codable {
    case acting = "Acting"
    case writing = "Writing"
  }
  
  // MARK: - Role
  struct Role: Codable {
    let creditId: String
    let character: String
    let episodeCount: Int
    
    enum CodingKeys: String, CodingKey {
      case creditId = "credit_id"
      case character
      case episodeCount = "episode_count"
    }
  }
  
  struct Request {
    
  }
  
  struct Response: Decodable {
    let id: Int
    let cast: [CastMember]?
    let crew: [CrewMember]?
  }
  
  // MARK: - Cast Member
  struct CastMember: Decodable {
    let adult: Bool
    let gender: Int
    let id: Int
    let knownForDepartment: String
    let name: String
    let originalName: String
    let popularity: Double
    let profilePath: String?
    let roles: [Role]
    let totalEpisodeCount: Int
    let order: Int
    
    enum CodingKeys: String, CodingKey {
      case adult, gender, id, roles, order
      case knownForDepartment = "known_for_department"
      case name
      case originalName = "original_name"
      case popularity
      case profilePath = "profile_path"
      case totalEpisodeCount = "total_episode_count"
    }
  }
  
  // MARK: - Crew Member
  struct CrewMember: Decodable {
    let adult: Bool
    let gender: Int
    let id: Int
    let knownForDepartment: String
    let name: String
    let originalName: String
    let popularity: Double
    let profilePath: String?
    let jobs: [Job]?
    let department: String
    let totalEpisodeCount: Int
    
    enum CodingKeys: String, CodingKey {
      case adult, gender, id, jobs, department
      case knownForDepartment = "known_for_department"
      case name
      case originalName = "original_name"
      case popularity
      case profilePath = "profile_path"
      case totalEpisodeCount = "total_episode_count"
    }
  }
  
  // MARK: - Job
  struct Job: Decodable {
    let creditId: String
    let job: String
    let episodeCount: Int
    let department: String?
    
    enum CodingKeys: String, CodingKey {
      case creditId = "credit_id"
      case job
      case episodeCount = "episode_count"
      case department
    }
  }
}

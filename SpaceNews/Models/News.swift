//
//  News.swift
//  SpaceNews
//
//  Created by Muhammad Fikri Bill Gufran on 7/5/23.
//

/**
 Sample response
 
 {
         "id": 19228,
         "title": "NASA Inducts Roy Bridges & Mark Kelly Into Astronaut Hall of Fame",
         "url": "https://tlpnetwork.com/news/2023/05/nasa-astronaut-hall-of-fame-2023",
         "imageUrl": "https://cdn.tlpnetwork.com/articles/2023/1683410273892.jpg",
         "newsSite": "The Launch Pad",
         "summary": "The 2023 Astronaut Hall of Fame Induction Ceremony celebrating NASA Astronauts Roy D. Bridges Jr. and Senator Mark Kelly.",
         "publishedAt": "2023-05-06T21:57:00.000Z",
         "updatedAt": "2023-05-06T22:03:36.511Z",
         "featured": false,
         "launches": [],
         "events": []
     },
 */

import Foundation

// @todo implement `launches` and `events`

struct News: Decodable {
    let id: Int
    let title: String
    let url: String
    let imageUrl: String
    let newsSite: String
    let summary: String
    let publishedAt: String
    let updatedAt: String
    let featured: Bool
    
    enum CodingKeys: CodingKey {
        case id
        case title
        case url
        case imageUrl
        case newsSite
        case summary
        case publishedAt
        case updatedAt
        case featured
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        self.url = try container.decodeIfPresent(String.self, forKey: .url) ?? ""
        self.imageUrl = try container.decodeIfPresent(String.self, forKey: .imageUrl) ?? ""
        self.newsSite = try container.decodeIfPresent(String.self, forKey: .newsSite) ?? ""
        self.summary = try container.decodeIfPresent(String.self, forKey: .summary) ?? ""
        self.publishedAt = try container.decodeIfPresent(String.self, forKey: .publishedAt) ?? ""
        self.updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt) ?? ""
        self.featured = try container.decodeIfPresent(Bool.self, forKey: .featured) ?? false
    }
}

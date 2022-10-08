//
//  MockData.swift
//  Emidate
//
//  Created by LEMIN DAHOVICH on 08.10.2022.
//

import Foundation

struct MockData:Decodable, Hashable {
    static let shared = MockData()
    
    
    private let profile: ProfileSection = {
        .profile(.init(name: "Emin",
                        image: "human1",
                        location: "Ukraine, Odesa",
                        matches: 153,
                        likes: 999,
                        bio: "I love sport and cars",
                        about: "About",
                        settings: "Settings",
                        instagram: "lembaluet",
                        spotify: "lembaluet",
                        photos: ["human1","human2","human3","human4","human5","human6","human7","human8"]
                        
                       ))
    }()
    
    private let settings: ProfileSection = {
        .settings(.init(name: "",
                         image: "",
                         location: "",
                         matches: 0,
                         likes: 0,
                         bio: "",
                         about: "About",
                         settings: "Settings",
                         instagram: "",
                         spotify: "",
                         photos: []
                         
                        ))
    }()
    
    
    
    private let socials: ProfileSection = {
        .socials(.init(name: "",
                        image: "",
                        location: "",
                        matches: 0,
                        likes: 0,
                        bio: "",
                        about: "",
                        settings: "",
                        instagram: "lembaluet",
                        spotify: "lembaluet",
                        photos: []
                        
                       ))
    }()
    
    private let photos: ProfileSection = {
        .photos(.init(name: "",
                       image: "",
                       location: "",
                       matches: 0,
                       likes: 0,
                       bio: "",
                       about: "",
                       settings: "",
                       instagram: "",
                       spotify: "",
                       photos: ["human1","human2","human3","human4","human5","human6","human7","human8"]
                       
                      ))
    }()
    
    
    
    var pageData: [ProfileSection] {
        [profile, settings, socials, photos]
    }
    
    
}

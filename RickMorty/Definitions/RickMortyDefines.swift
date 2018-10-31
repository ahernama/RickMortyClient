//
//  RickMortyDefines.swift
//  RickMorty
//
//  Created by Alejandro Hernández Matías on 30/10/18.
//  Copyright © 2018 Alejandro Hernández Matías. All rights reserved.
//

import UIKit

class RickMortyDefines: NSObject {
    
    struct ContentServices{
        static let baseUrl = "https://rickandmortyapi.com"
        
        struct Episodes{
            static let getEpisodes = "/api/episode/"
            static let defaultPage = 1
        }
        struct Characters{
            static let getCharacters = "/api/character/"
        }
    }
    
    struct Onboarding{
        static let numSteps = 2
    }
    
    struct Tabbar{
        static let numTabs = 2
        
        static let offsetInsideIndicator = 15.0
        static let heightInsideIndicator = 3.0
        static let positionYInsideIndicator = 46.0
    }
    
    struct CollectionViews{
        struct EpisodesList{
            static let heightEpisodeCellSection:CGFloat = 165.0
            static let heightEpisodeCell:CGFloat = 115.0
            static let heightLoading:CGFloat = 40.0
            
            static let scrollToRequestNewItemsParam:CGFloat = 1.2
            
            static let numSections = 2
            static let sectionLoading = 1
        }
    }
    
    struct Colors{
        static let green = UIColor(red: 0.514, green: 0.824, blue: 0.286, alpha: 1.0)
        static let darkGreen = UIColor(red: 0.184, green: 0.561, blue: 0.192, alpha: 1.0)
        static let orange = UIColor(red: 0.902, green: 0.329, blue: 0.114, alpha: 1.0)
    }
    
    struct Fonts{
        static let avenir_roman_14 = UIFont(name: "Avenir-Roman", size: 14)
        static let avenir_roman_15 = UIFont(name: "Avenir-Roman", size: 15)
        static let avenir_roman_16 = UIFont(name: "Avenir-Roman", size: 16)
        static let avenir_roman_17 = UIFont(name: "Avenir-Roman", size: 17)
        static let avenir_roman_18 = UIFont(name: "Avenir-Roman", size: 18)
        static let avenir_roman_19 = UIFont(name: "Avenir-Roman", size: 19)
        static let avenir_roman_20 = UIFont(name: "Avenir-Roman", size: 20)
        static let avenir_roman_21 = UIFont(name: "Avenir-Roman", size: 21)
        
        static let avenir_book_10 = UIFont(name: "Avenir-Book", size: 10)
        static let avenir_book_14 = UIFont(name: "Avenir-Book", size: 14)
        static let avenir_book_15 = UIFont(name: "Avenir-Book", size: 15)
        static let avenir_book_16 = UIFont(name: "Avenir-Book", size: 16)
        static let avenir_book_17 = UIFont(name: "Avenir-Book", size: 17)
        static let avenir_book_18 = UIFont(name: "Avenir-Book", size: 18)
        static let avenir_book_19 = UIFont(name: "Avenir-Book", size: 19)
        static let avenir_book_20 = UIFont(name: "Avenir-Book", size: 20)
        static let avenir_book_21 = UIFont(name: "Avenir-Book", size: 21)
        
        static let avenir_heavy_14 = UIFont(name: "Avenir-Heavy", size: 14)
        static let avenir_heavy_15 = UIFont(name: "Avenir-Heavy", size: 15)
        static let avenir_heavy_16 = UIFont(name: "Avenir-Heavy", size: 16)
        static let avenir_heavy_17 = UIFont(name: "Avenir-Heavy", size: 17)
        static let avenir_heavy_18 = UIFont(name: "Avenir-Heavy", size: 18)
        static let avenir_heavy_19 = UIFont(name: "Avenir-Heavy", size: 19)
        static let avenir_heavy_20 = UIFont(name: "Avenir-Heavy", size: 20)
        static let avenir_heavy_21 = UIFont(name: "Avenir-Heavy", size: 21)
        
        static let avenir_black_20 = UIFont(name: "Avenir-Black", size: 20)
        static let avenir_black_16 = UIFont(name: "Avenir-Black", size: 16)
    }
    
    struct Metrics{
        struct Common{
            static let loadingSize:CGFloat = 40.0
        }
        struct EpisodesList{
            static let headerMax:CGFloat = DevDefines.Metrics.heightScreen/3.0
            static let headerMin:CGFloat = 62.0
        }
    }
}

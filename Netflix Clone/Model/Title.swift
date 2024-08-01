//
//  Movie.swift
//  Netflix Clone
//
//  Created by  Samet Eğerci on 30.07.2024.
//

import Foundation

struct TrendingTitleResponse: Codable {
    let results: [Title]
    
    
}


struct Title:Codable {
    let id:Int
    let media_type: String?
    let original_name: String?
    let original_title:String?
    let poster_path:String?
    let overview: String?
    let vote_count:Int
    let release_date:String?
    let vote_average: Double
    
    
    
}

/*
 
 
 adult = 0;
 "backdrop_path" = "/2RVcJbWFmICRDsVxRI8F5xRmRsK.jpg";
 "genre_ids" =             (
     27,
     878,
     53
 );
 id = 762441;
 "media_type" = movie;
 "original_language" = en;
 "original_title" = "A Quiet Place: Day One";
 overview = "As New York City is invaded by alien creatures who hunt by sound, a woman named Sam fights to survive with her cat.";
 popularity = "969.283";
 "poster_path" = "/hU42CRk14JuPEdqZG3AWmagiPAP.jpg";
 "release_date" = "2024-06-26";
 title = "A Quiet Place: Day One";
 video = 0;
 "vote_average" = "6.8";
 "vote_count" = 546;
 */

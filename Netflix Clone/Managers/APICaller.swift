//
//  APICaller.swift
//  Netflix Clone
//
//  Created by  Samet Eğerci on 30.07.2024.
//

import Foundation


struct constans  {
 
    static let API_KEY = "f36b5ff33b19bd12cb77ba5b71431dc4"
    static let baseURL = "https://api.themoviedb.org"
    static let YoutubeApı_KEY = "AIzaSyC4g-gI2yFV9vON-so8opUM4iPao3wcbZo"
    static let YoutubeBase_URL = "https://youtube.googleapis.com/youtube/v3/search?"
    
}
enum APIError: Error {
    
    case failedTogetData
}


class APICaller {
    static let shared = APICaller()
    
    
    func getTrendingMovies(completion: @escaping (Result<[Title],Error>) -> Void  ) {
        
        
        guard let url = URL(string: "\(constans.baseURL)/3/trending/movie/day?api_key=\(constans.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    
    func getTrendingTvs(completion: @escaping (Result<[Title],Error>) -> Void  ) {
        guard let url = URL(string: "\(constans.baseURL)/3/trending/tv/day?api_key=\(constans.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    func getUpComingMovies(completion: @escaping (Result<[Title],Error>) -> Void) {
        guard let url = URL(string:"\(constans.baseURL)/3/movie/upcoming?api_key=\(constans.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: url) { data,_, error in
            guard let data = data , error == nil else {
                return
            }
            
            do {
                
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(APIError.failedTogetData))
                
            }
            
        }
        task.resume()
    }
    
    
    func getPopuler(completion: @escaping (Result<[Title],Error>) -> Void) {
        guard let url = URL(string: "\(constans.baseURL)/3/movie/popular?api_key=\(constans.API_KEY)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(APIError.failedTogetData))
            }
            
            
        }
        task.resume()
    }
    
    
    func getTopRated(completion: @escaping (Result<[Title],Error>) -> Void) {
        guard let url = URL(string: "\(constans.baseURL)/3/movie/top_rated?api_key=\(constans.API_KEY)&language=en-US&page=1") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    func getDiscoverMovies(completion: @escaping (Result<[Title],Error>) -> Void) {
        
        guard let url = URL(string: "\(constans.baseURL)/3/discover/movie?api_key=\(constans.API_KEY)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    func search(with query: String,completion: @escaping (Result<[Title],Error>) -> Void) {
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}

        
        guard let url  = URL(string: "\(constans.baseURL)/3/search/movie?api_key=\(constans.API_KEY)&query=\(query)") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }catch{
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    
    func getMovie(with query: String,completion: @escaping (Result<VideoElement,Error>) -> Void) {
      
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        guard let url = URL(string: "\(constans.YoutubeBase_URL)q=\(query)&key=\(constans.YoutubeApı_KEY)") else
        
        {return}
        
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(YoutubeSearchResponse.self, from: data)
                
                completion(.success(results.items[0]))
                    
                
            }catch{
                completion(.failure(error))
                print(error.localizedDescription)
            }
        }
        task.resume()
        
    }
}

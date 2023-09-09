//
//  APICaller.swift
//  NetflixClone
//
//  Created by Venky on 07/09/23.
//

import Foundation

struct Constants {
    static let API_KEY = "7465bbee52077d4a84850b69ecd9c530"
    static let baseURL = "https://api.themoviedb.org"
    static let YoutubeAPI_KEY = "AIzaSyBpFMKzdkUtc7Vv6BZoUfak3pMhL6POtvg"
    static let youtubeBaseURL = "https://youtube.googleapis.com/youtube/v3/search?"
}
enum APIError: Error {
    case failedToGetData
}

class ApiCaller {
    static let shared = ApiCaller()
    
    
    func gettrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        
        let headers = [
            "accept": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3NDY1YmJlZTUyMDc3ZDRhODQ4NTBiNjllY2Q5YzUzMCIsInN1YiI6IjYzMWQ0YjVkYjIzNGI5MDA3ZDk4MDQ5YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.F0Pjmv7JbnljVG1mGSXPKSKVkjfP4n4pgA-clW1nsr4"
        ]
        
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?language=en-US") else {
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = headers
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func gettrendingTvs(completion: @escaping (Result<[Title], Error>) -> Void) {
        let headers = [
            "accept": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3NDY1YmJlZTUyMDc3ZDRhODQ4NTBiNjllY2Q5YzUzMCIsInN1YiI6IjYzMWQ0YjVkYjIzNGI5MDA3ZDk4MDQ5YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.F0Pjmv7JbnljVG1mGSXPKSKVkjfP4n4pgA-clW1nsr4"
        ]
        
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/tv/day?language=en-US") else {
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = headers
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
    }
    
    func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        
        let headers = [
            "accept": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3NDY1YmJlZTUyMDc3ZDRhODQ4NTBiNjllY2Q5YzUzMCIsInN1YiI6IjYzMWQ0YjVkYjIzNGI5MDA3ZDk4MDQ5YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.F0Pjmv7JbnljVG1mGSXPKSKVkjfP4n4pgA-clW1nsr4"
        ]
        
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/upcoming?language=en-US&page=1") else {
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = headers
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
        
    }
    func getPopularMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        
        let headers = [
            "accept": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3NDY1YmJlZTUyMDc3ZDRhODQ4NTBiNjllY2Q5YzUzMCIsInN1YiI6IjYzMWQ0YjVkYjIzNGI5MDA3ZDk4MDQ5YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.F0Pjmv7JbnljVG1mGSXPKSKVkjfP4n4pgA-clW1nsr4"
        ]
        
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?language=en-US&page=1") else {
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = headers
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
        
    }

    func getTopRatedMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        
        let headers = [
            "accept": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3NDY1YmJlZTUyMDc3ZDRhODQ4NTBiNjllY2Q5YzUzMCIsInN1YiI6IjYzMWQ0YjVkYjIzNGI5MDA3ZDk4MDQ5YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.F0Pjmv7JbnljVG1mGSXPKSKVkjfP4n4pgA-clW1nsr4"
        ]
        
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/top_rated?language=en-US&page=1") else {
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = headers
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
        
    }
    
    func getDiscoverMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        
        let headers = [
            "accept": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3NDY1YmJlZTUyMDc3ZDRhODQ4NTBiNjllY2Q5YzUzMCIsInN1YiI6IjYzMWQ0YjVkYjIzNGI5MDA3ZDk4MDQ5YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.F0Pjmv7JbnljVG1mGSXPKSKVkjfP4n4pgA-clW1nsr4"
        ]
        
        guard let url = URL(string: "\(Constants.baseURL)/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc") else {
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = headers
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
        
    }
    
    func search(with query: String, completion: @escaping (Result<[Title], Error>) -> Void) {
        
        let headers = [
            "accept": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3NDY1YmJlZTUyMDc3ZDRhODQ4NTBiNjllY2Q5YzUzMCIsInN1YiI6IjYzMWQ0YjVkYjIzNGI5MDA3ZDk4MDQ5YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.F0Pjmv7JbnljVG1mGSXPKSKVkjfP4n4pgA-clW1nsr4"
        ]
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        
        guard let url = URL(string: "\(Constants.baseURL)/3/search/movie?query=\(query)&api_key=\(Constants.API_KEY)") else {
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = headers
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(APIError.failedToGetData))
            }
        }
        task.resume()
        
    }
    
    func getMovie(with query: String, completion: @escaping (Result<VideoElement, Error>) -> Void) {
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else { return }
        guard let url = URL(string: "\(Constants.youtubeBaseURL)q=\(query)&key=\(Constants.YoutubeAPI_KEY)") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let results = try JSONDecoder().decode(YoutubeSearchResponse.self, from: data)
                completion(.success(results.items[0]))
            } catch {
                completion(.failure(error))
               
            }
        }
        task.resume()
        
        
    }

}
//https://youtube.googleapis.com/youtube/v3/search?q=Harry&key=[YOUR_API_KEY]

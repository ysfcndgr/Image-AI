//
//  StableDiffusionManager.swift
//  VisionCraft
//
//  Created by Can on 17.03.2024.
//

import SwiftUI


struct StableDiffusionRequest: Encodable {
    let cfgScale: Double = 7.0
    let clipGuidancePreset: String = "FAST_BLUE"
    let height: Int = 512
    let width: Int = 512
    let sampler: String = "K_DPM_2_ANCESTRAL"
    let samples: Int = 1
    let steps: Int = 30
    let textPrompts: [TextPrompt]
    
    enum CodingKeys: String, CodingKey {
        case cfgScale = "cfg_scale"
        case clipGuidancePreset = "clip_guidance_preset"
        case height
        case width
        case sampler
        case samples
        case steps
        case textPrompts = "text_prompts"
    }
    
    struct TextPrompt: Encodable {
        let text: String
        let weight: Double = 1
    }
}




final class StableDiffusionManager {
    
    static let shared = StableDiffusionManager()
    
    private init () { }
    
    let apiKey = "sk-8nqOrtpZ8O9fzJVKzxieqBnnikQg8I6n4vGJ5kopaLq1LFdu"
    
    func sendStableDiffusionRequest(req: StableDiffusionRequest, completion: @escaping (StableDiffusionResponse?, Error?) -> Void) {
        let url = URL(string: "https://api.stability.ai/v1/generation/stable-diffusion-v1-6/text-to-image")! // API uç noktanızı değiştirin
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoder = JSONEncoder()
        let jsonData = try! encoder.encode(req)
        
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data {
                
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                    
                    let jsonDecoder = JSONDecoder()
                    let decoded = try jsonDecoder.decode(StableDiffusionResponse.self, from: data)
                    completion(decoded, nil)
                } catch {
                    print(error)
                }
            }
        }
        
        task.resume()
    }
}


struct StableDiffusionResponse: Decodable {
    let artifacts: [Artifact]
    
    struct Artifact: Decodable {
        let base64: String
        let finishReason: String
        let seed: Int
    }
}


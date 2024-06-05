//"
//  StyleData.swift
//  VisionCraft
//
//  Created by Can on 11.03.2024.
//

import SwiftUI

final class StyleData: ObservableObject {
    @Published var styleList: [StyleModel] = [
        .init(title: "3D Model", thumbImage: Image(._3DModel), prompt: "professional 3d model {prompt} . octane render, highly detailed, volumetric, dramatic lighting", negativePrompt: "ugly, deformed, noisy, low poly, blurry, painting"),
        .init(title: "Analog", thumbImage: Image(.analog), prompt: "analog film photo {prompt} . faded film, desaturated, 35mm photo, grainy, vignette, vintage, Kodachrome, Lomography, stained, highly detailed, found footage", negativePrompt: "painting, drawing, illustration, glitch, deformed, mutated, cross-eyed, ugly, disfigured"),
        .init(title: "Anime", thumbImage: Image(.anime), prompt: "anime artwork {prompt} . anime style, key visual, vibrant, studio anime, highly detailed", negativePrompt: "photo, deformed, black and white, realism, disfigured, low contrast"),
        .init(title: "Cinematic", thumbImage: Image(.cinematic), prompt: "cinematic film still {prompt} . shallow depth of field, vignette, highly detailed, high budget, bokeh, cinemascope, moody, epic, gorgeous, film grain, grainy", negativePrompt: "anime, cartoon, graphic, text, painting, crayon, graphite, abstract, glitch, deformed, mutated, ugly, disfigured"),
        .init(title: "Comic Book", thumbImage: Image(.comic), prompt: "comic {prompt} . graphic illustration, comic art, graphic novel art, vibrant, highly detailed", negativePrompt: "photograph, deformed, glitch, noisy, realistic, stock photo"),
        .init(title: "Craft Clay", thumbImage: Image(.craft), prompt: "play-doh style {prompt} . sculpture, clay art, centered composition, Claymation", negativePrompt: "sloppy, messy, grainy, highly detailed, ultra textured, photo"),
        .init(title: "Line Art", thumbImage: Image(.line), prompt: "line art drawing {prompt} . professional, sleek, modern, minimalist, graphic, line art, vector graphics", negativePrompt: "anime, photorealistic, 35mm film, deformed, glitch, blurry, noisy, off-center, deformed, cross-eyed, closed eyes, bad anatomy, ugly, disfigured, mutated, realism, realistic, impressionism, expressionism, oil, acrylic"),
        .init(title: "Lowpoly", thumbImage: Image(.lineboly), prompt: "low-poly style {prompt} . low-poly game art, polygon mesh, jagged, blocky, wireframe edges, centered composition", negativePrompt: "noisy, sloppy, messy, grainy, highly detailed, ultra textured, photo"),
        .init(title: "Neon Punk", thumbImage: Image(.neonpunk), prompt: "neonpunk style {prompt} . cyberpunk, vaporwave, neon, vibes, vibrant, stunningly beautiful, crisp, detailed, sleek, ultramodern, magenta highlights, dark purple shadows, high contrast, cinematic, ultra detailed, intricate, professional", negativePrompt: "painting, drawing, illustration, glitch, deformed, mutated, cross-eyed, ugly, disfigured"),
        .init(title: "Origami", thumbImage: Image(.origami), prompt: "origami style {prompt} . paper art, pleated paper, folded, origami art, pleats, cut and fold, centered composition", negativePrompt: "noisy, sloppy, messy, grainy, highly detailed, ultra textured, photo"),
        .init(title: "Photographic", thumbImage: Image(.photographic), prompt: "cinematic photo {prompt} . 35mm photograph, film, bokeh, professional, 4k, highly detailed", negativePrompt: "drawing, painting, crayon, sketch, graphite, impressionist, noisy, blurry, soft, deformed, ugly"),
        .init(title: "Pixel Art", thumbImage: Image(.pixelart), prompt: "pixel-art {prompt} . low-res, blocky, pixel art style, 8-bit graphics", negativePrompt: "sloppy, messy, blurry, noisy, highly detailed, ultra textured, photo, realistic")
     
    ]
    
    func makeUnSelect() {
        if let index = styleList.firstIndex(where: { $0.isSelected }) {
            styleList[index].isSelected = false
        }
    }
}

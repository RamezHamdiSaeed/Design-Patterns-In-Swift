import UIKit

//simulate SDWebImage since it based on chain of responsibility when it attempts to load the image over the network unless cached on the memory

protocol ImageLoader{
    func loadImage(path:String) -> Void
}

final class SDWebImageNetwork : ImageLoader{
    
    var isValidURL : Bool = false
    var nexImageLoader : ImageLoader?
    
    init(isValidURL:Bool, nextImageLoader:ImageLoader?) {
        self.isValidURL = isValidURL
        self.nexImageLoader = nextImageLoader
    }
    
    func loadImage(path:String) -> Void{
        if isValidURL {
            print("Image Loaded Over the Nework")
        }
        print("Invalid URL")

    }

}

final class SDWebImageCache : ImageLoader{
    
    var isValidURL : Bool = false
    var isCachedImage : Bool = false
    var nexImageLoader : ImageLoader?
    
    init(isValidURL:Bool, isCachedImage:Bool, nextImageLoader:ImageLoader?){
        self.isValidURL = isValidURL
        self.isCachedImage = isCachedImage
        self.nexImageLoader = nextImageLoader
    }
    
    func loadImage(path:String) -> Void{
        if self.isCachedImage {
            print("Image Loaded From The Cache")

        }
        self.nexImageLoader?.loadImage(path: path)
    }

}

let image : ImageLoader = SDWebImageNetwork(isValidURL: true, nextImageLoader: nil)
let image2 : ImageLoader = SDWebImageCache(isValidURL: true, isCachedImage: false, nextImageLoader: image)

image.loadImage(path: "xyz")
image2.loadImage(path: "abc")


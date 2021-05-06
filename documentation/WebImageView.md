File: BoxOfficeBuzz/Views/WebImageView.swift

# WebImageView

## Summary
ImageView that loads images from a URL and saves into a cache. It can be used to display images from a URL while utilizing caching to reduce network requests.

## Instance Variables
- `dataTask`: `URLSessionDataTask?` - The data task used to load the image from the URL.

## Methods
- `deinit() -> Void` - Cancels the data task when the instance is deinitialized.
- `loadImageUsingCache(url: URL) -> Void` - Loads an image from the given URL using caching. If the image is cached, it is loaded from the cache, otherwise it is loaded from the URL and saved to the cache.

## Dependencies
- `URLSessionDataTask`


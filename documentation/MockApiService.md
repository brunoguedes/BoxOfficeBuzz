File: BoxOfficeBuzzTests/MockApiService.swift

# MockApiService
## Summary
MockApiService is a class that conforms to the ApiServiceProtocol. It provides a way to mock API responses for testing purposes. It can be used to simulate different API responses by configuring the mock responses and call information.

## Instance Variables
- `mockResponses`: `[MockResponses]` - An array of mock responses that can be used to simulate different API responses.
- `latestCallInfo`: `CallInfo?` - The latest call information, including the endpoint called, HTTP method, query parameters, and JSON data.
- `filename`: `String` - A computed property that returns the filename of the JSON file to be used for the mock response, based on the first element of the `mockResponses` array.

## Methods
- `func requestData<T: Decodable>(endpointPath: String, queryParameters: String? = nil, queue: DispatchQueue = .main, completion: @escaping (Result<T?, NetworkError>) -> Void) -> Void` - A method that simulates an API request by reading a JSON file from the bundle and decoding it into the specified type. It also updates the `latestCallInfo` property with the call information.

## Dependencies
- `CallInfo` - A struct that represents the call information, including the endpoint called, HTTP method, query parameters, and JSON data.
- `Data` - Used to read the JSON file from the bundle.
- `String` - Used as the type for the endpoint path, query parameters, and filename.
- `HTTPMethod` - An enum that represents the HTTP method used in the API request.
- `MockResponses` - An enum that represents the different mock responses that can be used.
- `NetworkError` - An error type used in the completion handler of the `requestData` method.


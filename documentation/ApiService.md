File: BoxOfficeBuzz/Api Services/ApiService.swift

# NetworkError
## Summary
The `NetworkError` enum represents errors that can occur during network operations. It can be used to handle and propagate errors in a type-safe manner.

### Cases
- `badURL`: Indicates that the URL used for the network request is invalid.
- `serviceError(Error)`: Represents an error returned by the server or a lower-level error.
- `invalidJson`: Indicates that the JSON data received from the server is invalid.

# ApiServiceProtocol
## Summary
ApiServiceProtocol defines a protocol for API services to request data from a specific endpoint. This protocol can be used to create API services that can fetch data from a server and handle the response.

## Methods
- ### requestData(endpointPath: String, queryParameters: String?, queue: DispatchQueue, completion: @escaping (Result<T?, NetworkError>) -> Void) -> Void
  Definition: `func requestData<T: Decodable>(endpointPath: String, queryParameters: String?, queue: DispatchQueue, completion: @escaping (Result<T?, NetworkError>) -> Void)`
  Description: Requests data from a specific endpoint with optional query parameters and handles the response on a specified queue. The completion handler returns a result containing the decoded data or a network error.

# ApiService
## Summary
ApiService is a class that provides a way to request data from an end point. It can be used to send requests to a server and handle the response.

## Instance Variables
- `baseURL`: `URL` - The base URL of the API.
- `defaultSession`: `URLSession` - The default URL session used for sending requests.
- `dataTask`: `URLSessionDataTask?` - The current data task being executed.
- `errorMessage`: `String` - The error message of the last request.

## Methods
- `init() -> Void`: Initializes the ApiService instance with the base URL from AppConfig.
- `requestData<T: Decodable>(endpointPath: String, queryParameters: String? = nil, queue: DispatchQueue = .main, completion: @escaping (Result<T?, NetworkError>) -> Void) -> Void`: Requests data from an end point. Cancels any existing data task, constructs the URL with the endpoint path and query parameters, sends the request, and calls the completion handler with the result.

## Dependencies
- `URLSessionDataTask?`
- `URL`


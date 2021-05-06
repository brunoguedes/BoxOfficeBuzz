File: BoxOfficeBuzz/Models/PaginatedResults.swift

# PaginatedResults
## Summary
PaginatedResults is a generic struct that represents a paginated collection of results. It can be used to store and manage paginated data from APIs or other data sources.

## Instance Variables
- `results`: `[T]` - An array of results of type `T`, where `T` is a type that conforms to the `Decodable` protocol.
- `page`: `Int` - The current page number.
- `totalPages`: `Int` - The total number of pages.

## Dependencies
- `Int` - Used for page numbers.
- `[T]` - Used for storing an array of results, where `T` is a type that conforms to the `Decodable` protocol.

# PaginatedResults
## Summary
PaginatedResults is a generic struct that represents a collection of paginated results. It can be used to store and manage paginated data, such as API responses, where each page contains a subset of the total results.

## Properties
- `results`: `[T]` - An array of results of type `T`.
- `page`: `Int` - The current page number.
- `totalPages`: `Int` - The total number of pages.

## Methods
None.


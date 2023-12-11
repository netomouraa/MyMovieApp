////
////  SearchBarTests.swift
////  MyMovieAppTests
////
////  Created by Neto Moura on 11/12/23.
////
//
//import XCTest
//import SwiftUI
//
//@testable import MyMovieApp
//
//class SearchBarTests: XCTestCase {
//
//    func testSearchAction() {
//        // Arrange
//        var searchText = "ExampleQuery"
//        var searchActionCalled = false
//        var searchBar: SearchBar?
//
//        let contentView = SearchBarTestView(searchText: $searchText, onSearch: {
//            searchActionCalled = true
//        }) {
//            searchBar = $0
//        }
//
//        // Act
//        if let searchBar = searchBar {
//            searchBar.onSearch()
//        }
//
//        // Act
//        if let button = contentView.view as? UIButton {
//            button.sendActions(for: .touchUpInside)
//        }
//
//        // Assert
//        XCTAssertTrue(searchActionCalled)
//    }
//
//}
//
//struct SearchBarTestView<Content: View>: View {
//    @Binding var searchText: String
//    var onSearch: () -> Void
//    var content: (SearchBar) -> Content
//
//    var body: some View {
//        let searchBar = SearchBar(text: $searchText, onSearch: onSearch)
//
//        return content(searchBar)
//    }
//}
//

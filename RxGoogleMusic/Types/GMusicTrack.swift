//
//  GMusicTrack.swift
//  RxGoogleMusic
//
//  Created by Anton Efimenko on 01.01.2018.
//  Copyright © 2018 Anton Efimenko. All rights reserved.
//

import Foundation

public struct GMusicTrack: Codable {
	let kind: String
	let id: UUID
	let clientId: String
	let creationTimestamp: Date
	let lastModifiedTimestamp: Date
	let recentTimestamp: Date
	let deleted: Bool
	let title: String
	let artist: String
	let composer: String
	let album: String
	let albumArtist: String
	let year: Int
	let trackNumber: Int
	let genre: String
	let durationMillis: Int
	let albumArtRef: [GMusicRef]
	let artistArtRef: [GMusicRef]
	let playCount: Int
	let discNumber: Int
	let rating: Int
	let estimatedSize: Int
	let trackType: Int
	let storeId: String
	let albumId: String
	let artistId: [String]
	let nid: String
	let explicitType: Int
	let lastRatingChangeTimestamp: Date
}

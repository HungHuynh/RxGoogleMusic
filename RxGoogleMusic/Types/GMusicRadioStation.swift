//
//  GMusicRadioStation.swift
//  RxGoogleMusic
//
//  Created by Anton Efimenko on 08.01.2018.
//  Copyright © 2018 Anton Efimenko. All rights reserved.
//

import Foundation

public struct GMusicRadioSeed: Codable, Equatable {
	public let kind: String
	public let artistId: String?
	public let seedType: String
	public let metadataSeed: GMusicRadioSeedMetadata?
}

public struct GMusicRadioSeedMetadata: Codable, Equatable {
	public let kind: String
    public let artist: GMusicArtist?
}

public struct GMusicRadioStation: Codable, Equatable {
	enum CodingKeys: String, CodingKey {
		case kind
		case id
		case clientId
		case creationTimestamp
		case lastModifiedTimestamp
		case recentTimestamp
		case name
		case description
//		case skipEventHistory
		case seed
		case stationSeeds
		case imageUrls
		case compositeArtRefs
		case deleted
		case inLibrary
        case tracks
	}
	
	public let kind: String
	public let id: UUID?
	public let clientId: String?
	public let creationTimestamp: GMusicTimestamp?
	public let lastModifiedTimestamp: GMusicTimestamp?
	public let recentTimestamp: GMusicTimestamp?
	public let name: String
	public let description: String?
//	public let skipEventHistory
	public let seed: GMusicRadioSeed
	public let stationSeeds: [GMusicRadioSeed]
	public let imageUrls: [GMusicRef]
	public let compositeArtRefs: [GMusicRef]
	public let deleted: Bool
	public let inLibrary: Bool
    public let tracks: [GMusicTrack]
	
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		kind = try container.decode(.kind)
		id = try container.decodeIfPresent(.id)
		clientId = try container.decodeIfPresent(.clientId)
		creationTimestamp = try container.decodeIfPresent(.creationTimestamp)
		lastModifiedTimestamp = try container.decodeIfPresent(.lastModifiedTimestamp)
		recentTimestamp = try container.decodeIfPresent(.recentTimestamp)
		name = try container.decode(.name)
		description = try container.decodeIfPresent(.description)
		seed = try container.decode(.seed)
		stationSeeds = try container.decodeIfPresent(.stationSeeds) ?? []
		imageUrls = try container.decodeIfPresent(.imageUrls) ?? []
		compositeArtRefs = try container.decodeIfPresent(.compositeArtRefs) ?? []
		deleted = try container.decode(.deleted)
		inLibrary = try container.decode(.inLibrary)
        tracks = try container.decodeIfPresent(.tracks) ?? []
	}
}

extension GMusicRadioStation: GMusicEntity {
    static var collectionRequestPath: GMusicRequestType = .radioStation
}

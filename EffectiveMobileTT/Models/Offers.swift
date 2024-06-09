//
//  Offers.swift
//  EffectiveMobileTT
//
//  Created by Nikolay Bocharnikov on 05.06.2024.
//

import Foundation

struct OffersResponse: Codable {
    let offers: [OfferResponse]
}

struct OfferResponse: Identifiable, Codable {
    let id: Int
    let title: String
    let town: String
    let price: Price
}

struct Offer: Identifiable, Codable {
    let id: Int
    let title: String
    let town: String
    let price: Price
    let image: String
}

//
//  TicketsOffers.swift
//  EffectiveMobileTT
//
//  Created by Nikolay Bocharnikov on 05.06.2024.
//

import Foundation

struct TicketsOffers: Codable {
    let tickets_offers: [TicketOffer]
}

struct TicketOffer: Identifiable, Codable {
    let id: Int
    let title: String
    let time_range: Array<String>
    let price: Price
}

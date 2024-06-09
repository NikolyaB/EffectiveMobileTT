//
//  Tickets.swift
//  EffectiveMobileTT
//
//  Created by Nikolay Bocharnikov on 05.06.2024.
//

import Foundation

struct Tickets: Codable {
    let tickets: [Ticket]
}

struct Ticket: Identifiable, Codable {
    
    let id: Int
    let badge: String?
    let price: Price
    let provider_name: String
    let company: String
    let departure: Departure
    let arrival: Arrival
    let has_transfer: Bool
    let has_visa_transfer: Bool
    let luggage: Luggage
    let hand_luggage: HandLuggage
    let is_returnable: Bool
    let is_exchangable: Bool
}

struct Departure: Codable {
    let town: String
    let date: String
    let airport: String
}

struct Arrival: Codable {
    let town: String
    let date: String
    let airport: String
}

struct Luggage: Codable {
    let has_luggage: Bool
    let price: Price?
}

struct HandLuggage: Codable {
    let has_hand_luggage: Bool
    let size: String?
}

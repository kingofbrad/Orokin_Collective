//
//  AlertsViewModel.swift
//  Orokin Collective
//
//  Created by Bradlee King on 19/03/2024.
//

import Foundation


class AlertsViewModel: ObservableObject {
    @Published var alerts: Alerts = []
    
    func fetchAlertsData() async throws {
        let request = URL(string: "\(APIPathEndPoint.endPoint)/\(APIPlayformPathEndPoint.pc)/\(APIPathEndPoint.alerts)")
        let(data, response) = try await URLSession.shared.data(from: request!)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invaildResponse
        }
        let alertsResponse = try JSONDecoder().decode(Alerts.self, from: data)
        alerts = alertsResponse
    }

}

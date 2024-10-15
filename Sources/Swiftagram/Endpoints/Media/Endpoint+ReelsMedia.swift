//
//  Endpoint+ReelsMedia.swift
//  Swiftagram
//
//  Created by Ne Spesha on 11/10/2024.
//

import Foundation

public extension Endpoint.Group {
    struct ReelsMedia { }
}

public extension Endpoint {
    static let reelsMedia: Endpoint.Group.ReelsMedia = .init()
}

public extension Endpoint.Group.ReelsMedia {
    /// Получает медиа по идентификаторам Reels.
    /// - Parameter ids: Массив идентификаторов Reels.
    func media(ids: [String]) -> Endpoint.Paginated<Swiftagram.Media.Collection, RankedOffset<String?, String?>, Error> {
        .init { secret, session, pages in
            // Создаем rank token, если он отсутствует.
            let rank = pages.rank ?? UUID().uuidString
            // Подготавливаем пагинатор.
            return Pager(pages) {
                Request.version1
                    .feed
                    .path(appending: "reels_media/")
                    .header(appending: secret.header)
                    .header(appending: rank, forKey: "rank_token")
                    .query(appending: ids.joined(separator: ","), forKey: "reel_ids")
                    .query(appending: $0, forKey: "max_id")
                    .query(appending: Count, forKey: "count")
                    .publish(with: session)
                    .map(\.data)
                    .wrap()
                    .map(Swiftagram.Media.Collection.init)
                    .iterateFirst(stoppingAt: $0)
            }
            .replaceFailingWithError()
        }
    }
}

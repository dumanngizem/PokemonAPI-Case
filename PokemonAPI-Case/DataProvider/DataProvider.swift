//
//  DataProvider.swift
//  PokemonAPI-Case
//
//  Created by Gizem Duman on 21.03.2023.
//

#if DEBUG
let apiDataProvider = APIDataProvider(interceptor: APIRequestInterceptor.shared,
                                      eventMonitors: [APILogger.shared])
#else
let apiDataProvider = APIDataProvider(interceptor: APIRequestInterceptor.shared,
                                      eventMonitors: [])
#endif

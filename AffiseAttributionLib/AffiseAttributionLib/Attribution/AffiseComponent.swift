//
//  AffiseComponent.swift
//  app
//
//  Created by Sergey Korney
//

import Foundation
import UIKit

internal class AffiseComponent: AffiseApi {
    
    private let app: UIApplication
    private let initProperties: AffiseInitProperties
    private let launchOptions: [UIApplication.LaunchOptionsKey: Any]?

    init(app: UIApplication,
         initProperties: AffiseInitProperties,
         launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        
        self.app = app;
        self.initProperties = initProperties;
        self.launchOptions = launchOptions;

//        sendGDPREventUseCase.sendForgetMeEvent()
        firstAppOpenUseCase.onAppCreated()
        webViewUseCase.initialize()
        setPropertiesWhenInitUseCase.initialize(initProperties: initProperties)
        sessionManager.initialize()
        eventsManager.initialize()
        advertisingIdManager.initialize()
//        oaidManager.init(app)
//        retrieveInstallReferrerUseCase.startInstallReferrerRetrieve()
        deeplinkManager.initialize(launchOptions: launchOptions)
//        autoCatchingClickProvider.init(initProperties.autoCatchingClickEvents)
//        metricsManager.setEnabledMetrics(initProperties.enabledMetrics)
    }
    
    lazy var bundle: Bundle = Bundle.main
    lazy var preferences: UserDefaults = UserDefaults.standard
    lazy var urlSession: URLSession = URLSession.shared
    lazy var fileManager: FileManager = FileManager.default
    lazy var notificationCenter: NotificationCenter = NotificationCenter.default

    lazy var firstAppOpenUseCase:FirstAppOpenUseCase = FirstAppOpenUseCase(preferences: preferences)
    lazy var webViewUseCase:WebViewUseCase = WebViewUseCase(preferences: preferences)
    lazy var appLifecycleEventsManager:AppLifecycleEventsManager = AppLifecycleEventsManagerImpl(notificationCenter: notificationCenter, logsManager: logsManager)
    lazy var logsManager:LogsManager = LogsManagerImpl(storeLogsUseCase: storeLogsUseCase)
    lazy var logsRepository:LogsRepository = LogsRepositoryImpl(converterToBase64: ConverterToBase64(),
                                                                converterToSerializedLog: LogToSerializedLogConverter(),
                                                                logsStorage: logsStorage)
    lazy var logsStorage:LogsStorage = LogsStorageImpl(fileManager: fileManager)
    
    lazy var eventsManager:EventsManager = EventsManager(sendDataToServerUseCase: sendDataToServerUseCase, appLifecycleEventsManager: appLifecycleEventsManager)
    lazy var eventsStorage:EventsStorage = EventsStorageImpl(logsManager: logsManager, fileManager: fileManager)
    lazy var eventsRepository:EventsRepository = EventsRepositoryImpl(converterToBase64: ConverterToBase64(),
                                                                      converterToSerializedEvent: EventToSerializedEventConverter(),
                                                                      logsManager: logsManager,
                                                                      eventsStorage: eventsStorage)
    lazy var internalEventsStorage:InternalEventsStorage = InternalEventsStorageImpl(logsManager: logsManager,       fileManager: fileManager)
    lazy var internalEventsRepository:InternalEventsRepository = InternalEventsRepositoryImpl(converterToBase64: ConverterToBase64(),
                                                                                              converterToSerializedEvent: InternalEventToSerializedEventConverter(),
                                                                                              logsManager: logsManager,
                                                                                              eventsStorage: internalEventsStorage)
    lazy var networkService:NetworkService = NetworkServiceImpl(urlSession: urlSession)
    lazy var cloudRepository:CloudRepository = CloudRepositoryImpl(networkService: networkService,
                                                                   userAgentProvider: postBackModelFactory.userAgentProvider,
                                                                   converter: PostBackModelToJsonStringConverter())
    lazy var sessionManager:SessionManager = SessionManagerImpl(preferences: preferences,
                                                                appLifecycleEventsManager: appLifecycleEventsManager,
                                                                internalEventUseCase: storeInternalEventUseCase)
    lazy var storeEventUseCase:StoreEventUseCase = StoreEventUseCaseImpl(repository: eventsRepository,
                                                                         eventsManager: eventsManager,
                                                                         preferencesUseCase: preferencesUseCase,
                                                                         appLifecycleEventsManager: appLifecycleEventsManager,
                                                                         logsManager: logsManager,
                                                                         isFirstForUserUseCase: isFirstForUserUseCase)
    lazy var storeInternalEventUseCase:StoreInternalEventUseCase = StoreInternalEventUseCaseImpl(repository: internalEventsRepository)
    lazy var storeLogsUseCase:StoreLogsUseCase = StoreLogsUseCaseImpl(repository: logsRepository)
    lazy var isFirstForUserStorage:IsFirstForUserStorage = IsFirstForUserStorageImpl(logsManager: logsManager, fileManager: fileManager)
    lazy var isFirstForUserUseCase:IsFirstForUserUseCase = IsFirstForUserUseCaseImpl(isFirstForUserStorage: isFirstForUserStorage)
    lazy var initPropertiesStorage: InitPropertiesStorage = InitPropertiesStorageImpl()
    lazy var setPropertiesWhenInitUseCase: SetPropertiesWhenAppInitializedUseCase = SetPropertiesWhenAppInitializedUseCaseImpl(storage: initPropertiesStorage)
    lazy var sendDataToServerUseCase: SendDataToServerUseCase = SendDataToServerUseCaseImpl(postBackModelFactory: postBackModelFactory,
                                                                                            cloudRepository: cloudRepository,
                                                                                            eventsRepository: eventsRepository,
                                                                                            internalEventsRepository: internalEventsRepository,
                                                                                            logsRepository: logsRepository,
                                                                                            logsManager: logsManager,
                                                                                            preferencesUseCase: preferencesUseCase)
    lazy var deeplinkClickRepository: DeeplinkClickRepository = DeeplinkClickRepositoryImpl()
    lazy var deeplinkManager: DeeplinkManager = DeeplinkManagerImpl(isDeeplinkRepository: deeplinkClickRepository,
                                                                    appLifecycleEventsManager: appLifecycleEventsManager)
    lazy var advertisingIdManager: AdvertisingIdManager = AdvertisingIdManagerImpl()
    lazy var webBridgeManager: WebBridgeManager = WebBridgeManager(storeEventUseCase: storeEventUseCase)
    lazy var preferencesUseCase: PreferencesUseCase = PreferencesUseCaseImpl(repository: ApplicationLifecyclePreferencesRepositoryImpl(),
                                                                             lifetimeRepository: ApplicationLifetimePreferencesRepositoryImpl(userDefaults: preferences))

    /**
     * PostBackModelFactory
     */
    lazy var postBackModelFactory: PostBackModelFactory = PropertiesProviderFactory(
        app: app,
        bundle: bundle,
        advertisingIdManager: advertisingIdManager,
        firstAppOpenUseCase: firstAppOpenUseCase,
        webViewUseCase: webViewUseCase,
        sessionManager: sessionManager,
        preferences: preferences,
        initPropertiesStorage: initPropertiesStorage,
        stringToSha256Converter: StringToSHA256Converter(),
        logsManager: logsManager,
        deeplinkClickRepository: deeplinkClickRepository
    ).create()
}

import YooKassaPaymentsApi

final class PaymentMethodHandlerServiceImpl {

    // MARK: - Init data

    private let supportedTypes: Set<PaymentMethodType>
    private let tokenizationSettings: TokenizationSettings

    // MARK: - Init

    init(
        tokenizationSettings: TokenizationSettings,
        supportedTypes: Set<PaymentMethodType>
    ) {
        self.tokenizationSettings = tokenizationSettings
        self.supportedTypes = supportedTypes
    }
}

// MARK: - PaymentMethodHandlerService

extension PaymentMethodHandlerServiceImpl: PaymentMethodHandlerService {
    func filterPaymentMethods(
        _ paymentMethods: [PaymentOption]
    ) -> [PaymentOption] {
        let handledSupportedTypes = supportedTypes
        let supportedPaymentMethods = paymentMethods.filter {
            handledSupportedTypes.contains($0.paymentMethodType.plain)
        }
        return supportedPaymentMethods
    }
}

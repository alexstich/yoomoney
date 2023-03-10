import YooKassaPaymentsApi

struct Shop {
    let options: [PaymentOption]
    let properties: ShopProperties

    var isSafeDeal: Bool { properties.isSafeDeal || properties.isMarketplace }

}

protocol PaymentService {
    func fetchPaymentOptions(
        clientApplicationKey: String,
        authorizationToken: String?,
        gatewayId: String?,
        amount: String?,
        currency: String?,
        getSavePaymentMethod: Bool?,
        customerId: String?,
        completion: @escaping (Result<Shop, Error>) -> Void
    )

    func fetchPaymentMethod(
        clientApplicationKey: String,
        paymentMethodId: String,
        completion: @escaping (Result<PaymentMethod, Error>) -> Void
    )

    func tokenizeBankCard(
        clientApplicationKey: String,
        bankCard: BankCard,
        confirmation: Confirmation,
        savePaymentMethod: Bool,
        amount: MonetaryAmount?,
        tmxSessionId: String,
        customerId: String?,
        savePaymentInstrument: Bool?,
        completion: @escaping (Result<Tokens, Error>) -> Void
    )

    func tokenizeWallet(
        clientApplicationKey: String,
        walletAuthorization: String,
        confirmation: Confirmation,
        savePaymentMethod: Bool,
        paymentMethodType: PaymentMethodType,
        amount: MonetaryAmount?,
        tmxSessionId: String,
        customerId: String?,
        completion: @escaping (Result<Tokens, Error>) -> Void
    )

    func tokenizeLinkedBankCard(
        clientApplicationKey: String,
        walletAuthorization: String,
        cardId: String,
        csc: String,
        confirmation: Confirmation,
        savePaymentMethod: Bool,
        paymentMethodType: PaymentMethodType,
        amount: MonetaryAmount?,
        tmxSessionId: String,
        customerId: String?,
        completion: @escaping (Result<Tokens, Error>) -> Void
    )

    func tokenizeSberbank(
        clientApplicationKey: String,
        phoneNumber: String,
        confirmation: Confirmation,
        savePaymentMethod: Bool,
        amount: MonetaryAmount?,
        tmxSessionId: String,
        customerId: String?,
        completion: @escaping (Result<Tokens, Error>) -> Void
    )

    func tokenizeSberpay(
        clientApplicationKey: String,
        confirmation: Confirmation,
        savePaymentMethod: Bool,
        amount: MonetaryAmount?,
        tmxSessionId: String,
        customerId: String?,
        completion: @escaping (Result<Tokens, Error>) -> Void
    )

    func tokenizeRepeatBankCard(
        clientApplicationKey: String,
        amount: MonetaryAmount,
        tmxSessionId: String,
        confirmation: Confirmation,
        savePaymentMethod: Bool,
        paymentMethodId: String,
        csc: String,
        completion: @escaping (Result<Tokens, Error>) -> Void
    )

    func tokenizeCardInstrument(
        clientApplicationKey: String,
        amount: MonetaryAmount,
        tmxSessionId: String,
        confirmation: Confirmation,
        savePaymentMethod: Bool,
        instrumentId: String,
        csc: String?,
        completion: @escaping (Result<Tokens, Error>) -> Void
    )

    func unbind(authToken: String, id: String, completion: @escaping (Result<Void, Error>) -> Void)
}

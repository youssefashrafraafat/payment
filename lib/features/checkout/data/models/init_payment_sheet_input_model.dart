class InitPaymentIntentInputModel{
final String paymentIntentClientSecret;
final String customerEphemeralKeySecret;
final String customerId;
  InitPaymentIntentInputModel({required this.customerId, required this.paymentIntentClientSecret, required this.customerEphemeralKeySecret});

  
}
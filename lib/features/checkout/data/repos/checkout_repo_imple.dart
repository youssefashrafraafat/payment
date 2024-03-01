import 'package:dartz/dartz.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/core/utls/errors/failures.dart';
import 'package:payment/core/utls/stripe_service.dart';
import 'package:payment/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment/features/checkout/data/repos/checkout_repo.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  StripeService stripeService = StripeService();
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      return right(null);
    } on StripeException catch (e) {
      return left(ServerFailure(
          errMessage: e.error.message ?? 'Oops there was an error'));
    } 
    catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}

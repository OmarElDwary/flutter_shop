import 'package:dartz/dartz.dart';
import 'package:ecommerce_shop/core/errors/errors.dart';

abstract class BaseUseCase<T> {
  Future<Either<T, AppError>> call();
}

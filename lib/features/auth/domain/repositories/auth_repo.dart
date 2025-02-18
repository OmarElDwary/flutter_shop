import 'package:dartz/dartz.dart';
import 'package:ecommerce_shop/core/errors/errors.dart';
import 'package:ecommerce_shop/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<AppError, UserEntity>> registerUser(
      String name, String email, String password);
  Future<Either<AppError, UserEntity>> loginUser(String email, String password);
  Future<Either<AppError, void>> logoutUser();
}

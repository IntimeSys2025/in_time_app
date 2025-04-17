import 'package:dartz/dartz.dart';

import '../error/failure.dart';

typedef Result<T> = Either<Failure, T>;
typedef FutureResult<T> = Future<Result<T>>;
typedef MapData = Map<String, dynamic>;

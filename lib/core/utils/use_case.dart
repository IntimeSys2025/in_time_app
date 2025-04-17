
import 'package:in_time_app/core/utils/type_def.dart';

abstract class UseCaseWithParams<T, Params> {
  FutureResult<T> call(Params params);
}

abstract class UseCaseWithoutParams<Type> {
  FutureResult<Type> call();
}

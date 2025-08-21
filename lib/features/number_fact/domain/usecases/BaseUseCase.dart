
abstract class BaseUseCase<T, P>{
  Future<T> execute([P? params]) ;
}

abstract class StreamUseCase<T, P> {
  Stream<T> execute([P? params]);
}
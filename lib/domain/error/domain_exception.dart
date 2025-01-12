import 'package:search_repositories_on_github/foundation/publications.dart';

class DomainException extends DefaultException {
  DomainException(
    super.message, {
    required this.type,
    this.option,
    super.cause,
  });
  final DomainExceptionType type;
  final Object? option;
}

enum DomainExceptionType {
  tooLongQuery('Maximum query length is 256 characters.'),
  emptyQuery('query is empty.'),
  // ignore: avoid_escaping_inner_quotes
  notMatchQuery('Search query doesn\'t match previous.'),
  dioException('Dio Exceptions.'),
  notModified('304: Not modified.'),
  validationFailed('422: Validation failed, or the endpoint has been spammed.'),
  apiServerError('503: Service unavailable.'),
  unknownException('unknown Exception.');

  const DomainExceptionType(this.message);
  final String message;
}

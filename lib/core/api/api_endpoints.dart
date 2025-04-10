// ignore_for_file: non_constant_identifier_names, constant_identifier_names

// base urls
import '../config.dart';

final BASE_URL = AppConfig.baseUrl;
final SANDBOX_URL = AppConfig.sandboxUrl;

const MAPS_URL = 'https://maps.googleapis.com/maps/api';

const LINKEDIN_URL = 'https://www.linkedin.com';
const LINKEDIN_ENDPOINT = 'https://api.linkedin.com';

class _AuthEndpoints {
  final createAccount = '$BASE_URL/auth/signup';
  final authorizationEndpoint = '$LINKEDIN_URL/oauth/v2/authorization';
  final tokenEndpoint = '$LINKEDIN_URL/oauth/v2/accessToken';
  final userEndpoint = '$LINKEDIN_ENDPOINT/v2/userinfo';
}

class _BillsEndpoints {
  final getBillers = '';
}

/// endpoints
final authEndpoints = _AuthEndpoints();
final billsEndpoints = _BillsEndpoints();

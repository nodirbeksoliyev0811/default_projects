import '../models/Prayer Info/prayer_info_model.dart';
import '../models/universal_response.dart';
import 'api_provider.dart';

class PrayerRepository {
  final ApiProvider apiProvider;

  PrayerRepository.prayerRepository({required this.apiProvider});

  Future<PrayerInfoModel?> fetchPrayerInfo(String region) async {
    UniversalResponse universalResponse = await apiProvider.getAllCurrencies(region);
    if (universalResponse.error.isEmpty) {
      return universalResponse.data ;
    }
    return null;
  }
}
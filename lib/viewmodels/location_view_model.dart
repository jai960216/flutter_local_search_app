import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/location.dart';
import '../repositories/location_repository.dart';

final locationRepositoryProvider = Provider<LocationRepository>((ref) {
  return LocationRepository();
});

final locationSearchProvider =
    StateNotifierProvider<LocationSearchNotifier, AsyncValue<List<Location>>>((
      ref,
    ) {
      final repository = ref.watch(locationRepositoryProvider);
      return LocationSearchNotifier(repository);
    });

class LocationSearchNotifier extends StateNotifier<AsyncValue<List<Location>>> {
  final LocationRepository _repository;

  LocationSearchNotifier(this._repository) : super(const AsyncValue.data([]));

  Future<void> searchLocation(String query) async {
    if (query.isEmpty) return;

    state = const AsyncValue.loading();
    try {
      final locations = await _repository.searchLocation(query);
      state = AsyncValue.data(locations);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAllSongsHash() => r'a06f06bef1b9213d7a6fb1458e5a4d32f0c45f7e';

/// See also [getAllSongs].
@ProviderFor(getAllSongs)
final getAllSongsProvider = AutoDisposeFutureProvider<List<SongModel>>.internal(
  getAllSongs,
  name: r'getAllSongsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getAllSongsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetAllSongsRef = AutoDisposeFutureProviderRef<List<SongModel>>;
String _$getAllFavSongsHash() => r'8b849d98d68111ee5886478449f81b5b8609cd58';

/// See also [getAllFavSongs].
@ProviderFor(getAllFavSongs)
final getAllFavSongsProvider =
    AutoDisposeFutureProvider<List<SongModel>>.internal(
  getAllFavSongs,
  name: r'getAllFavSongsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getAllFavSongsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetAllFavSongsRef = AutoDisposeFutureProviderRef<List<SongModel>>;
String _$homeViewModelHash() => r'3edbdc2983123907948a1324bd8a56ce4086d2c6';

/// See also [HomeViewModel].
@ProviderFor(HomeViewModel)
final homeViewModelProvider =
    AutoDisposeNotifierProvider<HomeViewModel, AsyncValue?>.internal(
  HomeViewModel.new,
  name: r'homeViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$homeViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HomeViewModel = AutoDisposeNotifier<AsyncValue?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

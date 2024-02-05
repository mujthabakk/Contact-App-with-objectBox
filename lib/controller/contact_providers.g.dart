// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$contactboxHash() => r'41c413313d22e562e46204c01f2c46e63a23cb7b';

/// See also [contactbox].
@ProviderFor(contactbox)
final contactboxProvider = AutoDisposeProvider<Box<ContactModel>>.internal(
  contactbox,
  name: r'contactboxProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$contactboxHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ContactboxRef = AutoDisposeProviderRef<Box<ContactModel>>;
String _$contactHash() => r'483d1cfeef03e19bb06658a0a1253b74e6437b6a';

/// See also [contact].
@ProviderFor(contact)
final contactProvider =
    AutoDisposeNotifierProvider<contact, List<ContactModel>>.internal(
  contact.new,
  name: r'contactProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$contactHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$contact = AutoDisposeNotifier<List<ContactModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

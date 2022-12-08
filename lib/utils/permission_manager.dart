library permission_manager.dart;

import 'package:permission_handler/permission_handler.dart';
import 'package:transcriber/utils/utils.dart';

enum PermissionRequestStatus { denied, granted, restricted, limited, permanent, none }

class PermissionManager {
  static Future<bool> openSettings() async => await openSettings();

  static Future<PermissionRequestStatus> requestLocation({bool? whenInUse, bool? always}) async {
    assert(whenInUse != null || always != null);
    assert((whenInUse != null && always == null) || (whenInUse == null && always != null));

    if (always!) {
      final status = await Permission.locationAlways.request();
      return status.value;
    } else {
      final status = await Permission.locationWhenInUse.request();
      return status.value;
    }
  }

  static Future<PermissionRequestStatus> appTrackingTransparency() async {
    final status = await Permission.appTrackingTransparency.request();
    return status.value;
  }

  // Requests permission to access device storage
  static Future<PermissionRequestStatus> storage() async {
    if (Utils.platform.isIOS) {
      final storageStatus = await Permission.storage.request();

      return await storageStatus.value.maybeWhen(
        granted: () async {
          final photoStatus = await Permission.photos.request();
          return photoStatus.value.maybeWhen(
            granted: () async {
              final status = await Permission.mediaLibrary.request();
              return status.value;
            },
            orElse: () async => photoStatus.value,
          );
        },
        orElse: () async => storageStatus.value,
      );
    } else if (Utils.platform.isAndroid) {
      final storageStatus = await Permission.storage.request();
      return storageStatus.value.maybeWhen(
        granted: () async {
          final status = await Permission.manageExternalStorage.request();
          return status.value;
        },
        orElse: () async => storageStatus.value,
      );
    }

    final status = await Permission.storage.request();
    return status.value;
  }

  static Future<PermissionRequestStatus> requestBluetooth() async {
    if (Utils.platform.isAndroid) {
      final status = await [
        Permission.locationWhenInUse,
        Permission.bluetoothScan,
        Permission.bluetoothAdvertise,
        Permission.bluetoothConnect,
        Permission.bluetooth,
      ].request();

      if (status[Permission.locationWhenInUse] == PermissionStatus.granted &&
          status[Permission.bluetoothScan] == PermissionStatus.granted &&
          status[Permission.bluetoothAdvertise] == PermissionStatus.granted &&
          status[Permission.bluetoothConnect] == PermissionStatus.granted &&
          status[Permission.bluetooth] == PermissionStatus.granted) {
        return PermissionRequestStatus.granted;
      } else {
        return PermissionRequestStatus.denied;
      }
    } else if (Utils.platform.isIOS) {
      final status = await [
        Permission.locationWhenInUse,
        Permission.bluetooth,
      ].request();
      if (status[Permission.locationWhenInUse] == PermissionStatus.granted && status[Permission.bluetooth] == PermissionStatus.granted) {
        return PermissionRequestStatus.granted;
      } else {
        return PermissionRequestStatus.denied;
      }
    } else {
      return PermissionRequestStatus.none;
    }
  }

  static Future<PermissionRequestStatus> requestAudio() async {
    final status = await [
      Permission.microphone,
      Permission.audio,
      Permission.storage,
      if (Utils.platform.isIOS) Permission.mediaLibrary,
    ].request();

    if (status[Permission.bluetoothScan] == PermissionStatus.granted &&
        status[Permission.bluetoothAdvertise] == PermissionStatus.granted &&
        status[Permission.bluetoothConnect] == PermissionStatus.granted &&
        status[Permission.bluetooth] == PermissionStatus.granted) {
      return PermissionRequestStatus.granted;
    } else {
      return PermissionRequestStatus.denied;
    }
  }
}

extension PermissionStatusXX on PermissionStatus {
  PermissionRequestStatus get value {
    switch (this) {
      case PermissionStatus.granted:
        return PermissionRequestStatus.granted;
      case PermissionStatus.limited:
        return PermissionRequestStatus.limited;
      case PermissionStatus.restricted:
        return PermissionRequestStatus.restricted;
      case PermissionStatus.permanentlyDenied:
        return PermissionRequestStatus.permanent;
      case PermissionStatus.denied:
        return PermissionRequestStatus.denied;
      default:
        return PermissionRequestStatus.none;
    }
  }
}

extension FuturePermissionStatusXX on Future<PermissionStatus> {
  Future<PermissionRequestStatus> get value async {
    switch (await this) {
      case PermissionStatus.granted:
        return PermissionRequestStatus.granted;
      case PermissionStatus.limited:
        return PermissionRequestStatus.limited;
      case PermissionStatus.restricted:
        return PermissionRequestStatus.restricted;
      case PermissionStatus.permanentlyDenied:
        return PermissionRequestStatus.permanent;
      case PermissionStatus.denied:
        return PermissionRequestStatus.denied;
      default:
        return PermissionRequestStatus.none;
    }
  }
}

extension PermissionStatusGetters on PermissionRequestStatus {
  bool get isDenied => this == PermissionRequestStatus.denied;

  bool get isGranted => this == PermissionRequestStatus.granted;

  bool get isRestricted => this == PermissionRequestStatus.restricted;

  bool get isPermanentlyDenied => this == PermissionRequestStatus.permanent;

  bool get isLimited => this == PermissionRequestStatus.limited;

  T maybeWhen<T>({
    T Function()? denied,
    T Function()? granted,
    T Function()? restricted,
    T Function()? permanent,
    T Function()? limited,
    required T Function() orElse,
  }) {
    switch (this) {
      case PermissionRequestStatus.granted:
        return granted != null ? granted() : orElse();
      case PermissionRequestStatus.restricted:
        return restricted != null ? restricted() : orElse();
      case PermissionRequestStatus.permanent:
        return permanent != null ? permanent() : orElse();
      case PermissionRequestStatus.limited:
        return limited != null ? limited() : orElse();
      case PermissionRequestStatus.denied:
        return denied != null ? denied() : orElse();
      case PermissionRequestStatus.none:
      default:
        return orElse();
    }
  }
}

extension FuturePermissionStatusGetters on Future<PermissionRequestStatus> {
  Future<bool> get isGranted async => (await this).isGranted;

  Future<bool> get isDenied async => (await this).isDenied;

  Future<bool> get isRestricted async => (await this).isRestricted;

  Future<bool> get isPermanentlyDenied async => (await this).isPermanentlyDenied;

  Future<bool> get isLimited async => (await this).isLimited;
}

import 'dart:async';

import 'package:image_picker/image_picker.dart';
import 'package:packntrack_multivendor_restaurant/features/profile/domain/models/profile_model.dart';
import 'package:packntrack_multivendor_restaurant/interface/repository_interface.dart';

abstract class ProfileRepositoryInterface implements RepositoryInterface {
  Future<dynamic> getProfileInfo();
  void setNotificationActive(bool isActive);
  bool isNotificationActive();
  String getUserToken();
  Future<bool> updateProfile(
      ProfileModel userInfoModel, XFile? data, String token);
}

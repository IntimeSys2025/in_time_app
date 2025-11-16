import 'dart:io';

import 'package:dio/dio.dart';

class UploadProfilePicParams {
  final FormData? profilePicture;

  UploadProfilePicParams({
    this.profilePicture,
  });

  Map<String, dynamic> toJson() {
    return {
      'image': profilePicture,
    };
  }
}
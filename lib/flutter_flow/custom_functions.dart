import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';

List<LatLng>? getLatLngList(
  List<double>? lats,
  List<double>? lngs,
) {
  if (lats == null || lngs == null || lats.length != lngs.length) {
    return null;
  }

  List<LatLng> result = [];
  for (int i = 0; i < lats.length; i++) {
    result.add(LatLng(lats[i], lngs[i]));
  }

  return result;
}

LatLng? getSingleLatLng(
  String? lat,
  String? lng,
) {
  if (lat == null || lng == null) {
    return null;
  }
  final double latitude = double.tryParse(lat) ?? 0.0;
  final double longitude = double.tryParse(lng) ?? 0.0;

  return LatLng(latitude, longitude);
}

String? canaidanPhoneNumberFormat(String? phoneNumber) {
  if (phoneNumber == null || phoneNumber.isEmpty) {
    return '';
  }
  String formattedPhoneNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');

  if (formattedPhoneNumber.length >= 10) {
    formattedPhoneNumber =
        '(${formattedPhoneNumber.substring(0, 3)}) ${formattedPhoneNumber.substring(3, 6)} - ${formattedPhoneNumber.substring(6, 10)}';
  }

  return formattedPhoneNumber;
}

String? getLocatioName(
  List<dynamic> jsonResult,
  LatLng selectedMarker,
) {
  double lat = selectedMarker.latitude;
  double lng = selectedMarker.longitude;

  for (var result in jsonResult) {
    if (result['latitude'] == lat && result['longitude'] == lng) {
      return '${result['orgName']}';
    }
  }
  return 'Not Found';
}

String? getLocationAddress(
  List<dynamic> jsonResult,
  LatLng selectedMarker,
) {
  double lat = selectedMarker.latitude;
  double lng = selectedMarker.longitude;

  for (var result in jsonResult) {
    if (result['latitude'] == lat && result['longitude'] == lng) {
      return '${result['address']}';
    }
  }
  return 'Not Found';
}

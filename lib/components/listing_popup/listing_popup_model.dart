import '/backend/api_requests/api_calls.dart';
import '/components/listing_popup/listing_popup_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'listing_popup_widget.dart' show ListingPopupWidget;
import 'package:flutter/material.dart';

class ListingPopupModel extends FlutterFlowModel<ListingPopupWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (GetProgramById)] action in Text widget.
  ApiCallResponse? programResponse;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}

import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'location_details_popup_model.dart';
export 'location_details_popup_model.dart';

class LocationDetailsPopupWidget extends StatefulWidget {
  const LocationDetailsPopupWidget({
    super.key,
    String? locationName,
    String? locationAddress,
  })  : locationName = locationName ?? 'localtionName',
        locationAddress = locationAddress ?? 'locationAddress';

  final String locationName;
  final String locationAddress;

  @override
  State<LocationDetailsPopupWidget> createState() =>
      _LocationDetailsPopupWidgetState();
}

class _LocationDetailsPopupWidgetState extends State<LocationDetailsPopupWidget>
    with TickerProviderStateMixin {
  late LocationDetailsPopupModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 100.ms,
          begin: const Offset(300.0, -100.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LocationDetailsPopupModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: const AlignmentDirectional(0.75, 0.0),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 0.181,
            height: MediaQuery.sizeOf(context).height * 0.083,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 4.0,
                  color: Color(0x33000000),
                  offset: Offset(0.0, 10.0),
                  spreadRadius: 5.0,
                )
              ],
              borderRadius: BorderRadius.circular(10.0),
            ),
            alignment: const AlignmentDirectional(-1.0, -1.0),
            child: Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(-0.95, -0.72),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      widget.locationName.maybeHandleOverflow(
                        maxChars: 75,
                        replacement: '…',
                      ),
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Lato',
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-0.95, 1.4),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      widget.locationAddress.maybeHandleOverflow(
                        maxChars: 100,
                        replacement: '…',
                      ),
                      maxLines: 2,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Lato',
                            fontSize: 10.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(1.03, -0.96),
                  child: FlutterFlowIconButton(
                    borderRadius: 20.0,
                    borderWidth: 0.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.close,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 20.0,
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
        ),
      ],
    );
  }
}

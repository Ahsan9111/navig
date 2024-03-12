import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'empty_result_item_model.dart';
export 'empty_result_item_model.dart';

class EmptyResultItemWidget extends StatefulWidget {
  const EmptyResultItemWidget({
    super.key,
    this.parameter1,
    this.name,
    this.orgName,
    String? address,
  }) : address = address ?? 'address';

  final String? parameter1;
  final String? name;
  final String? orgName;
  final String address;

  @override
  State<EmptyResultItemWidget> createState() => _EmptyResultItemWidgetState();
}

class _EmptyResultItemWidgetState extends State<EmptyResultItemWidget> {
  late EmptyResultItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyResultItemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                blurRadius: 0.0,
                color: Color(0xFFF5FBFB),
                offset: Offset(0.0, 1.0),
              )
            ],
            borderRadius: BorderRadius.circular(0.0),
            border: Border.all(
              color: const Color(0xFFCBCBCB),
              width: 1.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 16.0, 12.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 12.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'pjra8nwf' /* No results found */,
                          ),
                          style: FlutterFlowTheme.of(context).headlineMedium,
                        ),
                      ].divide(const SizedBox(height: 4.0)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

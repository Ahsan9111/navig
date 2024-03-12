import '/backend/api_requests/api_calls.dart';
import '/components/listing_popup/listing_popup_widget.dart';
import '/components/location_details_popup/location_details_popup_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'categorylistpage_model.dart';
export 'categorylistpage_model.dart';

class CategorylistpageWidget extends StatefulWidget {
  const CategorylistpageWidget({
    super.key,
    this.name,
    this.address,
    this.progName,
    this.shortDesc,
    this.categoryId,
    this.hours,
  });

  final String? name;
  final String? address;
  final String? progName;
  final String? shortDesc;
  final int? categoryId;
  final String? hours;

  @override
  State<CategorylistpageWidget> createState() => _CategorylistpageWidgetState();
}

class _CategorylistpageWidgetState extends State<CategorylistpageWidget> {
  late CategorylistpageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategorylistpageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: GetOrgsInLocalityAndCategoryCall.call(
        catId: widget.categoryId,
        locality: FFAppState().selectedLocality.csdsString,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: const ListingPopupWidget(),
          );
        }
        final categorylistpageGetOrgsInLocalityAndCategoryResponse =
            snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            resizeToAvoidBottomInset: false,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(88.0),
              child: AppBar(
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                automaticallyImplyLeading: true,
                actions: const [],
                flexibleSpace: FlexibleSpaceBar(
                  title: Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed('HomePage');
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/images/NAVIGI_HS_Powered_Logo-06.png',
                                        width: 210.0,
                                        height: 66.0,
                                        fit: BoxFit.cover,
                                        alignment: const Alignment(0.0, 0.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(const SizedBox(width: 8.0)),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(1.0, 1.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 72.0, 8.0),
                          child: Container(
                            width: 229.0,
                            height: 43.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color: Color(0x33000000),
                                  offset: Offset(0.0, 2.0),
                                )
                              ],
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(50.0),
                                bottomRight: Radius.circular(50.0),
                                topLeft: Radius.circular(50.0),
                                topRight: Radius.circular(50.0),
                              ),
                              shape: BoxShape.rectangle,
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 10.0, 0.0),
                              child: TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textController',
                                  const Duration(milliseconds: 2000),
                                  () => setState(() {}),
                                ),
                                onFieldSubmitted: (_) async {
                                  _model.resultSearch1 = await SearchCall.call(
                                    name: _model.textController.text,
                                    geoCode: FFAppState()
                                        .selectedLocality
                                        .csdsString,
                                  );
                                  setState(() {
                                    FFAppState().search1active = true;
                                  });

                                  setState(() {});
                                },
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    'gmhq8wbw' /* Search... */,
                                  ),
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Lato',
                                        color: const Color(0xFF959C9F),
                                      ),
                                  hintStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  suffixIcon:
                                      _model.textController!.text.isNotEmpty
                                          ? InkWell(
                                              onTap: () async {
                                                _model.textController?.clear();
                                                setState(() {});
                                              },
                                              child: const Icon(
                                                Icons.clear,
                                                size: 15.0,
                                              ),
                                            )
                                          : null,
                                ),
                                style: FlutterFlowTheme.of(context).bodyLarge,
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: 260.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const Icon(
                                Icons.location_pin,
                                color: Color(0xFF00363A),
                                size: 32.0,
                              ),
                              FlutterFlowDropDown<int>(
                                controller: _model.dropDownValueController2 ??=
                                    FormFieldController<int>(
                                  _model.dropDownValue2 ??=
                                      FFAppState().selectedLocality.id,
                                ),
                                options: List<int>.from(FFAppState()
                                    .locations
                                    .map((e) => e.id)
                                    .toList()),
                                optionLabels: FFAppState()
                                    .locations
                                    .map((e) => e.name)
                                    .toList(),
                                onChanged: (val) async {
                                  setState(() => _model.dropDownValue2 =
                                      val); // update selectedLocation
                                  FFAppState().update(() {
                                    FFAppState().selectedLocality = FFAppState()
                                        .locations[_model.dropDownValue2!];
                                  });
                                  await _model.googleMapsController.future.then(
                                    (c) => c.animateCamera(
                                      CameraUpdate.newLatLng(FFAppState()
                                          .selectedLocality
                                          .centerLatLng!
                                          .toGoogleMaps()),
                                    ),
                                  );
                                },
                                width: 208.0,
                                height: 50.0,
                                textStyle:
                                    FlutterFlowTheme.of(context).bodyLarge,
                                hintText: FFLocalizations.of(context).getText(
                                  'pw0ath6g' /* Choose location */,
                                ),
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2.0,
                                borderColor: Colors.transparent,
                                borderWidth: 0.0,
                                borderRadius: 8.0,
                                margin: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 16.0, 4.0),
                                isOverButton: true,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),
                            ].divide(const SizedBox(width: 8.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  centerTitle: true,
                  expandedTitleScale: 1.0,
                ),
                toolbarHeight: 80.0,
                elevation: 4.0,
              ),
            ),
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height * 0.15,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 28.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.safePop();
                                          },
                                          child: Icon(
                                            Icons.arrow_back_ios_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .outline,
                                            size: 36.0,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            widget.name,
                                            'Food',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .headlineLarge,
                                        ),
                                      ),
                                    ]
                                        .divide(const SizedBox(width: 564.0))
                                        .addToStart(const SizedBox(width: 32.0)),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(1.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          32.0, 0.0, 24.0, 0.0),
                                      child: Text(
                                        'Results for ${widget.name}',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge,
                                      ),
                                    ),
                                  ),
                                  if (false)
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 24.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          FlutterFlowDropDown<String>(
                                            multiSelectController: _model
                                                    .dropDownValueController1 ??=
                                                FormFieldController<
                                                    List<String>>(null),
                                            options: [
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '3yvqdqzl' /* None */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'hi1kxt65' /* Youth */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'k1e1cpda' /* Older Adults */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '2rlacu2e' /* 2SLGBTQIA+ */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'yddk779r' /* Indigenous */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'gt26e44c' /* Immigrants/Refugees */,
                                              )
                                            ],
                                            width: 165.0,
                                            height: 35.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmall,
                                            hintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'rn5e540m' /* Population Focus */,
                                            ),
                                            icon: Icon(
                                              Icons.filter_list,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 20.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 2.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .outline,
                                            borderWidth: 1.0,
                                            borderRadius: 8.0,
                                            margin:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 4.0, 16.0, 4.0),
                                            hidesUnderline: true,
                                            isOverButton: true,
                                            isSearchable: false,
                                            isMultiSelect: true,
                                            onMultiSelectChanged: (val) async {
                                              setState(() =>
                                                  _model.dropDownValue1 = val);
                                              setState(() {
                                                _model.dropDownValueController1
                                                    ?.value = [];
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ].divide(const SizedBox(height: 20.0)),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Wrap(
                            spacing: 0.0,
                            runSpacing: 0.0,
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            direction: Axis.horizontal,
                            runAlignment: WrapAlignment.start,
                            verticalDirection: VerticalDirection.down,
                            clipBehavior: Clip.none,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 12.0, 12.0, 0.0),
                                child: Container(
                                  width: 50.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.7,
                                  constraints: const BoxConstraints(
                                    minWidth: 280.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Builder(
                                    builder: (context) {
                                      final resultsList =
                                          GetOrgsInLocalityAndCategoryCall
                                                  .categoryListItem(
                                                categorylistpageGetOrgsInLocalityAndCategoryResponse
                                                    .jsonBody,
                                              )?.toList() ??
                                              [];
                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: resultsList.length,
                                        itemBuilder:
                                            (context, resultsListIndex) {
                                          final resultsListItem =
                                              resultsList[resultsListIndex];
                                          return Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 1.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                var shouldSetState = false;
                                                setState(() {
                                                  FFAppState().isOrg =
                                                      getJsonField(
                                                            resultsListItem,
                                                            r'''$.orgName''',
                                                          ) !=
                                                          null;
                                                  FFAppState().listingId =
                                                      getJsonField(
                                                    resultsListItem,
                                                    r'''$.uuid''',
                                                  ).toString();
                                                });
                                                if (FFAppState().isOrg) {
                                                  _model.organizationResponse =
                                                      await NavigiServiceGroup
                                                          .getOrganizationByIdCall
                                                          .call(
                                                    orgId:
                                                        FFAppState().listingId,
                                                  );
                                                  shouldSetState = true;
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    enableDrag: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () => _model
                                                                .unfocusNode
                                                                .canRequestFocus
                                                            ? FocusScope.of(
                                                                    context)
                                                                .requestFocus(_model
                                                                    .unfocusNode)
                                                            : FocusScope.of(
                                                                    context)
                                                                .unfocus(),
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              ListingPopupWidget(
                                                            contactPhone:
                                                                getJsonField(
                                                              (_model.organizationResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$[:].contactPhone''',
                                                            ).toString(),
                                                            contactEmail:
                                                                getJsonField(
                                                              (_model.organizationResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$[:].contactEmail''',
                                                            ).toString(),
                                                            websiteUrl:
                                                                getJsonField(
                                                              (_model.organizationResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$[:].websiteUrl''',
                                                            ).toString(),
                                                            hours: getJsonField(
                                                              (_model.organizationResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$[:].daysTime''',
                                                            ).toString(),
                                                            address:
                                                                getJsonField(
                                                              (_model.organizationResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$[:].address''',
                                                            ).toString(),
                                                            description:
                                                                getJsonField(
                                                              (_model.organizationResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$[:].aboutUs''',
                                                            ).toString(),
                                                            listingName:
                                                                getJsonField(
                                                              (_model.organizationResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$[:].orgName''',
                                                            ).toString(),
                                                            childListings:
                                                                getJsonField(
                                                              (_model.organizationResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$[:].programs''',
                                                              true,
                                                            ),
                                                            latitude:
                                                                getJsonField(
                                                              (_model.organizationResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$[:].latitude''',
                                                            ).toString(),
                                                            longitude:
                                                                getJsonField(
                                                              (_model.organizationResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$[:].longitude''',
                                                            ).toString(),
                                                            isOrganization:
                                                                true,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));

                                                  if (shouldSetState) {
                                                    setState(() {});
                                                  }
                                                  return;
                                                } else {
                                                  _model.programResponse =
                                                      await NavigiServiceGroup
                                                          .getProgramByIdCall
                                                          .call(
                                                    progId:
                                                        FFAppState().listingId,
                                                  );
                                                  shouldSetState = true;
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    enableDrag: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () => _model
                                                                .unfocusNode
                                                                .canRequestFocus
                                                            ? FocusScope.of(
                                                                    context)
                                                                .requestFocus(_model
                                                                    .unfocusNode)
                                                            : FocusScope.of(
                                                                    context)
                                                                .unfocus(),
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              ListingPopupWidget(
                                                            address:
                                                                getJsonField(
                                                              (_model.programResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$[:].address''',
                                                            ).toString(),
                                                            contactPhone:
                                                                getJsonField(
                                                              (_model.programResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$[:].contactPhone''',
                                                            ).toString(),
                                                            contactEmail:
                                                                getJsonField(
                                                              (_model.programResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$[:].contactEmail''',
                                                            ).toString(),
                                                            hours: getJsonField(
                                                              (_model.programResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$[:].daysTime''',
                                                            ).toString(),
                                                            description:
                                                                getJsonField(
                                                              (_model.programResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$[:].aboutUs''',
                                                            ).toString(),
                                                            listingName:
                                                                getJsonField(
                                                              (_model.programResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$[:].progName''',
                                                            ).toString(),
                                                            childListings:
                                                                getJsonField(
                                                              (_model.programResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$[:].organizations''',
                                                              true,
                                                            ),
                                                            latitude:
                                                                getJsonField(
                                                              (_model.programResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$[:].latitude''',
                                                            ).toString(),
                                                            longitude:
                                                                getJsonField(
                                                              (_model.programResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$[:].longitude''',
                                                            ).toString(),
                                                            websiteUrl:
                                                                getJsonField(
                                                              (_model.programResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$[:].websiteUrl''',
                                                            ).toString(),
                                                            isOrganization:
                                                                false,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));

                                                  if (shouldSetState) {
                                                    setState(() {});
                                                  }
                                                  return;
                                                }

                                                if (shouldSetState) {
                                                  setState(() {});
                                                }
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: 152.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 1.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      offset: const Offset(0.0, 1.0),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  border: Border.all(
                                                    color: const Color(0xFFF9F8F8),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 8.0, 12.0, 8.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                getJsonField(
                                                                  resultsListItem,
                                                                  r'''$.orgName''',
                                                                ).toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lato',
                                                                      color: const Color(
                                                                          0xFF14181B),
                                                                      fontSize:
                                                                          16.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  getJsonField(
                                                                            resultsListItem,
                                                                            r'''$.orgName''',
                                                                          ) !=
                                                                          null
                                                                      ? 'Organization'
                                                                      : 'Program',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall,
                                                                ),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .place_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 20.0,
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        getJsonField(
                                                                          resultsListItem,
                                                                          r'''$.address''',
                                                                        ).toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: 'Lato',
                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                              fontSize: 14.0,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ].divide(const SizedBox(
                                                                    width:
                                                                        4.0)),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  FaIcon(
                                                                    FontAwesomeIcons
                                                                        .globe,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 16.0,
                                                                  ),
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      await launchURL(
                                                                          getJsonField(
                                                                        resultsListItem,
                                                                        r'''$.websiteUrl''',
                                                                      ).toString());
                                                                    },
                                                                    child: Text(
                                                                      getJsonField(
                                                                        resultsListItem,
                                                                        r'''$.websiteUrl''',
                                                                      )
                                                                          .toString()
                                                                          .maybeHandleOverflow(
                                                                            maxChars:
                                                                                40,
                                                                            replacement:
                                                                                '…',
                                                                          ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lato',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiary,
                                                                            fontSize:
                                                                                14.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ].divide(const SizedBox(
                                                                    width:
                                                                        4.0)),
                                                              ),
                                                            ].divide(const SizedBox(
                                                                height: 4.0)),
                                                          ),
                                                        ),
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          FlutterFlowIconButton(
                                                            borderColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .outline,
                                                            borderRadius: 20.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 40.0,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            icon: Icon(
                                                              Icons
                                                                  .directions_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 24.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              await launchURL(
                                                                  'https://www.google.com/maps/dir/?api=1&destination=${getJsonField(
                                                                resultsListItem,
                                                                r'''$.latitude''',
                                                              ).toString()},${getJsonField(
                                                                resultsListItem,
                                                                r'''$.longitude''',
                                                              ).toString()}');
                                                            },
                                                          ),
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'kuhadl0v' /* Directions */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Lato',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      12.0,
                                                                ),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            height: 4.0)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.4,
                                height: MediaQuery.sizeOf(context).height * 0.7,
                                constraints: const BoxConstraints(
                                  minWidth: 280.0,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: FlutterFlowGoogleMap(
                                  controller: _model.googleMapsController,
                                  onCameraIdle: (latLng) => setState(
                                      () => _model.googleMapsCenter = latLng),
                                  initialLocation: _model.googleMapsCenter ??=
                                      FFAppState()
                                          .locations[_model.dropDownValue2!]
                                          .centerLatLng!,
                                  markers: (functions.getLatLngList(
                                              GetOrgsInLocalityAndCategoryCall
                                                  .lats(
                                                categorylistpageGetOrgsInLocalityAndCategoryResponse
                                                    .jsonBody,
                                              )?.toList(),
                                              GetOrgsInLocalityAndCategoryCall
                                                  .longs(
                                                categorylistpageGetOrgsInLocalityAndCategoryResponse
                                                    .jsonBody,
                                              )?.toList()) ??
                                          [])
                                      .map(
                                        (marker) => FlutterFlowMarker(
                                          marker.serialize(),
                                          marker,
                                          () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child:
                                                        LocationDetailsPopupWidget(
                                                      locationName: functions
                                                          .getLocatioName(
                                                              GetOrgsInLocalityAndCategoryCall
                                                                      .categoryListItem(
                                                                categorylistpageGetOrgsInLocalityAndCategoryResponse
                                                                    .jsonBody,
                                                              )!
                                                                  .toList(),
                                                              _model
                                                                  .googleMapsCenter!)!,
                                                      locationAddress: functions
                                                          .getLocationAddress(
                                                              GetOrgsInLocalityAndCategoryCall
                                                                      .categoryListItem(
                                                                categorylistpageGetOrgsInLocalityAndCategoryResponse
                                                                    .jsonBody,
                                                              )!
                                                                  .toList(),
                                                              _model
                                                                  .googleMapsCenter!)!,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                        ),
                                      )
                                      .toList(),
                                  markerColor: GoogleMarkerColor.blue,
                                  mapType: MapType.normal,
                                  style: GoogleMapStyle.standard,
                                  initialZoom: 10.0,
                                  allowInteraction: true,
                                  allowZoom: true,
                                  showZoomControls: true,
                                  showLocation: false,
                                  showCompass: true,
                                  showMapToolbar: false,
                                  showTraffic: false,
                                  centerMapOnMarkerTap: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (FFAppState().search1active == true)
                    Align(
                      alignment: const AlignmentDirectional(0.9, -1.0),
                      child: Container(
                        width: 250.0,
                        height: 205.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(2.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20.0),
                                  bottomRight: Radius.circular(20.0),
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 30.0, 0.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final resultOrgs1 =
                                        SearchCall.organizations(
                                              (_model.resultSearch1?.jsonBody ??
                                                  ''),
                                            )?.toList() ??
                                            [];
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.vertical,
                                      itemCount: resultOrgs1.length,
                                      itemBuilder: (context, resultOrgs1Index) {
                                        final resultOrgs1Item =
                                            resultOrgs1[resultOrgs1Index];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            setState(() {
                                              FFAppState().isOrg = true;
                                              FFAppState().listingId =
                                                  FFAppState().listingId;
                                            });
                                            if (FFAppState().isOrg) {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                enableDrag: false,
                                                context: context,
                                                builder: (context) {
                                                  return GestureDetector(
                                                    onTap: () => _model
                                                            .unfocusNode
                                                            .canRequestFocus
                                                        ? FocusScope.of(context)
                                                            .requestFocus(_model
                                                                .unfocusNode)
                                                        : FocusScope.of(context)
                                                            .unfocus(),
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child: ListingPopupWidget(
                                                        address: getJsonField(
                                                          resultOrgs1Item,
                                                          r'''$.address''',
                                                        ).toString(),
                                                        contactPhone:
                                                            getJsonField(
                                                          resultOrgs1Item,
                                                          r'''$.contactPhone''',
                                                        ).toString(),
                                                        contactEmail:
                                                            getJsonField(
                                                          resultOrgs1Item,
                                                          r'''$.contactEmail''',
                                                        ).toString(),
                                                        websiteUrl:
                                                            getJsonField(
                                                          resultOrgs1Item,
                                                          r'''$.websiteUrl''',
                                                        ).toString(),
                                                        hours: getJsonField(
                                                          resultOrgs1Item,
                                                          r'''$.daysTime''',
                                                        ).toString(),
                                                        description:
                                                            getJsonField(
                                                          resultOrgs1Item,
                                                          r'''$.aboutUs''',
                                                        ).toString(),
                                                        listingName:
                                                            getJsonField(
                                                          resultOrgs1Item,
                                                          r'''$.orgName''',
                                                        ).toString(),
                                                        isOrganization: true,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));
                                            }
                                          },
                                          child: Container(
                                            width: 100.0,
                                            height: 58.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              boxShadow: const [
                                                BoxShadow(
                                                  blurRadius: 4.0,
                                                  color: Color(0x33000000),
                                                  offset: Offset(0.0, 2.0),
                                                )
                                              ],
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                bottomRight:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(0.0),
                                                topRight: Radius.circular(0.0),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 20.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  AutoSizeText(
                                                    getJsonField(
                                                      resultOrgs1Item,
                                                      r'''$.orgName''',
                                                    )
                                                        .toString()
                                                        .maybeHandleOverflow(
                                                          maxChars: 25,
                                                          replacement: '…',
                                                        ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(1.0, -1.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    setState(() {
                                      FFAppState().search1active = false;
                                    });
                                  },
                                  child: Icon(
                                    Icons.close,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

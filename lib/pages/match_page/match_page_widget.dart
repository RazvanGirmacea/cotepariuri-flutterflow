import '/backend/api_requests/api_calls.dart';
import '/components/footer_widget.dart';
import '/components/loading_widget.dart';
import '/components/navbar_widget.dart';
import '/components/neterror_widget.dart';
import '/components/stats_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'match_page_model.dart';
export 'match_page_model.dart';

class MatchPageWidget extends StatefulWidget {
  const MatchPageWidget({
    super.key,
    required this.matchSeries,
    required this.id,
    required this.odd,
  });

  final String? matchSeries;
  final int? id;
  final dynamic odd;

  @override
  State<MatchPageWidget> createState() => _MatchPageWidgetState();
}

class _MatchPageWidgetState extends State<MatchPageWidget>
    with TickerProviderStateMixin {
  late MatchPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MatchPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apMatch = await MatchAPICall.call(
        series: widget.matchSeries,
        matchId: widget.id,
        language: FFLocalizations.of(context).languageCode,
      );
      if ((_model.apMatch?.succeeded ?? true)) {
        setState(() {
          FFAppState().matchData = (_model.apMatch?.jsonBody ?? '');
        });
        setState(() {
          _model.loading = false;
          _model.stateChange = functions.statschange(getJsonField(
            FFAppState().matchData,
            r'''$.stats''',
          ).toString().toString());
        });
      } else {
        setState(() {
          _model.netStatus = false;
        });
      }
    });

    animationsMap.addAll({
      'iconOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            begin: 0.0,
            end: 2.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 1000.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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

    return Title(
        title: 'MatchPage',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Color(0xFF1D242F),
            floatingActionButton: Opacity(
              opacity: 0.4,
              child: FloatingActionButton(
                onPressed: () async {
                  await _model.matchsection?.animateTo(
                    0,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                },
                backgroundColor: Color(0xFFE0E3E7),
                elevation: 8.0,
                child: Icon(
                  Icons.keyboard_double_arrow_up,
                  color: Colors.black,
                  size: 36.0,
                ),
              ),
            ),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(65.0),
              child: AppBar(
                backgroundColor: Color(0xFF1D242F),
                automaticallyImplyLeading: false,
                title: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.safePop();
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 24.0,
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('HomePage');
                          },
                          child: Image.asset(
                            'assets/images/cropped-logo-darkx300-compressor.png',
                            width: 280.0,
                            height: 56.0,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        HapticFeedback.lightImpact();
                        setState(() {
                          _model.loading = true;
                          _model.netStatus = true;
                        });
                        if (animationsMap['iconOnActionTriggerAnimation'] !=
                            null) {
                          animationsMap['iconOnActionTriggerAnimation']!
                              .controller
                              .forward(from: 0.0);
                        }
                        _model.apMatchCopy = await MatchAPICall.call(
                          series: widget.matchSeries,
                          matchId: widget.id,
                          language: FFLocalizations.of(context).languageCode,
                        );
                        if ((_model.apMatch?.succeeded ?? true)) {
                          setState(() {
                            FFAppState().matchData =
                                (_model.apMatch?.jsonBody ?? '');
                          });
                          setState(() {
                            _model.loading = false;
                            _model.stateChange =
                                functions.statschange(getJsonField(
                              FFAppState().matchData,
                              r'''$.stats''',
                            ).toString());
                          });
                        } else {
                          setState(() {
                            _model.netStatus = false;
                          });
                        }

                        setState(() {});
                      },
                      child: Icon(
                        FFIcons.kspin3,
                        color: Colors.white,
                        size: 25.0,
                      ),
                    ).animateOnActionTrigger(
                      animationsMap['iconOnActionTriggerAnimation']!,
                    ),
                  ].divide(SizedBox(width: 10.0)),
                ),
                actions: [],
                centerTitle: false,
                toolbarHeight: 63.0,
                elevation: 2.0,
              ),
            ),
            body: SafeArea(
              top: true,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF1D242F),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEBEBEB),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Stack(
                                  children: [
                                    if (!_model.loading && _model.netStatus)
                                      Padding(
                                        padding: EdgeInsets.all(20.0),
                                        child: SingleChildScrollView(
                                          controller: _model.matchsection,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              if (getJsonField(
                                                    FFAppState().matchData,
                                                    r'''$.game_videos[0]''',
                                                  ) !=
                                                  null)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 20.0),
                                                  child: FlutterFlowVideoPlayer(
                                                    path: getJsonField(
                                                      FFAppState().matchData,
                                                      r'''$.game_videos[0]''',
                                                    ).toString(),
                                                    videoType:
                                                        VideoType.network,
                                                    autoPlay: true,
                                                    looping: false,
                                                    showControls: true,
                                                    allowFullScreen: true,
                                                    allowPlaybackSpeedMenu:
                                                        false,
                                                  ),
                                                ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Flexible(
                                                    child: RichText(
                                                      textScaler:
                                                          MediaQuery.of(context)
                                                              .textScaler,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: getJsonField(
                                                              FFAppState()
                                                                  .matchData,
                                                              r'''$.home_team.name''',
                                                            ).toString(),
                                                            style: TextStyle(),
                                                          ),
                                                          TextSpan(
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              '6ygmaj32' /*  vs  */,
                                                            ),
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFFDD3B3B),
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text: getJsonField(
                                                              FFAppState()
                                                                  .matchData,
                                                              r'''$.away_team.name''',
                                                            ).toString(),
                                                            style: TextStyle(),
                                                          ),
                                                          TextSpan(
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'olm3q1m3' /*   Cote Pariuri */,
                                                            ),
                                                            style: TextStyle(),
                                                          )
                                                        ],
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Play',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  fontSize:
                                                                      24.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              StyledDivider(
                                                thickness: 1.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                lineStyle:
                                                    DividerLineStyle.dotted,
                                              ),
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 395.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFEBEBEB),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 4.0,
                                                      color: Color(0x33000000),
                                                      offset: Offset(
                                                        0.0,
                                                        2.0,
                                                      ),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  border: Border.all(
                                                    color: Color(0x17626262),
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: 30.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFD8DDEA),
                                                        border: Border.all(
                                                          color:
                                                              Color(0xFFD8DDEA),
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    22.0,
                                                                    3.0,
                                                                    18.0,
                                                                    0.0),
                                                        child: Text(
                                                          functions.unixToDate(
                                                              getJsonField(
                                                            FFAppState()
                                                                .matchData,
                                                            r'''$.date_time''',
                                                          )),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Gelion',
                                                                color: Color(
                                                                    0xFF666666),
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          height: 30.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFF232948),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Container(
                                                                width: 74.0,
                                                                height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    1.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: getJsonField(
                                                                                FFAppState().matchData,
                                                                                r'''$.status''',
                                                                              ) ==
                                                                              1 &&
                                                                          getJsonField(
                                                                                FFAppState().matchData,
                                                                                r'''$.is_live''',
                                                                              ) ==
                                                                              1
                                                                      ? Color(0xFF39B931)
                                                                      : Color(0xFF616161),
                                                                  border: Border
                                                                      .all(
                                                                    color: getJsonField(
                                                                                  FFAppState().matchData,
                                                                                  r'''$.status''',
                                                                                ) ==
                                                                                1 &&
                                                                            getJsonField(
                                                                                  FFAppState().matchData,
                                                                                  r'''$.is_live''',
                                                                                ) ==
                                                                                1
                                                                        ? Color(0xFF39B931)
                                                                        : Color(0xFF616161),
                                                                  ),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(context).languageCode ==
                                                                            'ro'
                                                                        ? (getJsonField(
                                                                                      FFAppState().matchData,
                                                                                      r'''$.status''',
                                                                                    ) ==
                                                                                    1 &&
                                                                                getJsonField(
                                                                                      FFAppState().matchData,
                                                                                      r'''$.is_live''',
                                                                                    ) ==
                                                                                    1
                                                                            ? 'LIVE'
                                                                            : 'CURÂND')
                                                                        : (getJsonField(
                                                                                      FFAppState().matchData,
                                                                                      r'''$.status''',
                                                                                    ) ==
                                                                                    1 &&
                                                                                getJsonField(
                                                                                      FFAppState().matchData,
                                                                                      r'''$.is_live''',
                                                                                    ) ==
                                                                                    1
                                                                            ? 'LIVE'
                                                                            : 'SOON'),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Gelion',
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                child: Text(
                                                                  functions
                                                                      .unixToTime(
                                                                          getJsonField(
                                                                    FFAppState()
                                                                        .matchData,
                                                                    r'''$.date_time''',
                                                                  )),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Gelion',
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          height: 330.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBtnText,
                                                            border: Border.all(
                                                              color: Color(
                                                                  0xFFEBEBEB),
                                                            ),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                height: 75.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              (MediaQuery.sizeOf(context).width - 110) / 2,
                                                                          height:
                                                                              75.0,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                children: [
                                                                                  ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(10.0),
                                                                                    child: Image.network(
                                                                                      getJsonField(
                                                                                        FFAppState().matchData,
                                                                                        r'''$.home_team.logo''',
                                                                                      ).toString(),
                                                                                      width: 25.0,
                                                                                      height: 25.0,
                                                                                      fit: BoxFit.contain,
                                                                                    ),
                                                                                  ),
                                                                                  if (valueOrDefault<bool>(
                                                                                    getJsonField(
                                                                                              FFAppState().matchData,
                                                                                              r'''$.is_live''',
                                                                                            ) ==
                                                                                            1
                                                                                        ? true
                                                                                        : false,
                                                                                    false,
                                                                                  ))
                                                                                    Container(
                                                                                      width: 25.0,
                                                                                      height: 25.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: (getJsonField(
                                                                                                      FFAppState().matchData,
                                                                                                      r'''$.home_team.score''',
                                                                                                    ) ??
                                                                                                    0) >
                                                                                                0
                                                                                            ? Color(0xFFF9CF58)
                                                                                            : Colors.white,
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                        border: Border.all(
                                                                                          color: Color(0xFFCCCCCC),
                                                                                        ),
                                                                                      ),
                                                                                      child: Align(
                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                        child: Text(
                                                                                          getJsonField(
                                                                                            FFAppState().matchData,
                                                                                            r'''$.home_team.score''',
                                                                                          ).toString(),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Gelion',
                                                                                                color: Color(0xFFCD1C21),
                                                                                                fontSize: 16.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                                useGoogleFonts: false,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                ].divide(SizedBox(width: 5.0)),
                                                                              ),
                                                                              Text(
                                                                                getJsonField(
                                                                                  FFAppState().matchData,
                                                                                  r'''$.home_team.name''',
                                                                                ).toString(),
                                                                                textAlign: TextAlign.start,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Gelion',
                                                                                      color: Color(0xFFCD1C21),
                                                                                      fontSize: 15.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      useGoogleFonts: false,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              (MediaQuery.sizeOf(context).width - 110) / 2,
                                                                          height:
                                                                              75.0,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.end,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                children: [
                                                                                  if (valueOrDefault<bool>(
                                                                                    getJsonField(
                                                                                              FFAppState().matchData,
                                                                                              r'''$.is_live''',
                                                                                            ) ==
                                                                                            1
                                                                                        ? true
                                                                                        : false,
                                                                                    false,
                                                                                  ))
                                                                                    Container(
                                                                                      width: 25.0,
                                                                                      height: 25.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: (getJsonField(
                                                                                                      FFAppState().matchData,
                                                                                                      r'''$.away_team.score''',
                                                                                                    ) ??
                                                                                                    0) >
                                                                                                0
                                                                                            ? Color(0xFFF9CF58)
                                                                                            : Colors.white,
                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                        border: Border.all(
                                                                                          color: Color(0xFFCCCCCC),
                                                                                        ),
                                                                                      ),
                                                                                      child: Align(
                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                        child: Text(
                                                                                          getJsonField(
                                                                                            FFAppState().matchData,
                                                                                            r'''$.away_team.score''',
                                                                                          ).toString(),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Gelion',
                                                                                                color: Color(0xFFCD1C21),
                                                                                                fontSize: 16.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                                useGoogleFonts: false,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(10.0),
                                                                                    child: Image.network(
                                                                                      getJsonField(
                                                                                        FFAppState().matchData,
                                                                                        r'''$.away_team.logo''',
                                                                                      ).toString(),
                                                                                      width: 25.0,
                                                                                      height: 25.0,
                                                                                      fit: BoxFit.contain,
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 5.0)),
                                                                              ),
                                                                              Text(
                                                                                getJsonField(
                                                                                  FFAppState().matchData,
                                                                                  r'''$.away_team.name''',
                                                                                ).toString(),
                                                                                textAlign: TextAlign.end,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Gelion',
                                                                                      color: Color(0xFFCD1C21),
                                                                                      fontSize: 15.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      useGoogleFonts: false,
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
                                                              Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                height: 50.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          10.0,
                                                                          10.0,
                                                                          10.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          await launchURL(
                                                                              'https://cote-pariuri.ro/go/mozzartbet');
                                                                        },
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/mozzart.png',
                                                                          width:
                                                                              73.0,
                                                                          height:
                                                                              50.0,
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                      ),
                                                                      if (!(getJsonField(
                                                                            widget.odd,
                                                                            r'''$[0].o1.odd''',
                                                                          ) ==
                                                                          null))
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            await launchURL('https://cote-pariuri.ro/go/mozzartbet');
                                                                          },
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Container(
                                                                                width: 42.0,
                                                                                height: 30.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: valueOrDefault<Color>(
                                                                                    getJsonField(
                                                                                              widget.odd,
                                                                                              r'''$[0].o1.isMax''',
                                                                                            ) ==
                                                                                            true
                                                                                        ? Color(0xFF232948)
                                                                                        : Color(0xFFD8D8D8),
                                                                                    Color(0xFFD8D8D8),
                                                                                  ),
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 4.0,
                                                                                      color: Color(0x33000000),
                                                                                      offset: Offset(
                                                                                        2.0,
                                                                                        0.0,
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.only(
                                                                                    bottomLeft: Radius.circular(5.0),
                                                                                    bottomRight: Radius.circular(0.0),
                                                                                    topLeft: Radius.circular(5.0),
                                                                                    topRight: Radius.circular(0.0),
                                                                                  ),
                                                                                  border: Border.all(
                                                                                    color: Color(0xFFB8BFD4),
                                                                                  ),
                                                                                ),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Text(
                                                                                    getJsonField(
                                                                                      widget.odd,
                                                                                      r'''$[0].o1.odd''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Gelion',
                                                                                          color: valueOrDefault<Color>(
                                                                                            getJsonField(
                                                                                                      widget.odd,
                                                                                                      r'''$[0].o1.isMax''',
                                                                                                    ) ==
                                                                                                    true
                                                                                                ? Color(0xFFD8DDEA)
                                                                                                : Color(0xFF1D242F),
                                                                                            Color(0xFF1D242F),
                                                                                          ),
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: false,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: 42.0,
                                                                                height: 30.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: valueOrDefault<Color>(
                                                                                    getJsonField(
                                                                                              widget.odd,
                                                                                              r'''$[0].oX.isMax''',
                                                                                            ) ==
                                                                                            true
                                                                                        ? Color(0xFF232948)
                                                                                        : Color(0xFFD8D8D8),
                                                                                    Color(0xFFD8D8D8),
                                                                                  ),
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 4.0,
                                                                                      color: Color(0x33000000),
                                                                                      offset: Offset(
                                                                                        2.0,
                                                                                        0.0,
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                  border: Border.all(
                                                                                    color: Color(0xFFB8BFD4),
                                                                                  ),
                                                                                ),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Text(
                                                                                    getJsonField(
                                                                                      widget.odd,
                                                                                      r'''$[0].oX.odd''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Gelion',
                                                                                          color: valueOrDefault<Color>(
                                                                                            getJsonField(
                                                                                                      widget.odd,
                                                                                                      r'''$[0].oX.isMax''',
                                                                                                    ) ==
                                                                                                    true
                                                                                                ? Color(0xFFD8DDEA)
                                                                                                : Color(0xFF1D242F),
                                                                                            Color(0xFF1D242F),
                                                                                          ),
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: false,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: 42.0,
                                                                                height: 30.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: valueOrDefault<Color>(
                                                                                    getJsonField(
                                                                                              widget.odd,
                                                                                              r'''$[0].o2.isMax''',
                                                                                            ) ==
                                                                                            true
                                                                                        ? Color(0xFF232948)
                                                                                        : Color(0xFFD8D8D8),
                                                                                    Color(0xFFD8D8D8),
                                                                                  ),
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 4.0,
                                                                                      color: Color(0x33000000),
                                                                                      offset: Offset(
                                                                                        2.0,
                                                                                        0.0,
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.only(
                                                                                    bottomLeft: Radius.circular(0.0),
                                                                                    bottomRight: Radius.circular(5.0),
                                                                                    topLeft: Radius.circular(0.0),
                                                                                    topRight: Radius.circular(5.0),
                                                                                  ),
                                                                                  border: Border.all(
                                                                                    color: Color(0xFFB8BFD4),
                                                                                  ),
                                                                                ),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Text(
                                                                                    getJsonField(
                                                                                      widget.odd,
                                                                                      r'''$[0].o2.odd''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Gelion',
                                                                                          color: valueOrDefault<Color>(
                                                                                            getJsonField(
                                                                                                      widget.odd,
                                                                                                      r'''$[0].o2.isMax''',
                                                                                                    ) ==
                                                                                                    true
                                                                                                ? Color(0xFFD8DDEA)
                                                                                                : Color(0xFF1D242F),
                                                                                            Color(0xFF1D242F),
                                                                                          ),
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: false,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 10.0)),
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                height: 50.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          10.0,
                                                                          10.0,
                                                                          10.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          await launchURL(
                                                                              'https://cote-pariuri.ro/go/cote-superbet');
                                                                        },
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/superbet.png',
                                                                          width:
                                                                              73.0,
                                                                          height:
                                                                              50.0,
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                      ),
                                                                      if (!(getJsonField(
                                                                            widget.odd,
                                                                            r'''$[1].o1.odd''',
                                                                          ) ==
                                                                          null))
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            await launchURL('https://cote-pariuri.ro/go/cote-superbet');
                                                                          },
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Container(
                                                                                width: 42.0,
                                                                                height: 30.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: valueOrDefault<Color>(
                                                                                    getJsonField(
                                                                                              widget.odd,
                                                                                              r'''$[1].o1.isMax''',
                                                                                            ) ==
                                                                                            true
                                                                                        ? Color(0xFF232948)
                                                                                        : Color(0xFFD8D8D8),
                                                                                    Color(0xFFD8D8D8),
                                                                                  ),
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 4.0,
                                                                                      color: Color(0x33000000),
                                                                                      offset: Offset(
                                                                                        2.0,
                                                                                        0.0,
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.only(
                                                                                    bottomLeft: Radius.circular(5.0),
                                                                                    bottomRight: Radius.circular(0.0),
                                                                                    topLeft: Radius.circular(5.0),
                                                                                    topRight: Radius.circular(0.0),
                                                                                  ),
                                                                                  border: Border.all(
                                                                                    color: Color(0xFFB8BFD4),
                                                                                  ),
                                                                                ),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Text(
                                                                                    getJsonField(
                                                                                      widget.odd,
                                                                                      r'''$[1].o1.odd''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Gelion',
                                                                                          color: valueOrDefault<Color>(
                                                                                            getJsonField(
                                                                                                      widget.odd,
                                                                                                      r'''$[1].o1.isMax''',
                                                                                                    ) ==
                                                                                                    true
                                                                                                ? Color(0xFFD8DDEA)
                                                                                                : Color(0xFF1D242F),
                                                                                            Color(0xFF1D242F),
                                                                                          ),
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: false,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: 42.0,
                                                                                height: 30.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: valueOrDefault<Color>(
                                                                                    getJsonField(
                                                                                              widget.odd,
                                                                                              r'''$[1].oX.isMax''',
                                                                                            ) ==
                                                                                            true
                                                                                        ? Color(0xFF232948)
                                                                                        : Color(0xFFD8D8D8),
                                                                                    Color(0xFFD8D8D8),
                                                                                  ),
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 4.0,
                                                                                      color: Color(0x33000000),
                                                                                      offset: Offset(
                                                                                        2.0,
                                                                                        0.0,
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                  border: Border.all(
                                                                                    color: Color(0xFFB8BFD4),
                                                                                  ),
                                                                                ),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Text(
                                                                                    getJsonField(
                                                                                      widget.odd,
                                                                                      r'''$[1].oX.odd''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Gelion',
                                                                                          color: valueOrDefault<Color>(
                                                                                            getJsonField(
                                                                                                      widget.odd,
                                                                                                      r'''$[1].oX.isMax''',
                                                                                                    ) ==
                                                                                                    true
                                                                                                ? Color(0xFFD8DDEA)
                                                                                                : Color(0xFF1D242F),
                                                                                            Color(0xFF1D242F),
                                                                                          ),
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: false,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: 42.0,
                                                                                height: 30.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: valueOrDefault<Color>(
                                                                                    getJsonField(
                                                                                              widget.odd,
                                                                                              r'''$[1].o2.isMax''',
                                                                                            ) ==
                                                                                            true
                                                                                        ? Color(0xFF232948)
                                                                                        : Color(0xFFD8D8D8),
                                                                                    Color(0xFFD8D8D8),
                                                                                  ),
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 4.0,
                                                                                      color: Color(0x33000000),
                                                                                      offset: Offset(
                                                                                        2.0,
                                                                                        0.0,
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.only(
                                                                                    bottomLeft: Radius.circular(0.0),
                                                                                    bottomRight: Radius.circular(5.0),
                                                                                    topLeft: Radius.circular(0.0),
                                                                                    topRight: Radius.circular(5.0),
                                                                                  ),
                                                                                  border: Border.all(
                                                                                    color: Color(0xFFB8BFD4),
                                                                                  ),
                                                                                ),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Text(
                                                                                    getJsonField(
                                                                                      widget.odd,
                                                                                      r'''$[1].o2.odd''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Gelion',
                                                                                          color: valueOrDefault<Color>(
                                                                                            getJsonField(
                                                                                                      widget.odd,
                                                                                                      r'''$[1].o2.isMax''',
                                                                                                    ) ==
                                                                                                    true
                                                                                                ? Color(0xFFD8DDEA)
                                                                                                : Color(0xFF1D242F),
                                                                                            Color(0xFF1D242F),
                                                                                          ),
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: false,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 10.0)),
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                height: 50.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          10.0,
                                                                          10.0,
                                                                          10.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          await launchURL(
                                                                              'https://cote-pariuri.ro/go/unbt');
                                                                        },
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/unibet.png',
                                                                          width:
                                                                              73.0,
                                                                          height:
                                                                              50.0,
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                      ),
                                                                      if (!(getJsonField(
                                                                            widget.odd,
                                                                            r'''$[2].o1.odd''',
                                                                          ) ==
                                                                          null))
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            await launchURL('https://cote-pariuri.ro/go/unbt');
                                                                          },
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Container(
                                                                                width: 42.0,
                                                                                height: 30.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: valueOrDefault<Color>(
                                                                                    getJsonField(
                                                                                              widget.odd,
                                                                                              r'''$[2].o1.isMax''',
                                                                                            ) ==
                                                                                            true
                                                                                        ? Color(0xFF232948)
                                                                                        : Color(0xFFD8D8D8),
                                                                                    Color(0xFFD8D8D8),
                                                                                  ),
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 4.0,
                                                                                      color: Color(0x33000000),
                                                                                      offset: Offset(
                                                                                        2.0,
                                                                                        0.0,
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.only(
                                                                                    bottomLeft: Radius.circular(5.0),
                                                                                    bottomRight: Radius.circular(0.0),
                                                                                    topLeft: Radius.circular(5.0),
                                                                                    topRight: Radius.circular(0.0),
                                                                                  ),
                                                                                  border: Border.all(
                                                                                    color: Color(0xFFB8BFD4),
                                                                                  ),
                                                                                ),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Text(
                                                                                    getJsonField(
                                                                                      widget.odd,
                                                                                      r'''$[2].o1.odd''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Gelion',
                                                                                          color: valueOrDefault<Color>(
                                                                                            getJsonField(
                                                                                                      widget.odd,
                                                                                                      r'''$[2].o1.isMax''',
                                                                                                    ) ==
                                                                                                    true
                                                                                                ? Color(0xFFD8DDEA)
                                                                                                : Color(0xFF1D242F),
                                                                                            Color(0xFF1D242F),
                                                                                          ),
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: false,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: 42.0,
                                                                                height: 30.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: valueOrDefault<Color>(
                                                                                    getJsonField(
                                                                                              widget.odd,
                                                                                              r'''$[2].oX.isMax''',
                                                                                            ) ==
                                                                                            true
                                                                                        ? Color(0xFF232948)
                                                                                        : Color(0xFFD8D8D8),
                                                                                    Color(0xFFD8D8D8),
                                                                                  ),
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 4.0,
                                                                                      color: Color(0x33000000),
                                                                                      offset: Offset(
                                                                                        2.0,
                                                                                        0.0,
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                  border: Border.all(
                                                                                    color: Color(0xFFB8BFD4),
                                                                                  ),
                                                                                ),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Text(
                                                                                    getJsonField(
                                                                                      widget.odd,
                                                                                      r'''$[2].oX.odd''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Gelion',
                                                                                          color: valueOrDefault<Color>(
                                                                                            getJsonField(
                                                                                                      widget.odd,
                                                                                                      r'''$[2].oX.isMax''',
                                                                                                    ) ==
                                                                                                    true
                                                                                                ? Color(0xFFD8DDEA)
                                                                                                : Color(0xFF1D242F),
                                                                                            Color(0xFF1D242F),
                                                                                          ),
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: false,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: 42.0,
                                                                                height: 30.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: valueOrDefault<Color>(
                                                                                    getJsonField(
                                                                                              widget.odd,
                                                                                              r'''$[2].o2.isMax''',
                                                                                            ) ==
                                                                                            true
                                                                                        ? Color(0xFF232948)
                                                                                        : Color(0xFFD8D8D8),
                                                                                    Color(0xFFD8D8D8),
                                                                                  ),
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 4.0,
                                                                                      color: Color(0x33000000),
                                                                                      offset: Offset(
                                                                                        2.0,
                                                                                        0.0,
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.only(
                                                                                    bottomLeft: Radius.circular(0.0),
                                                                                    bottomRight: Radius.circular(5.0),
                                                                                    topLeft: Radius.circular(0.0),
                                                                                    topRight: Radius.circular(5.0),
                                                                                  ),
                                                                                  border: Border.all(
                                                                                    color: Color(0xFFB8BFD4),
                                                                                  ),
                                                                                ),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Text(
                                                                                    getJsonField(
                                                                                      widget.odd,
                                                                                      r'''$[2].o2.odd''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Gelion',
                                                                                          color: valueOrDefault<Color>(
                                                                                            getJsonField(
                                                                                                      widget.odd,
                                                                                                      r'''$[2].o2.isMax''',
                                                                                                    ) ==
                                                                                                    true
                                                                                                ? Color(0xFFD8DDEA)
                                                                                                : Color(0xFF1D242F),
                                                                                            Color(0xFF1D242F),
                                                                                          ),
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: false,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 10.0)),
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                height: 50.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          10.0,
                                                                          10.0,
                                                                          10.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          await launchURL(
                                                                              'https://cote-pariuri.ro/go/cote-betano');
                                                                        },
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/betano.png',
                                                                          width:
                                                                              73.0,
                                                                          height:
                                                                              50.0,
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                      ),
                                                                      if (!(getJsonField(
                                                                            widget.odd,
                                                                            r'''$[3].o1.odd''',
                                                                          ) ==
                                                                          null))
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            await launchURL('https://cote-pariuri.ro/go/cote-betano');
                                                                          },
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Container(
                                                                                width: 42.0,
                                                                                height: 30.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: valueOrDefault<Color>(
                                                                                    getJsonField(
                                                                                              widget.odd,
                                                                                              r'''$[3].o1.isMax''',
                                                                                            ) ==
                                                                                            true
                                                                                        ? Color(0xFF232948)
                                                                                        : Color(0xFFD8D8D8),
                                                                                    Color(0xFFD8D8D8),
                                                                                  ),
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 4.0,
                                                                                      color: Color(0x33000000),
                                                                                      offset: Offset(
                                                                                        2.0,
                                                                                        0.0,
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.only(
                                                                                    bottomLeft: Radius.circular(5.0),
                                                                                    bottomRight: Radius.circular(0.0),
                                                                                    topLeft: Radius.circular(5.0),
                                                                                    topRight: Radius.circular(0.0),
                                                                                  ),
                                                                                  border: Border.all(
                                                                                    color: Color(0xFFB8BFD4),
                                                                                  ),
                                                                                ),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Text(
                                                                                    getJsonField(
                                                                                      widget.odd,
                                                                                      r'''$[3].o1.odd''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Gelion',
                                                                                          color: valueOrDefault<Color>(
                                                                                            getJsonField(
                                                                                                      widget.odd,
                                                                                                      r'''$[3].o1.isMax''',
                                                                                                    ) ==
                                                                                                    true
                                                                                                ? Color(0xFFD8DDEA)
                                                                                                : Color(0xFF1D242F),
                                                                                            Color(0xFF1D242F),
                                                                                          ),
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: false,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: 42.0,
                                                                                height: 30.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: valueOrDefault<Color>(
                                                                                    getJsonField(
                                                                                              widget.odd,
                                                                                              r'''$[3].oX.isMax''',
                                                                                            ) ==
                                                                                            true
                                                                                        ? Color(0xFF232948)
                                                                                        : Color(0xFFD8D8D8),
                                                                                    Color(0xFFD8D8D8),
                                                                                  ),
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 4.0,
                                                                                      color: Color(0x33000000),
                                                                                      offset: Offset(
                                                                                        2.0,
                                                                                        0.0,
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                  border: Border.all(
                                                                                    color: Color(0xFFB8BFD4),
                                                                                  ),
                                                                                ),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Text(
                                                                                    getJsonField(
                                                                                      widget.odd,
                                                                                      r'''$[3].oX.odd''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Gelion',
                                                                                          color: valueOrDefault<Color>(
                                                                                            getJsonField(
                                                                                                      widget.odd,
                                                                                                      r'''$[3].oX.isMax''',
                                                                                                    ) ==
                                                                                                    true
                                                                                                ? Color(0xFFD8DDEA)
                                                                                                : Color(0xFF1D242F),
                                                                                            Color(0xFF1D242F),
                                                                                          ),
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: false,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: 42.0,
                                                                                height: 30.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: valueOrDefault<Color>(
                                                                                    getJsonField(
                                                                                              widget.odd,
                                                                                              r'''$[3].o2.isMax''',
                                                                                            ) ==
                                                                                            true
                                                                                        ? Color(0xFF232948)
                                                                                        : Color(0xFFD8D8D8),
                                                                                    Color(0xFFD8D8D8),
                                                                                  ),
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 4.0,
                                                                                      color: Color(0x33000000),
                                                                                      offset: Offset(
                                                                                        2.0,
                                                                                        0.0,
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.only(
                                                                                    bottomLeft: Radius.circular(0.0),
                                                                                    bottomRight: Radius.circular(5.0),
                                                                                    topLeft: Radius.circular(0.0),
                                                                                    topRight: Radius.circular(5.0),
                                                                                  ),
                                                                                  border: Border.all(
                                                                                    color: Color(0xFFB8BFD4),
                                                                                  ),
                                                                                ),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Text(
                                                                                    getJsonField(
                                                                                      widget.odd,
                                                                                      r'''$[3].o2.odd''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Gelion',
                                                                                          color: valueOrDefault<Color>(
                                                                                            getJsonField(
                                                                                                      widget.odd,
                                                                                                      r'''$[3].o2.isMax''',
                                                                                                    ) ==
                                                                                                    true
                                                                                                ? Color(0xFFD8DDEA)
                                                                                                : Color(0xFF1D242F),
                                                                                            Color(0xFF1D242F),
                                                                                          ),
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: false,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 10.0)),
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                height: 50.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            10.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            10.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            0.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            0.0),
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          10.0,
                                                                          10.0,
                                                                          10.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          await launchURL(
                                                                              'https://cote-pariuri.ro/go/cote-betfair');
                                                                        },
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/betfair-logo.png',
                                                                          width:
                                                                              73.0,
                                                                          height:
                                                                              50.0,
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                      ),
                                                                      if (!(getJsonField(
                                                                            widget.odd,
                                                                            r'''$[4].o1.odd''',
                                                                          ) ==
                                                                          null))
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            await launchURL('https://cote-pariuri.ro/go/cote-betfair');
                                                                          },
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Container(
                                                                                width: 42.0,
                                                                                height: 30.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: valueOrDefault<Color>(
                                                                                    getJsonField(
                                                                                              widget.odd,
                                                                                              r'''$[4].o1.isMax''',
                                                                                            ) ==
                                                                                            true
                                                                                        ? Color(0xFF232948)
                                                                                        : Color(0xFFD8D8D8),
                                                                                    Color(0xFFD8D8D8),
                                                                                  ),
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 4.0,
                                                                                      color: Color(0x33000000),
                                                                                      offset: Offset(
                                                                                        2.0,
                                                                                        0.0,
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.only(
                                                                                    bottomLeft: Radius.circular(5.0),
                                                                                    bottomRight: Radius.circular(0.0),
                                                                                    topLeft: Radius.circular(5.0),
                                                                                    topRight: Radius.circular(0.0),
                                                                                  ),
                                                                                  border: Border.all(
                                                                                    color: Color(0xFFB8BFD4),
                                                                                  ),
                                                                                ),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Text(
                                                                                    getJsonField(
                                                                                      widget.odd,
                                                                                      r'''$[4].o1.odd''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Gelion',
                                                                                          color: valueOrDefault<Color>(
                                                                                            getJsonField(
                                                                                                      widget.odd,
                                                                                                      r'''$[4].o1.isMax''',
                                                                                                    ) ==
                                                                                                    true
                                                                                                ? Color(0xFFD8DDEA)
                                                                                                : Color(0xFF1D242F),
                                                                                            Color(0xFF1D242F),
                                                                                          ),
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: false,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: 42.0,
                                                                                height: 30.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: valueOrDefault<Color>(
                                                                                    getJsonField(
                                                                                              widget.odd,
                                                                                              r'''$[4].oX.isMax''',
                                                                                            ) ==
                                                                                            true
                                                                                        ? Color(0xFF232948)
                                                                                        : Color(0xFFD8D8D8),
                                                                                    Color(0xFFD8D8D8),
                                                                                  ),
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 4.0,
                                                                                      color: Color(0x33000000),
                                                                                      offset: Offset(
                                                                                        2.0,
                                                                                        0.0,
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                  border: Border.all(
                                                                                    color: Color(0xFFB8BFD4),
                                                                                  ),
                                                                                ),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Text(
                                                                                    getJsonField(
                                                                                      widget.odd,
                                                                                      r'''$[4].oX.odd''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Gelion',
                                                                                          color: valueOrDefault<Color>(
                                                                                            getJsonField(
                                                                                                      widget.odd,
                                                                                                      r'''$[4].oX.isMax''',
                                                                                                    ) ==
                                                                                                    true
                                                                                                ? Color(0xFFD8DDEA)
                                                                                                : Color(0xFF1D242F),
                                                                                            Color(0xFF1D242F),
                                                                                          ),
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: false,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                width: 42.0,
                                                                                height: 30.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: valueOrDefault<Color>(
                                                                                    getJsonField(
                                                                                              widget.odd,
                                                                                              r'''$[4].o2.isMax''',
                                                                                            ) ==
                                                                                            true
                                                                                        ? Color(0xFF232948)
                                                                                        : Color(0xFFD8D8D8),
                                                                                    Color(0xFFD8D8D8),
                                                                                  ),
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 4.0,
                                                                                      color: Color(0x33000000),
                                                                                      offset: Offset(
                                                                                        2.0,
                                                                                        0.0,
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.only(
                                                                                    bottomLeft: Radius.circular(0.0),
                                                                                    bottomRight: Radius.circular(5.0),
                                                                                    topLeft: Radius.circular(0.0),
                                                                                    topRight: Radius.circular(5.0),
                                                                                  ),
                                                                                  border: Border.all(
                                                                                    color: Color(0xFFB8BFD4),
                                                                                  ),
                                                                                ),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Text(
                                                                                    getJsonField(
                                                                                      widget.odd,
                                                                                      r'''$[4].o2.odd''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Gelion',
                                                                                          color: valueOrDefault<Color>(
                                                                                            getJsonField(
                                                                                                      widget.odd,
                                                                                                      r'''$[4].o2.isMax''',
                                                                                                    ) ==
                                                                                                    true
                                                                                                ? Color(0xFFD8DDEA)
                                                                                                : Color(0xFF1D242F),
                                                                                            Color(0xFF1D242F),
                                                                                          ),
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: false,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 10.0)),
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              if (getJsonField(
                                                    FFAppState().matchData,
                                                    r'''$.status''',
                                                  ) ==
                                                  3)
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  10.0),
                                                      child: RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'cnelskst' /* Statistica meciului  */,
                                                              ),
                                                              style:
                                                                  TextStyle(),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  getJsonField(
                                                                FFAppState()
                                                                    .matchData,
                                                                r'''$.home_team.name''',
                                                              ).toString(),
                                                              style:
                                                                  TextStyle(),
                                                            ),
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                '79x6cjep' /*  vs  */,
                                                              ),
                                                              style:
                                                                  TextStyle(),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  getJsonField(
                                                                FFAppState()
                                                                    .matchData,
                                                                r'''$.away_team.name''',
                                                              ).toString(),
                                                              style:
                                                                  TextStyle(),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Gelion',
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF3B3B3B),
                                                        border: Border.all(
                                                          color:
                                                              Color(0x80444444),
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Flexible(
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            5.0,
                                                                            10.0,
                                                                            5.0),
                                                                    child:
                                                                        RichText(
                                                                      textScaler:
                                                                          MediaQuery.of(context)
                                                                              .textScaler,
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                getJsonField(
                                                                              FFAppState().matchData,
                                                                              r'''$.home_team.score''',
                                                                            ).toString(),
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                FFLocalizations.of(context).getText(
                                                                              'dzm4uva1' /*   :   */,
                                                                            ),
                                                                            style:
                                                                                TextStyle(),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                getJsonField(
                                                                              FFAppState().matchData,
                                                                              r'''$.away_team.score''',
                                                                            ).toString(),
                                                                            style:
                                                                                TextStyle(),
                                                                          )
                                                                        ],
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Gelion',
                                                                              color: Color(0xFF1D242F),
                                                                              fontSize: 24.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Flexible(
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.5,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            10.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.network(
                                                                            getJsonField(
                                                                              FFAppState().matchData,
                                                                              r'''$.home_team.logo''',
                                                                            ).toString(),
                                                                            width:
                                                                                35.0,
                                                                            height:
                                                                                35.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          getJsonField(
                                                                            FFAppState().matchData,
                                                                            r'''$.home_team.name''',
                                                                          ).toString(),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Gelion',
                                                                                fontSize: 18.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                                useGoogleFonts: false,
                                                                              ),
                                                                        ),
                                                                        Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final scorer =
                                                                                getJsonField(
                                                                              FFAppState().matchData,
                                                                              r'''$.home_team.scorer''',
                                                                            ).toList();
                                                                            return Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: List.generate(scorer.length, (scorerIndex) {
                                                                                final scorerItem = scorer[scorerIndex];
                                                                                return Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Icon(
                                                                                      Icons.sports_soccer,
                                                                                      color: Colors.white,
                                                                                      size: 20.0,
                                                                                    ),
                                                                                    Flexible(
                                                                                      child: RichText(
                                                                                        textScaler: MediaQuery.of(context).textScaler,
                                                                                        text: TextSpan(
                                                                                          children: [
                                                                                            TextSpan(
                                                                                              text: getJsonField(
                                                                                                scorerItem,
                                                                                                r'''$.name''',
                                                                                              ).toString(),
                                                                                              style: TextStyle(),
                                                                                            ),
                                                                                            TextSpan(
                                                                                              text: FFLocalizations.of(context).getText(
                                                                                                'byiqxahx' /*  ( */,
                                                                                              ),
                                                                                              style: TextStyle(),
                                                                                            ),
                                                                                            TextSpan(
                                                                                              text: getJsonField(
                                                                                                scorerItem,
                                                                                                r'''$.time''',
                                                                                              ).toString(),
                                                                                              style: TextStyle(),
                                                                                            ),
                                                                                            TextSpan(
                                                                                              text: FFLocalizations.of(context).getText(
                                                                                                'tr457p70' /* ") */,
                                                                                              ),
                                                                                              style: TextStyle(),
                                                                                            )
                                                                                          ],
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Gelion',
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: false,
                                                                                              ),
                                                                                        ),
                                                                                        textAlign: TextAlign.center,
                                                                                      ),
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 5.0)),
                                                                                );
                                                                              }),
                                                                            );
                                                                          },
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              height: 5.0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.5,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            10.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.network(
                                                                            getJsonField(
                                                                              FFAppState().matchData,
                                                                              r'''$.away_team.logo''',
                                                                            ).toString(),
                                                                            width:
                                                                                35.0,
                                                                            height:
                                                                                35.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          getJsonField(
                                                                            FFAppState().matchData,
                                                                            r'''$.away_team.name''',
                                                                          ).toString(),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Gelion',
                                                                                fontSize: 18.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                                useGoogleFonts: false,
                                                                              ),
                                                                        ),
                                                                        Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final scorer =
                                                                                getJsonField(
                                                                              FFAppState().matchData,
                                                                              r'''$.away_team.scorer''',
                                                                            ).toList();
                                                                            return Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: List.generate(scorer.length, (scorerIndex) {
                                                                                final scorerItem = scorer[scorerIndex];
                                                                                return Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Icon(
                                                                                      Icons.sports_soccer,
                                                                                      color: Colors.white,
                                                                                      size: 20.0,
                                                                                    ),
                                                                                    Flexible(
                                                                                      child: RichText(
                                                                                        textScaler: MediaQuery.of(context).textScaler,
                                                                                        text: TextSpan(
                                                                                          children: [
                                                                                            TextSpan(
                                                                                              text: getJsonField(
                                                                                                scorerItem,
                                                                                                r'''$.name''',
                                                                                              ).toString(),
                                                                                              style: TextStyle(),
                                                                                            ),
                                                                                            TextSpan(
                                                                                              text: FFLocalizations.of(context).getText(
                                                                                                'svw81htp' /*  ( */,
                                                                                              ),
                                                                                              style: TextStyle(),
                                                                                            ),
                                                                                            TextSpan(
                                                                                              text: getJsonField(
                                                                                                scorerItem,
                                                                                                r'''$.time''',
                                                                                              ).toString(),
                                                                                              style: TextStyle(),
                                                                                            ),
                                                                                            TextSpan(
                                                                                              text: FFLocalizations.of(context).getText(
                                                                                                'vgukhsr2' /* ") */,
                                                                                              ),
                                                                                              style: TextStyle(),
                                                                                            )
                                                                                          ],
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Gelion',
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: false,
                                                                                              ),
                                                                                        ),
                                                                                        textAlign: TextAlign.center,
                                                                                      ),
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 5.0)),
                                                                                );
                                                                              }),
                                                                            );
                                                                          },
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              height: 5.0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Builder(
                                                            builder: (context) {
                                                              final state =
                                                                  getJsonField(
                                                                _model
                                                                    .stateChange,
                                                                r'''$.stats''',
                                                              ).toList();
                                                              return Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: List.generate(
                                                                    state
                                                                        .length,
                                                                    (stateIndex) {
                                                                  final stateItem =
                                                                      state[
                                                                          stateIndex];
                                                                  return Visibility(
                                                                    visible:
                                                                        getJsonField(
                                                                              FFAppState().matchData,
                                                                              r'''$.stats''',
                                                                            ) !=
                                                                            null,
                                                                    child:
                                                                        wrapWithModel(
                                                                      model: _model
                                                                          .ballPossessionModels
                                                                          .getModel(
                                                                        stateIndex
                                                                            .toString(),
                                                                        stateIndex,
                                                                      ),
                                                                      updateCallback:
                                                                          () =>
                                                                              setState(() {}),
                                                                      child:
                                                                          StatsWidget(
                                                                        key:
                                                                            Key(
                                                                          'Key49n_${stateIndex.toString()}',
                                                                        ),
                                                                        parameter1:
                                                                            getJsonField(
                                                                          stateItem,
                                                                          r'''$.home_team''',
                                                                        ),
                                                                        parameter2:
                                                                            getJsonField(
                                                                          stateItem,
                                                                          r'''$.stat_name''',
                                                                        ),
                                                                        parameter3:
                                                                            getJsonField(
                                                                          stateItem,
                                                                          r'''$.away_team''',
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }),
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: RichText(
                                                      textScaler:
                                                          MediaQuery.of(context)
                                                              .textScaler,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'mcm59o4x' /* Cele mai bune cote pentru  */,
                                                            ),
                                                            style: TextStyle(),
                                                          ),
                                                          TextSpan(
                                                            text: getJsonField(
                                                              FFAppState()
                                                                  .matchData,
                                                              r'''$.home_team.name''',
                                                            ).toString(),
                                                            style: TextStyle(),
                                                          ),
                                                          TextSpan(
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              '70w2txnf' /*  vs  */,
                                                            ),
                                                            style: TextStyle(),
                                                          ),
                                                          TextSpan(
                                                            text: getJsonField(
                                                              FFAppState()
                                                                  .matchData,
                                                              r'''$.away_team.name''',
                                                            ).toString(),
                                                            style: TextStyle(),
                                                          )
                                                        ],
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Gelion',
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFF515151),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.4,
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'qw0so56e' /* Rezultat */,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lato',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.3,
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'hwtza56a' /* Cea mai bună cotă */,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lato',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.3,
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'zdbxw6s2' /* Casă de pariuri */,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lato',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFEBEBEB),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.4,
                                                            decoration:
                                                                BoxDecoration(),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          10.0,
                                                                          5.0,
                                                                          10.0),
                                                              child: RichText(
                                                                textScaler: MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text:
                                                                          getJsonField(
                                                                        FFAppState()
                                                                            .matchData,
                                                                        r'''$.home_team.name''',
                                                                      ).toString(),
                                                                      style:
                                                                          TextStyle(),
                                                                    ),
                                                                    TextSpan(
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'irmaq0eb' /*  să câștige */,
                                                                      ),
                                                                      style:
                                                                          TextStyle(),
                                                                    )
                                                                  ],
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Gelion',
                                                                        color: Colors
                                                                            .black,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.3,
                                                            decoration:
                                                                BoxDecoration(),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          10.0,
                                                                          5.0,
                                                                          10.0),
                                                              child: Text(
                                                                getJsonField(
                                                                  FFAppState()
                                                                      .matchData,
                                                                  r'''$.home_team.best_odd.value''',
                                                                ).toString(),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Gelion',
                                                                      color: Colors
                                                                          .black,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.3,
                                                            decoration:
                                                                BoxDecoration(),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          10.0,
                                                                          5.0,
                                                                          10.0),
                                                              child: Text(
                                                                getJsonField(
                                                                  FFAppState()
                                                                      .matchData,
                                                                  r'''$.home_team.best_odd.bookmarker''',
                                                                ).toString(),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Gelion',
                                                                      color: Colors
                                                                          .black,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFC5C5C5),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.4,
                                                            decoration:
                                                                BoxDecoration(),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          10.0,
                                                                          5.0,
                                                                          10.0),
                                                              child: RichText(
                                                                textScaler: MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'ncl0f09s' /* Egalitate */,
                                                                      ),
                                                                      style:
                                                                          TextStyle(),
                                                                    )
                                                                  ],
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Gelion',
                                                                        color: Colors
                                                                            .black,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.3,
                                                            decoration:
                                                                BoxDecoration(),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          10.0,
                                                                          5.0,
                                                                          10.0),
                                                              child: Text(
                                                                getJsonField(
                                                                  FFAppState()
                                                                      .matchData,
                                                                  r'''$.draw.best_odd.value''',
                                                                ).toString(),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Gelion',
                                                                      color: Colors
                                                                          .black,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.3,
                                                            decoration:
                                                                BoxDecoration(),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          10.0,
                                                                          5.0,
                                                                          10.0),
                                                              child: Text(
                                                                getJsonField(
                                                                  FFAppState()
                                                                      .matchData,
                                                                  r'''$.draw.best_odd.bookmarker''',
                                                                ).toString(),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Gelion',
                                                                      color: Colors
                                                                          .black,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFEBEBEB),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.4,
                                                            decoration:
                                                                BoxDecoration(),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          10.0,
                                                                          5.0,
                                                                          10.0),
                                                              child: RichText(
                                                                textScaler: MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text:
                                                                          getJsonField(
                                                                        FFAppState()
                                                                            .matchData,
                                                                        r'''$.away_team.name''',
                                                                      ).toString(),
                                                                      style:
                                                                          TextStyle(),
                                                                    ),
                                                                    TextSpan(
                                                                      text: FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'au4wlp6x' /*  să câștige */,
                                                                      ),
                                                                      style:
                                                                          TextStyle(),
                                                                    )
                                                                  ],
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Gelion',
                                                                        color: Colors
                                                                            .black,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.3,
                                                            decoration:
                                                                BoxDecoration(),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          10.0,
                                                                          5.0,
                                                                          10.0),
                                                              child: Text(
                                                                getJsonField(
                                                                  FFAppState()
                                                                      .matchData,
                                                                  r'''$.away_team.best_odd.value''',
                                                                ).toString(),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Gelion',
                                                                      color: Colors
                                                                          .black,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.3,
                                                            decoration:
                                                                BoxDecoration(),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          10.0,
                                                                          5.0,
                                                                          10.0),
                                                              child: Text(
                                                                getJsonField(
                                                                  FFAppState()
                                                                      .matchData,
                                                                  r'''$.away_team.best_odd.bookmarker''',
                                                                ).toString(),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Gelion',
                                                                      color: Colors
                                                                          .black,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: 2.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFC5C5C5),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              if (getJsonField(
                                                        FFAppState().matchData,
                                                        r'''$.status''',
                                                      ) ==
                                                      3 ||
                                                  getJsonField(
                                                        FFAppState().matchData,
                                                        r'''$.status''',
                                                      ) ==
                                                      1)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    20.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'q09p2k2a' /* Detalii meci */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Gelion',
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        ),
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '5xe63fm4' /* - */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Gelion',
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                                Flexible(
                                                                  child:
                                                                      RichText(
                                                                    textScaler:
                                                                        MediaQuery.of(context)
                                                                            .textScaler,
                                                                    text:
                                                                        TextSpan(
                                                                      children: [
                                                                        TextSpan(
                                                                          text:
                                                                              getJsonField(
                                                                            FFAppState().matchData,
                                                                            r'''$.home_team.name''',
                                                                          ).toString(),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'k8u4q4vc' /*   */,
                                                                          ),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              getJsonField(
                                                                            FFAppState().matchData,
                                                                            r'''$.home_team.score''',
                                                                          ).toString(),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'h188ylw7' /*  :  */,
                                                                          ),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              getJsonField(
                                                                            FFAppState().matchData,
                                                                            r'''$.away_team.score''',
                                                                          ).toString(),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'c6vkohqc' /*   */,
                                                                          ),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              getJsonField(
                                                                            FFAppState().matchData,
                                                                            r'''$.away_team.name''',
                                                                          ).toString(),
                                                                          style:
                                                                              TextStyle(),
                                                                        )
                                                                      ],
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Gelion',
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 5.0)),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '5472u328' /* - */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Gelion',
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                                Flexible(
                                                                  child:
                                                                      RichText(
                                                                    textScaler:
                                                                        MediaQuery.of(context)
                                                                            .textScaler,
                                                                    text:
                                                                        TextSpan(
                                                                      children: [
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'y6vc4o97' /* Eveniment:  */,
                                                                          ),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              getJsonField(
                                                                            FFAppState().matchData,
                                                                            r'''$.league_name''',
                                                                          ).toString(),
                                                                          style:
                                                                              TextStyle(),
                                                                        )
                                                                      ],
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Gelion',
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 5.0)),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'bukdwm6z' /* - */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Gelion',
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                                Flexible(
                                                                  child:
                                                                      RichText(
                                                                    textScaler:
                                                                        MediaQuery.of(context)
                                                                            .textScaler,
                                                                    text:
                                                                        TextSpan(
                                                                      children: [
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            '1o1eajyp' /* Data:  */,
                                                                          ),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              functions.unixToDate(getJsonField(
                                                                            FFAppState().matchData,
                                                                            r'''$.date_time''',
                                                                          )),
                                                                          style:
                                                                              TextStyle(),
                                                                        )
                                                                      ],
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Gelion',
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 5.0)),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '7io5t1yk' /* - */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Gelion',
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                                Flexible(
                                                                  child:
                                                                      RichText(
                                                                    textScaler:
                                                                        MediaQuery.of(context)
                                                                            .textScaler,
                                                                    text:
                                                                        TextSpan(
                                                                      children: [
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'bobu44lq' /* Ora de începere:  */,
                                                                          ),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              functions.unixToTime(getJsonField(
                                                                            FFAppState().matchData,
                                                                            r'''$.date_time''',
                                                                          )),
                                                                          style:
                                                                              TextStyle(),
                                                                        )
                                                                      ],
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Gelion',
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 5.0)),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 5.0)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 10.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  20.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '1ovunrf1' /* Statistici relevante pentru ac... */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Gelion',
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        if ((String var1,
                                                                String var2) {
                                                          return var1 != null &&
                                                              var2 != null;
                                                        }(
                                                            getJsonField(
                                                              FFAppState()
                                                                  .matchData,
                                                              r'''$.fact.home_last_matches.last_match_opponent''',
                                                            ).toString(),
                                                            getJsonField(
                                                              FFAppState()
                                                                  .matchData,
                                                              r'''$.fact.away_last_matches.last_match_opponent''',
                                                            ).toString()))
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '98i7dh0w' /* - */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Gelion',
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                                Flexible(
                                                                  child:
                                                                      RichText(
                                                                    textScaler:
                                                                        MediaQuery.of(context)
                                                                            .textScaler,
                                                                    text:
                                                                        TextSpan(
                                                                      children: [
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'ataxyifl' /* În ultimul meci,  */,
                                                                          ),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              getJsonField(
                                                                            FFAppState().matchData,
                                                                            r'''$.home_team.name''',
                                                                          ).toString(),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text: FFLocalizations.of(context).languageCode == 'ro'
                                                                              ? () {
                                                                                  if (functions.jsonToString(getJsonField(
                                                                                        FFAppState().matchData,
                                                                                        r'''$.fact.home_last_matches.last_match''',
                                                                                      )) ==
                                                                                      '\"lost\"') {
                                                                                    return ' a pierdut ';
                                                                                  } else if (functions.jsonToString(getJsonField(
                                                                                        FFAppState().matchData,
                                                                                        r'''$.fact.home_last_matches.last_match''',
                                                                                      )) ==
                                                                                      '\"win\"') {
                                                                                    return ' a castigat ';
                                                                                  } else {
                                                                                    return ' egal ';
                                                                                  }
                                                                                }()
                                                                              : () {
                                                                                  if (functions.jsonToString(getJsonField(
                                                                                        FFAppState().matchData,
                                                                                        r'''$.fact.home_last_matches.last_match''',
                                                                                      )) ==
                                                                                      '\"lost\"') {
                                                                                    return ' lost ';
                                                                                  } else if (functions.jsonToString(getJsonField(
                                                                                        FFAppState().matchData,
                                                                                        r'''$.fact.home_last_matches.last_match''',
                                                                                      )) ==
                                                                                      '\"win\"') {
                                                                                    return ' won';
                                                                                  } else {
                                                                                    return ' drew ';
                                                                                  }
                                                                                }(),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'j22efoqt' /* împotriva  */,
                                                                          ),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              getJsonField(
                                                                            FFAppState().matchData,
                                                                            r'''$.fact.home_last_matches.last_match_opponent''',
                                                                          ).toString(),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            '2o8n67ca' /* , iar  */,
                                                                          ),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              getJsonField(
                                                                            FFAppState().matchData,
                                                                            r'''$.away_team.name''',
                                                                          ).toString(),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text: FFLocalizations.of(context).languageCode == 'ro'
                                                                              ? () {
                                                                                  if (functions.jsonToString(getJsonField(
                                                                                        FFAppState().matchData,
                                                                                        r'''$.fact.away_last_matches.last_match''',
                                                                                      )) ==
                                                                                      '\"lost\"') {
                                                                                    return ' a pierdut ';
                                                                                  } else if (functions.jsonToString(getJsonField(
                                                                                        FFAppState().matchData,
                                                                                        r'''$.fact.away_last_matches.last_match''',
                                                                                      )) ==
                                                                                      '\"win\"') {
                                                                                    return ' a castigat ';
                                                                                  } else {
                                                                                    return ' egal ';
                                                                                  }
                                                                                }()
                                                                              : () {
                                                                                  if (functions.jsonToString(getJsonField(
                                                                                        FFAppState().matchData,
                                                                                        r'''$.fact.away_last_matches.last_match''',
                                                                                      )) ==
                                                                                      '\"lost\"') {
                                                                                    return ' lost ';
                                                                                  } else if (functions.jsonToString(getJsonField(
                                                                                        FFAppState().matchData,
                                                                                        r'''$.fact.away_last_matches.last_match''',
                                                                                      )) ==
                                                                                      '\"win\"') {
                                                                                    return ' won';
                                                                                  } else {
                                                                                    return ' drew ';
                                                                                  }
                                                                                }(),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'dknaydpm' /* împotriva  */,
                                                                          ),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              getJsonField(
                                                                            FFAppState().matchData,
                                                                            r'''$.fact.away_last_matches.last_match_opponent''',
                                                                          ).toString(),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            't4eubz87' /* . */,
                                                                          ),
                                                                          style:
                                                                              TextStyle(),
                                                                        )
                                                                      ],
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Gelion',
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 5.0)),
                                                            ),
                                                          ),
                                                        if ((int var1,
                                                                int var2) {
                                                          return var1 != var2;
                                                        }(
                                                            getJsonField(
                                                              FFAppState()
                                                                  .matchData,
                                                              r'''$.fact.home_last_matches.performance''',
                                                            ),
                                                            getJsonField(
                                                              FFAppState()
                                                                  .matchData,
                                                              r'''$.fact.away_last_matches.performance''',
                                                            )))
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'y15dqz0h' /* - */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Gelion',
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                                Flexible(
                                                                  child:
                                                                      RichText(
                                                                    textScaler:
                                                                        MediaQuery.of(context)
                                                                            .textScaler,
                                                                    text:
                                                                        TextSpan(
                                                                      children: [
                                                                        TextSpan(
                                                                          text: (int var1, int var2, String var3, String var4) {
                                                                            return var1 > var2
                                                                                ? var3
                                                                                : var4;
                                                                          }(
                                                                              getJsonField(
                                                                                FFAppState().matchData,
                                                                                r'''$.fact.home_last_matches.performance''',
                                                                              ),
                                                                              getJsonField(
                                                                                FFAppState().matchData,
                                                                                r'''$.fact.away_last_matches.performance''',
                                                                              ),
                                                                              getJsonField(
                                                                                FFAppState().matchData,
                                                                                r'''$.home_team.name''',
                                                                              ).toString(),
                                                                              getJsonField(
                                                                                FFAppState().matchData,
                                                                                r'''$.away_team.name''',
                                                                              ).toString()),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'g628mz22' /*  are o performanță mai bună în... */,
                                                                          ),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text: (int var1, int var2, String var3, String var4) {
                                                                            return var1 > var2
                                                                                ? var4
                                                                                : var3;
                                                                          }(
                                                                              getJsonField(
                                                                                FFAppState().matchData,
                                                                                r'''$.fact.home_last_matches.performance''',
                                                                              ),
                                                                              getJsonField(
                                                                                FFAppState().matchData,
                                                                                r'''$.fact.away_last_matches.performance''',
                                                                              ),
                                                                              getJsonField(
                                                                                FFAppState().matchData,
                                                                                r'''$.home_team.name''',
                                                                              ).toString(),
                                                                              getJsonField(
                                                                                FFAppState().matchData,
                                                                                r'''$.away_team.name''',
                                                                              ).toString()),
                                                                          style:
                                                                              TextStyle(),
                                                                        )
                                                                      ],
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Gelion',
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 5.0)),
                                                            ),
                                                          ),
                                                        if ((int var1) {
                                                          return var1 != null &&
                                                              var1 > 1;
                                                        }(getJsonField(
                                                          FFAppState()
                                                              .matchData,
                                                          r'''$.fact.last_matches_count''',
                                                        )))
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '0o42op6y' /* - */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Gelion',
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                                Flexible(
                                                                  child:
                                                                      RichText(
                                                                    textScaler:
                                                                        MediaQuery.of(context)
                                                                            .textScaler,
                                                                    text:
                                                                        TextSpan(
                                                                      children: [
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'eukejz9x' /* În ultimele 5 meciuri  */,
                                                                          ),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              getJsonField(
                                                                            FFAppState().matchData,
                                                                            r'''$.home_team.name''',
                                                                          ).toString(),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'c84g1u3u' /*  a câștigat  */,
                                                                          ),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              getJsonField(
                                                                            FFAppState().matchData,
                                                                            r'''$.fact.home_win''',
                                                                          ).toString(),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'mimizh7j' /* , iar  */,
                                                                          ),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              getJsonField(
                                                                            FFAppState().matchData,
                                                                            r'''$.away_team.name''',
                                                                          ).toString(),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'wcxf3kj0' /*  a câștigat  */,
                                                                          ),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              getJsonField(
                                                                            FFAppState().matchData,
                                                                            r'''$.fact.away_win''',
                                                                          ).toString(),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'nwgtu5db' /* . */,
                                                                          ),
                                                                          style:
                                                                              TextStyle(),
                                                                        )
                                                                      ],
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Gelion',
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 5.0)),
                                                            ),
                                                          ),
                                                        if ((String? var1) {
                                                          return (double.tryParse(
                                                                      var1 ??
                                                                          '') ??
                                                                  0) >
                                                              0;
                                                        }(getJsonField(
                                                          FFAppState()
                                                              .matchData,
                                                          r'''$.fact.average_total_h2h''',
                                                        ).toString()))
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'y68jx1qk' /* - */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Gelion',
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                                Flexible(
                                                                  child:
                                                                      RichText(
                                                                    textScaler:
                                                                        MediaQuery.of(context)
                                                                            .textScaler,
                                                                    text:
                                                                        TextSpan(
                                                                      children: [
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'ltefym6c' /* Numărul mediu de goluri în mec... */,
                                                                          ),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              getJsonField(
                                                                            FFAppState().matchData,
                                                                            r'''$.home_team.name''',
                                                                          ).toString(),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'en33qpx9' /*  și  */,
                                                                          ),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              getJsonField(
                                                                            FFAppState().matchData,
                                                                            r'''$.away_team.name''',
                                                                          ).toString(),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            '4guw7nss' /*  este de  */,
                                                                          ),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text: double.parse(getJsonField(
                                                                            FFAppState().matchData,
                                                                            r'''$.fact.average_total_h2h''',
                                                                          ).toString())
                                                                              .toStringAsFixed(2),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            '03ok8ofn' /* . */,
                                                                          ),
                                                                          style:
                                                                              TextStyle(),
                                                                        )
                                                                      ],
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Gelion',
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 5.0)),
                                                            ),
                                                          ),
                                                        if ((String? var1,
                                                                String? var2) {
                                                          return var1 !=
                                                                  "null" &&
                                                              var2 != "null";
                                                        }(
                                                            getJsonField(
                                                              FFAppState()
                                                                  .matchData,
                                                              r'''$.fact.home_average_score''',
                                                            ).toString(),
                                                            getJsonField(
                                                              FFAppState()
                                                                  .matchData,
                                                              r'''$.fact.away_average_score''',
                                                            ).toString()))
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'yb4en5dl' /* - */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Gelion',
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                                Flexible(
                                                                  child:
                                                                      RichText(
                                                                    textScaler:
                                                                        MediaQuery.of(context)
                                                                            .textScaler,
                                                                    text:
                                                                        TextSpan(
                                                                      children: [
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'wxwyo31c' /* În medie,  */,
                                                                          ),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              getJsonField(
                                                                            FFAppState().matchData,
                                                                            r'''$.home_team.name''',
                                                                          ).toString(),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            '7jg19flz' /*  marchează  */,
                                                                          ),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text: double.parse(getJsonField(
                                                                            FFAppState().matchData,
                                                                            r'''$.fact.home_average_score''',
                                                                          ).toString())
                                                                              .toStringAsFixed(2),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'ke6u2dig' /*  goluri când joacă acasă, iar  */,
                                                                          ),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              getJsonField(
                                                                            FFAppState().matchData,
                                                                            r'''$.away_team.name''',
                                                                          ).toString(),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            '4763ws44' /*  marchează  */,
                                                                          ),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text: double.parse(getJsonField(
                                                                            FFAppState().matchData,
                                                                            r'''$.fact.away_average_score''',
                                                                          ).toString())
                                                                              .toStringAsFixed(2),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'kza5fxga' /*  goluri când joacă în deplasar... */,
                                                                          ),
                                                                          style:
                                                                              TextStyle(),
                                                                        )
                                                                      ],
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Gelion',
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 5.0)),
                                                            ),
                                                          ),
                                                        if ((String? var1,
                                                                String? var2) {
                                                          return var1 !=
                                                                  "null" &&
                                                              var2 != "null";
                                                        }(
                                                            getJsonField(
                                                              FFAppState()
                                                                  .matchData,
                                                              r'''$.fact.average_home_h2h''',
                                                            ).toString(),
                                                            getJsonField(
                                                              FFAppState()
                                                                  .matchData,
                                                              r'''$.fact.average_away_h2h''',
                                                            ).toString()))
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'sjd7twbq' /* - */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Gelion',
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                                Flexible(
                                                                  child:
                                                                      RichText(
                                                                    textScaler:
                                                                        MediaQuery.of(context)
                                                                            .textScaler,
                                                                    text:
                                                                        TextSpan(
                                                                      children: [
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'xf7wocjp' /* În medie,  */,
                                                                          ),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              getJsonField(
                                                                            FFAppState().matchData,
                                                                            r'''$.home_team.name''',
                                                                          ).toString(),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'lnuzfn7f' /*  marchează  */,
                                                                          ),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text: double.parse(getJsonField(
                                                                            FFAppState().matchData,
                                                                            r'''$.fact.average_home_h2h''',
                                                                          ).toString())
                                                                              .toStringAsFixed(2),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'ti54reto' /*  goluri într-un meci contra  */,
                                                                          ),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              getJsonField(
                                                                            FFAppState().matchData,
                                                                            r'''$.away_team.name''',
                                                                          ).toString(),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'ep2kagpj' /* , iar  */,
                                                                          ),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              getJsonField(
                                                                            FFAppState().matchData,
                                                                            r'''$.away_team.name''',
                                                                          ).toString(),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'uqf5gwwz' /*  marchează  */,
                                                                          ),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text: double.parse(getJsonField(
                                                                            FFAppState().matchData,
                                                                            r'''$.fact.average_away_h2h''',
                                                                          ).toString())
                                                                              .toStringAsFixed(2),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            '0zrhg77u' /*  goluri contra  */,
                                                                          ),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              getJsonField(
                                                                            FFAppState().matchData,
                                                                            r'''$.home_team.name''',
                                                                          ).toString(),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'rqvhwzys' /* . */,
                                                                          ),
                                                                          style:
                                                                              TextStyle(),
                                                                        )
                                                                      ],
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Gelion',
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 5.0)),
                                                            ),
                                                          ),
                                                        if ((int var1,
                                                                int var2) {
                                                          return var1 != var2;
                                                        }(
                                                            getJsonField(
                                                              FFAppState()
                                                                  .matchData,
                                                              r'''$.fact.last_meeting_home_score''',
                                                            ),
                                                            getJsonField(
                                                              FFAppState()
                                                                  .matchData,
                                                              r'''$.fact.last_meeting_away_score''',
                                                            )))
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '8r4qtxha' /* - */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Gelion',
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                ),
                                                                Flexible(
                                                                  child:
                                                                      RichText(
                                                                    textScaler:
                                                                        MediaQuery.of(context)
                                                                            .textScaler,
                                                                    text:
                                                                        TextSpan(
                                                                      children: [
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            't5dyuxmr' /* În ultimul meci direct dintre ... */,
                                                                          ),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text: (String var1, String var2, String var3) {
                                                                            return var1 == "home"
                                                                                ? var2
                                                                                : var3;
                                                                          }(
                                                                              getJsonField(
                                                                                FFAppState().matchData,
                                                                                r'''$.fact.last_meeting_won''',
                                                                              ).toString(),
                                                                              getJsonField(
                                                                                FFAppState().matchData,
                                                                                r'''$.home_team.name''',
                                                                              ).toString(),
                                                                              getJsonField(
                                                                                FFAppState().matchData,
                                                                                r'''$.away_team.name''',
                                                                              ).toString()),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'ypfag02i' /*  a câștigat la o diferență de  */,
                                                                          ),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text: ((getJsonField(
                                                                                        FFAppState().matchData,
                                                                                        r'''$.fact.last_meeting_home_score''',
                                                                                      ) -
                                                                                      getJsonField(
                                                                                        FFAppState().matchData,
                                                                                        r'''$.fact.last_meeting_away_score''',
                                                                                      ))
                                                                                  .abs())
                                                                              .toString(),
                                                                          style:
                                                                              TextStyle(),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'npj6qstk' /*  goluri. */,
                                                                          ),
                                                                          style:
                                                                              TextStyle(),
                                                                        )
                                                                      ],
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Gelion',
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 5.0)),
                                                            ),
                                                          ),
                                                      ].divide(SizedBox(
                                                          height: 5.0)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 10.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'zdwc65u2' /* Echipele de start */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Gelion',
                                                        color: Colors.black,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 20.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Flexible(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.5,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .black,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            20.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            20.0),
                                                                  ),
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          5.0,
                                                                          10.0,
                                                                          5.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        getJsonField(
                                                                          FFAppState()
                                                                              .matchData,
                                                                          r'''$.home_team.name''',
                                                                        ).toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Gelion',
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                      if (getJsonField(
                                                                                FFAppState().matchData,
                                                                                r'''$.status''',
                                                                              ) ==
                                                                              1 ||
                                                                          getJsonField(
                                                                                FFAppState().matchData,
                                                                                r'''$.status''',
                                                                              ) ==
                                                                              3)
                                                                        Text(
                                                                          getJsonField(
                                                                            FFAppState().matchData,
                                                                            r'''$.home_team_formation''',
                                                                          ).toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Gelion',
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: false,
                                                                              ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Flexible(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.5,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .black,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            20.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            20.0),
                                                                  ),
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          5.0,
                                                                          10.0,
                                                                          5.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        getJsonField(
                                                                          FFAppState()
                                                                              .matchData,
                                                                          r'''$.away_team.name''',
                                                                        ).toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Gelion',
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                      if (getJsonField(
                                                                                FFAppState().matchData,
                                                                                r'''$.status''',
                                                                              ) ==
                                                                              1 ||
                                                                          getJsonField(
                                                                                FFAppState().matchData,
                                                                                r'''$.status''',
                                                                              ) ==
                                                                              3)
                                                                        Text(
                                                                          getJsonField(
                                                                            FFAppState().matchData,
                                                                            r'''$.away_team_formation''',
                                                                          ).toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Gelion',
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: false,
                                                                              ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: Builder(
                                                            builder: (context) {
                                                              final homeTeamPlayer =
                                                                  getJsonField(
                                                                FFAppState()
                                                                    .matchData,
                                                                r'''$.home_team.players''',
                                                              )
                                                                      .toList()
                                                                      .take(12)
                                                                      .toList();
                                                              return ListView
                                                                  .builder(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    homeTeamPlayer
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        homeTeamPlayerIndex) {
                                                                  final homeTeamPlayerItem =
                                                                      homeTeamPlayer[
                                                                          homeTeamPlayerIndex];
                                                                  return Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            5.0,
                                                                            5.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.5,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBtnText,
                                                                            borderRadius:
                                                                                BorderRadius.circular(5.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: Color(0xFF787878),
                                                                              width: 2.0,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                15.0,
                                                                                5.0,
                                                                                15.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  children: [
                                                                                    ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                      child: Image.network(
                                                                                        valueOrDefault<String>(
                                                                                          getJsonField(
                                                                                            homeTeamPlayerItem,
                                                                                            r'''$.country_flag''',
                                                                                          )?.toString(),
                                                                                          'https://ebt-static.s3.eu-central-1.amazonaws.com/images_so/country/unknown-x300.svg.png',
                                                                                        ),
                                                                                        width: 35.0,
                                                                                        height: 25.0,
                                                                                        fit: BoxFit.fill,
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      width: MediaQuery.sizeOf(context).width / 2 - 100,
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                        child: Text(
                                                                                          getJsonField(
                                                                                            homeTeamPlayerItem,
                                                                                            r'''$.name''',
                                                                                          ).toString(),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Gelion',
                                                                                                color: Colors.black,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: false,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                if (getJsonField(
                                                                                      homeTeamPlayerItem,
                                                                                      r'''$.subs''',
                                                                                    ) !=
                                                                                    null)
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Builder(
                                                                                        builder: (context) {
                                                                                          final subplayer = getJsonField(
                                                                                            homeTeamPlayerItem,
                                                                                            r'''$.subs''',
                                                                                          ).toList();
                                                                                          return Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: List.generate(subplayer.length, (subplayerIndex) {
                                                                                              final subplayerItem = subplayer[subplayerIndex];
                                                                                              return Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Icon(
                                                                                                    Icons.repeat,
                                                                                                    color: Color(0xFF0378ED),
                                                                                                    size: 24.0,
                                                                                                  ),
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                    children: [
                                                                                                      if (getJsonField(
                                                                                                            subplayerItem,
                                                                                                            r'''$.country_flag''',
                                                                                                          ) !=
                                                                                                          null)
                                                                                                        ClipRRect(
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                          child: Image.network(
                                                                                                            valueOrDefault<String>(
                                                                                                              getJsonField(
                                                                                                                subplayerItem,
                                                                                                                r'''$.country_flag''',
                                                                                                              )?.toString(),
                                                                                                              'https://ebt-static.s3.eu-central-1.amazonaws.com/images_so/country/unknown-x300.svg.png',
                                                                                                            ),
                                                                                                            width: 35.0,
                                                                                                            height: 25.0,
                                                                                                            fit: BoxFit.fill,
                                                                                                          ),
                                                                                                        ),
                                                                                                      Flexible(
                                                                                                        child: Container(
                                                                                                          width: MediaQuery.sizeOf(context).width / 2 - 100,
                                                                                                          decoration: BoxDecoration(),
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                            child: Text(
                                                                                                              getJsonField(
                                                                                                                subplayerItem,
                                                                                                                r'''$.substitution''',
                                                                                                              ).toString(),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Gelion',
                                                                                                                    color: Color(0xFF0378ED),
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    useGoogleFonts: false,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ],
                                                                                              );
                                                                                            }),
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                                controller: _model
                                                                    .homeListView,
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Builder(
                                                            builder: (context) {
                                                              final awayTeamPlayer =
                                                                  getJsonField(
                                                                FFAppState()
                                                                    .matchData,
                                                                r'''$.away_team.players''',
                                                              )
                                                                      .toList()
                                                                      .take(12)
                                                                      .toList();
                                                              return ListView
                                                                  .builder(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    awayTeamPlayer
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        awayTeamPlayerIndex) {
                                                                  final awayTeamPlayerItem =
                                                                      awayTeamPlayer[
                                                                          awayTeamPlayerIndex];
                                                                  return Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            5.0,
                                                                            5.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.5,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBtnText,
                                                                            borderRadius:
                                                                                BorderRadius.circular(5.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: Color(0xFF787878),
                                                                              width: 2.0,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                15.0,
                                                                                5.0,
                                                                                15.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                      child: Image.network(
                                                                                        valueOrDefault<String>(
                                                                                          getJsonField(
                                                                                            awayTeamPlayerItem,
                                                                                            r'''$.country_flag''',
                                                                                          )?.toString(),
                                                                                          'https://ebt-static.s3.eu-central-1.amazonaws.com/images_so/country/unknown-x300.svg.png',
                                                                                        ),
                                                                                        width: 35.0,
                                                                                        height: 25.0,
                                                                                        fit: BoxFit.fill,
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      width: MediaQuery.sizeOf(context).width / 2 - 100,
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                        child: Text(
                                                                                          getJsonField(
                                                                                            awayTeamPlayerItem,
                                                                                            r'''$.name''',
                                                                                          ).toString(),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'Gelion',
                                                                                                color: Colors.black,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: false,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                if (getJsonField(
                                                                                      awayTeamPlayerItem,
                                                                                      r'''$.subs''',
                                                                                    ) !=
                                                                                    null)
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Builder(
                                                                                        builder: (context) {
                                                                                          final subplayer = getJsonField(
                                                                                            awayTeamPlayerItem,
                                                                                            r'''$.subs''',
                                                                                          ).toList();
                                                                                          return Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: List.generate(subplayer.length, (subplayerIndex) {
                                                                                              final subplayerItem = subplayer[subplayerIndex];
                                                                                              return Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Icon(
                                                                                                    Icons.repeat,
                                                                                                    color: Color(0xFF0378ED),
                                                                                                    size: 24.0,
                                                                                                  ),
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                    children: [
                                                                                                      if (getJsonField(
                                                                                                            subplayerItem,
                                                                                                            r'''$.country_flag''',
                                                                                                          ) !=
                                                                                                          null)
                                                                                                        ClipRRect(
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                          child: Image.network(
                                                                                                            valueOrDefault<String>(
                                                                                                              getJsonField(
                                                                                                                subplayerItem,
                                                                                                                r'''$.country_flag''',
                                                                                                              )?.toString(),
                                                                                                              'https://ebt-static.s3.eu-central-1.amazonaws.com/images_so/country/unknown-x300.svg.png',
                                                                                                            ),
                                                                                                            width: 35.0,
                                                                                                            height: 25.0,
                                                                                                            fit: BoxFit.fill,
                                                                                                          ),
                                                                                                        ),
                                                                                                      Flexible(
                                                                                                        child: Container(
                                                                                                          width: MediaQuery.sizeOf(context).width / 2 - 100,
                                                                                                          decoration: BoxDecoration(),
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                            child: Text(
                                                                                                              getJsonField(
                                                                                                                subplayerItem,
                                                                                                                r'''$.substitution''',
                                                                                                              ).toString(),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: 'Gelion',
                                                                                                                    color: Color(0xFF0378ED),
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    useGoogleFonts: false,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ],
                                                                                              );
                                                                                            }),
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                                controller: _model
                                                                    .awayListView,
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              wrapWithModel(
                                                model: _model.footerModel,
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: FooterWidget(),
                                              ),
                                            ].divide(SizedBox(height: 0.0)),
                                          ),
                                        ),
                                      ),
                                    if (_model.loading && _model.netStatus)
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: wrapWithModel(
                                          model: _model.loadingModel,
                                          updateCallback: () => setState(() {}),
                                          child: LoadingWidget(),
                                        ),
                                      ),
                                    if (!_model.netStatus)
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: wrapWithModel(
                                          model: _model.neterrorModel,
                                          updateCallback: () => setState(() {}),
                                          child: NeterrorWidget(),
                                        ),
                                      ),
                                  ],
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation']!),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: wrapWithModel(
                        model: _model.navbarModel,
                        updateCallback: () => setState(() {}),
                        child: NavbarWidget(
                          selected: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

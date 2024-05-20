import '/components/choice_button_widget.dart';
import '/components/footer_widget.dart';
import '/components/loading_widget.dart';
import '/components/navbar_widget.dart';
import '/components/neterror_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:styled_divider/styled_divider.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _model.loadData(context);
      setState(() {});
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
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 1000.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 100.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'dividerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 100.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 100.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 500.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 100.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 700.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 100.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 900.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 100.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation6': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 1100.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 100.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation7': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 1300.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 100.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation8': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 1500.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 100.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation9': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 1700.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 100.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation10': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 1900.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 100.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation11': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 2100.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 100.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation12': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 2300.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 100.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation13': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 2500.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 100.0),
            end: const Offset(0.0, 0.0),
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
        title: 'HomePage',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: const Color(0xFF1D242F),
            floatingActionButton: Opacity(
              opacity: 0.4,
              child: FloatingActionButton(
                onPressed: () async {
                  await _model.matchListView?.animateTo(
                    0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                },
                backgroundColor: const Color(0xFFE0E3E7),
                elevation: 8.0,
                child: const Icon(
                  Icons.keyboard_double_arrow_up,
                  color: Colors.black,
                  size: 36.0,
                ),
              ),
            ),
            drawer: SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.85,
              child: Drawer(
                elevation: 16.0,
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE0E3E7),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'gii5ykve' /* LIGI pentru tine */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Gelion',
                                    color: Colors.black,
                                    fontSize: 40.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                        ).animateOnPageLoad(
                            animationsMap['textOnPageLoadAnimation']!),
                        const Divider(
                          thickness: 1.0,
                          color: Color(0xB2262D34),
                        ).animateOnPageLoad(
                            animationsMap['dividerOnPageLoadAnimation']!),
                        Flexible(
                          child: SingleChildScrollView(
                            primary: false,
                            controller: _model.columnController,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFE0E3E7),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x33000000),
                                        offset: Offset(
                                          0.0,
                                          2.0,
                                        ),
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'LeaguePage',
                                          queryParameters: {
                                            'leagueName': serializeParam(
                                              '2023-2024-romania-liga-i',
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );

                                        if (scaffoldKey
                                                .currentState!.isDrawerOpen ||
                                            scaffoldKey.currentState!
                                                .isEndDrawerOpen) {
                                          Navigator.pop(context);
                                        }
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/romanianFlag.png',
                                              width: 50.0,
                                              height: 35.0,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Flexible(
                                            child: AutoSizeText(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '78at51ze' /* România: Liga I */,
                                              ),
                                              maxLines: 1,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Gelion',
                                                        color: Colors.black,
                                                        fontSize: 25.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 10.0)),
                                      ),
                                    ),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation2']!),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFE0E3E7),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x33000000),
                                        offset: Offset(
                                          0.0,
                                          2.0,
                                        ),
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'LeaguePage',
                                          queryParameters: {
                                            'leagueName': serializeParam(
                                              '2023-2024-romania-liga-ii',
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );

                                        if (scaffoldKey
                                                .currentState!.isDrawerOpen ||
                                            scaffoldKey.currentState!
                                                .isEndDrawerOpen) {
                                          Navigator.pop(context);
                                        }
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/romanianFlag.png',
                                              width: 50.0,
                                              height: 35.0,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Flexible(
                                            child: AutoSizeText(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '5srzqziv' /* România: Liga II */,
                                              ),
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Gelion',
                                                        color: Colors.black,
                                                        fontSize: 25.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 10.0)),
                                      ),
                                    ),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation3']!),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFE0E3E7),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x33000000),
                                        offset: Offset(
                                          0.0,
                                          2.0,
                                        ),
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'LeaguePage',
                                          queryParameters: {
                                            'leagueName': serializeParam(
                                              '2023-2024-uefa-champions-league',
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );

                                        if (scaffoldKey
                                                .currentState!.isDrawerOpen ||
                                            scaffoldKey.currentState!
                                                .isEndDrawerOpen) {
                                          Navigator.pop(context);
                                        }
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/union.png',
                                              width: 50.0,
                                              height: 35.0,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Flexible(
                                            child: AutoSizeText(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'sr44yvcf' /* UEFA Liga Campionilor */,
                                              ),
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Gelion',
                                                        color: Colors.black,
                                                        fontSize: 25.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 10.0)),
                                      ),
                                    ),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation4']!),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFE0E3E7),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x33000000),
                                        offset: Offset(
                                          0.0,
                                          2.0,
                                        ),
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'LeaguePage',
                                          queryParameters: {
                                            'leagueName': serializeParam(
                                              '2023-2024-uefa-europa-league',
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );

                                        if (scaffoldKey
                                                .currentState!.isDrawerOpen ||
                                            scaffoldKey.currentState!
                                                .isEndDrawerOpen) {
                                          Navigator.pop(context);
                                        }
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/europaLeague.png',
                                              width: 50.0,
                                              height: 35.0,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Flexible(
                                            child: AutoSizeText(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'yypf690l' /* UEFA Europa League */,
                                              ),
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Gelion',
                                                        color: Colors.black,
                                                        fontSize: 25.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 10.0)),
                                      ),
                                    ),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation5']!),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFE0E3E7),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x33000000),
                                        offset: Offset(
                                          0.0,
                                          2.0,
                                        ),
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'LeaguePage',
                                          queryParameters: {
                                            'leagueName': serializeParam(
                                              '2023-2024-uefa-europa-conference-league',
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );

                                        if (scaffoldKey
                                                .currentState!.isDrawerOpen ||
                                            scaffoldKey.currentState!
                                                .isEndDrawerOpen) {
                                          Navigator.pop(context);
                                        }
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/conferenceLeague.jpg',
                                              width: 50.0,
                                              height: 35.0,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Flexible(
                                            child: AutoSizeText(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'clcsf0zi' /* UEFA Europa Conference League */,
                                              ),
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Gelion',
                                                        color: Colors.black,
                                                        fontSize: 25.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 10.0)),
                                      ),
                                    ),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation6']!),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFE0E3E7),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x33000000),
                                        offset: Offset(
                                          0.0,
                                          2.0,
                                        ),
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'LeaguePage',
                                          queryParameters: {
                                            'leagueName': serializeParam(
                                              '2023-2024-england-premier-league',
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );

                                        if (scaffoldKey
                                                .currentState!.isDrawerOpen ||
                                            scaffoldKey.currentState!
                                                .isEndDrawerOpen) {
                                          Navigator.pop(context);
                                        }
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/england.png',
                                              width: 50.0,
                                              height: 35.0,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Flexible(
                                            child: AutoSizeText(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'f5yn50dh' /* Anglia: Premier League */,
                                              ),
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Gelion',
                                                        color: Colors.black,
                                                        fontSize: 25.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 10.0)),
                                      ),
                                    ),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation7']!),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFE0E3E7),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x33000000),
                                        offset: Offset(
                                          0.0,
                                          2.0,
                                        ),
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'LeaguePage',
                                          queryParameters: {
                                            'leagueName': serializeParam(
                                              '2023-2024-germany-bundesliga',
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );

                                        if (scaffoldKey
                                                .currentState!.isDrawerOpen ||
                                            scaffoldKey.currentState!
                                                .isEndDrawerOpen) {
                                          Navigator.pop(context);
                                        }
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/germany.png',
                                              width: 50.0,
                                              height: 35.0,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Flexible(
                                            child: AutoSizeText(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'xtufz4lk' /* Germania: Bundesliga */,
                                              ),
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Gelion',
                                                        color: Colors.black,
                                                        fontSize: 25.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 10.0)),
                                      ),
                                    ),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation8']!),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFE0E3E7),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x33000000),
                                        offset: Offset(
                                          0.0,
                                          2.0,
                                        ),
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'LeaguePage',
                                          queryParameters: {
                                            'leagueName': serializeParam(
                                              '2023-2024-spain-la-liga',
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );

                                        if (scaffoldKey
                                                .currentState!.isDrawerOpen ||
                                            scaffoldKey.currentState!
                                                .isEndDrawerOpen) {
                                          Navigator.pop(context);
                                        }
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/spanish.png',
                                              width: 50.0,
                                              height: 35.0,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Flexible(
                                            child: AutoSizeText(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ia1vi6lc' /* Spania: La Liga */,
                                              ),
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Gelion',
                                                        color: Colors.black,
                                                        fontSize: 25.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 10.0)),
                                      ),
                                    ),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation9']!),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFE0E3E7),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x33000000),
                                        offset: Offset(
                                          0.0,
                                          2.0,
                                        ),
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'LeaguePage',
                                          queryParameters: {
                                            'leagueName': serializeParam(
                                              '2023-2024-france-ligue-1',
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );

                                        if (scaffoldKey
                                                .currentState!.isDrawerOpen ||
                                            scaffoldKey.currentState!
                                                .isEndDrawerOpen) {
                                          Navigator.pop(context);
                                        }
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/france.png',
                                              width: 50.0,
                                              height: 35.0,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Flexible(
                                            child: AutoSizeText(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'kpo5zp7t' /* Franța: Ligue 1 */,
                                              ),
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Gelion',
                                                        color: Colors.black,
                                                        fontSize: 25.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 10.0)),
                                      ),
                                    ),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation10']!),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFE0E3E7),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x33000000),
                                        offset: Offset(
                                          0.0,
                                          2.0,
                                        ),
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'LeaguePage',
                                          queryParameters: {
                                            'leagueName': serializeParam(
                                              '2023-2024-italy-serie-a',
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );

                                        if (scaffoldKey
                                                .currentState!.isDrawerOpen ||
                                            scaffoldKey.currentState!
                                                .isEndDrawerOpen) {
                                          Navigator.pop(context);
                                        }
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/italy.png',
                                              width: 50.0,
                                              height: 35.0,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Flexible(
                                            child: AutoSizeText(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'lbx135o1' /* Italia: Serie A */,
                                              ),
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Gelion',
                                                        color: Colors.black,
                                                        fontSize: 25.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 10.0)),
                                      ),
                                    ),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation11']!),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFE0E3E7),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x33000000),
                                        offset: Offset(
                                          0.0,
                                          2.0,
                                        ),
                                      )
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'LeaguePage',
                                          queryParameters: {
                                            'leagueName': serializeParam(
                                              '2023-2024-netherlands-eredivisie',
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );

                                        if (scaffoldKey
                                                .currentState!.isDrawerOpen ||
                                            scaffoldKey.currentState!
                                                .isEndDrawerOpen) {
                                          Navigator.pop(context);
                                        }
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/netherlands.png',
                                              width: 50.0,
                                              height: 35.0,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Flexible(
                                            child: AutoSizeText(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '7ep2m6kp' /* Olanda: Eredivisie */,
                                              ),
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Gelion',
                                                        color: Colors.black,
                                                        fontSize: 25.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 10.0)),
                                      ),
                                    ),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation12']!),
                                if (false)
                                  Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFE0E3E7),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x33000000),
                                          offset: Offset(
                                            0.0,
                                            2.0,
                                          ),
                                        )
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'LeaguePage',
                                            queryParameters: {
                                              'leagueName': serializeParam(
                                                '2024-ec-qualification',
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );

                                          if (scaffoldKey
                                                  .currentState!.isDrawerOpen ||
                                              scaffoldKey.currentState!
                                                  .isEndDrawerOpen) {
                                            Navigator.pop(context);
                                          }
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/euro2024.png',
                                                width: 50.0,
                                                height: 35.0,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            Flexible(
                                              child: AutoSizeText(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'j015i2g1' /* Euro 2024 */,
                                                ),
                                                textAlign: TextAlign.start,
                                                maxLines: 1,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Gelion',
                                                          color: Colors.black,
                                                          fontSize: 25.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ),
                                          ].divide(const SizedBox(width: 10.0)),
                                        ),
                                      ),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation13']!),
                              ].divide(const SizedBox(height: 1.0)),
                            ),
                          ),
                        ),
                      ].divide(const SizedBox(height: 10.0)),
                    ),
                  ),
                ),
              ),
            ),
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(65.0),
              child: AppBar(
                backgroundColor: const Color(0xFF1D242F),
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
                        scaffoldKey.currentState!.openDrawer();
                      },
                      child: const Icon(
                        Icons.output,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Image.asset(
                          'assets/images/cropped-logo-darkx300-compressor.png',
                          width: 280.0,
                          height: 56.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: const BoxDecoration(),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          HapticFeedback.lightImpact();
                          setState(() {
                            _model.loading = true;
                            _model.netstatus = true;
                          });
                          await Future.wait([
                            Future(() async {
                              if (animationsMap[
                                      'iconOnActionTriggerAnimation'] !=
                                  null) {
                                animationsMap['iconOnActionTriggerAnimation']!
                                    .controller
                                    .forward(from: 0.0);
                              }
                            }),
                            Future(() async {
                              await _model.loadData(context);
                              setState(() {});
                              await _model.matchListView?.animateTo(
                                0,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            }),
                          ]);
                        },
                        child: const Icon(
                          FFIcons.kspin3,
                          color: Colors.white,
                          size: 25.0,
                        ),
                      ).animateOnActionTrigger(
                        animationsMap['iconOnActionTriggerAnimation']!,
                      ),
                    ),
                  ].divide(const SizedBox(width: 10.0)),
                ),
                actions: const [],
                centerTitle: false,
                toolbarHeight: 63.0,
                elevation: 2.0,
              ),
            ),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF1D242F),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              decoration: BoxDecoration(
                                color: const Color(0xFFEBEBEB),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Stack(
                                children: [
                                  if (!_model.loading && _model.netstatus)
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'co9cyfy9' /* Cote Pariuri Fotbal */,
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Play',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 24.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 5.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
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
                                                  onTap: () async {
                                                    setState(() {
                                                      FFAppState().bet =
                                                          !FFAppState().bet;
                                                    });
                                                  },
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .choiceButtonModel,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child: ChoiceButtonWidget(
                                                      choice: !FFAppState().bet,
                                                      text1: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '30bb6jvn' /* Minimizați */,
                                                      ),
                                                      text2: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'v7p3b9g6' /* Extinde */,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          StyledDivider(
                                            thickness: 1.0,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            lineStyle: DividerLineStyle.dotted,
                                          ),
                                          Expanded(
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.7,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFEBEBEB),
                                                boxShadow: const [
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
                                                    BorderRadius.circular(10.0),
                                                border: Border.all(
                                                  color: const Color(0x17626262),
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: Builder(
                                                builder: (context) {
                                                  final iD = getJsonField(
                                                    FFAppState().data,
                                                    r'''$.matchesGrouped''',
                                                  ).toList();
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount: iD.length,
                                                    itemBuilder:
                                                        (context, iDIndex) {
                                                      final iDItem =
                                                          iD[iDIndex];
                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            height: 80.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: const Color(
                                                                  0xFFD8DDEA),
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        10.0),
                                                              ),
                                                              border:
                                                                  Border.all(
                                                                color: const Color(
                                                                    0xFFD8DDEA),
                                                              ),
                                                            ),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                context
                                                                    .pushNamed(
                                                                  'LeaguePage',
                                                                  queryParameters:
                                                                      {
                                                                    'leagueName':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        iDItem,
                                                                        r'''$.slug''',
                                                                      ).toString(),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                  }.withoutNulls,
                                                                  extra: <String,
                                                                      dynamic>{
                                                                    kTransitionInfoKey:
                                                                        const TransitionInfo(
                                                                      hasTransition:
                                                                          true,
                                                                      transitionType:
                                                                          PageTransitionType
                                                                              .leftToRight,
                                                                      duration: Duration(
                                                                          milliseconds:
                                                                              100),
                                                                    ),
                                                                  },
                                                                );
                                                              },
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            5.0,
                                                                            10.0,
                                                                            5.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            if (getJsonField(
                                                                              iDItem,
                                                                              r'''$.logo''',
                                                                            ).toString().isNotEmpty)
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                child: Image.network(
                                                                                  getJsonField(
                                                                                    iDItem,
                                                                                    r'''$.logo''',
                                                                                  ).toString(),
                                                                                  width: 60.0,
                                                                                  height: 60.0,
                                                                                  fit: BoxFit.scaleDown,
                                                                                ),
                                                                              ),
                                                                            Expanded(
                                                                              child: Container(
                                                                                decoration: const BoxDecoration(),
                                                                                child: Text(
                                                                                  functions.toUpper(getJsonField(
                                                                                    iDItem,
                                                                                    r'''$.groupedTitle''',
                                                                                  ).toString()),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Gelion',
                                                                                        color: const Color(0xFFCD1C21),
                                                                                        fontSize: 16.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.bold,
                                                                                        useGoogleFonts: false,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  if (getJsonField(
                                                                        iDItem,
                                                                        r'''$.league.logo''',
                                                                      ) !=
                                                                      null)
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          10.0,
                                                                          10.0),
                                                                      child: Image
                                                                          .network(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          getJsonField(
                                                                            iDItem,
                                                                            r'''$.league.logo''',
                                                                          )?.toString(),
                                                                          '\$.league.logo_so_original',
                                                                        ),
                                                                        width:
                                                                            100.0,
                                                                        height:
                                                                            60.0,
                                                                        fit: BoxFit
                                                                            .scaleDown,
                                                                        alignment: const Alignment(
                                                                            1.0,
                                                                            0.0),
                                                                      ),
                                                                    ),
                                                                ].divide(const SizedBox(
                                                                    width:
                                                                        5.0)),
                                                              ),
                                                            ),
                                                          ),
                                                          Builder(
                                                            builder: (context) {
                                                              final match =
                                                                  getJsonField(
                                                                iDItem,
                                                                r'''$.matches''',
                                                              ).toList();
                                                              return ListView
                                                                  .builder(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount: match
                                                                    .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        matchIndex) {
                                                                  final matchItem =
                                                                      match[
                                                                          matchIndex];
                                                                  return Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Builder(
                                                                        builder:
                                                                            (context) {
                                                                          final event =
                                                                              getJsonField(
                                                                            matchItem,
                                                                            r'''$.events''',
                                                                          ).toList();
                                                                          return ListView
                                                                              .builder(
                                                                            padding:
                                                                                EdgeInsets.zero,
                                                                            shrinkWrap:
                                                                                true,
                                                                            scrollDirection:
                                                                                Axis.vertical,
                                                                            itemCount:
                                                                                event.length,
                                                                            itemBuilder:
                                                                                (context, eventIndex) {
                                                                              final eventItem = event[eventIndex];
                                                                              return Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                    height: 30.0,
                                                                                    decoration: const BoxDecoration(
                                                                                      color: Color(0xFF232948),
                                                                                    ),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Container(
                                                                                          width: 74.0,
                                                                                          height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: () {
                                                                                              if (getJsonField(
                                                                                                        eventItem,
                                                                                                        r'''$.displayStatus''',
                                                                                                      ) ==
                                                                                                      1 &&
                                                                                                  getJsonField(
                                                                                                        eventItem,
                                                                                                        r'''$.is_live''',
                                                                                                      ) ==
                                                                                                      1) {
                                                                                                return const Color(0xFF39B931);
                                                                                              } else if (getJsonField(
                                                                                                    eventItem,
                                                                                                    r'''$.displayStatus''',
                                                                                                  ) ==
                                                                                                  4) {
                                                                                                return const Color(0xFF0378ED);
                                                                                              } else {
                                                                                                return const Color(0xFF616161);
                                                                                              }
                                                                                            }(),
                                                                                            border: Border.all(
                                                                                              color: () {
                                                                                                if (getJsonField(
                                                                                                          eventItem,
                                                                                                          r'''$.displayStatus''',
                                                                                                        ) ==
                                                                                                        1 &&
                                                                                                    getJsonField(
                                                                                                          eventItem,
                                                                                                          r'''$.is_live''',
                                                                                                        ) ==
                                                                                                        1) {
                                                                                                  return const Color(0xFF39B931);
                                                                                                } else if (getJsonField(
                                                                                                      eventItem,
                                                                                                      r'''$.displayStatus''',
                                                                                                    ) ==
                                                                                                    4) {
                                                                                                  return const Color(0xFF0378ED);
                                                                                                } else {
                                                                                                  return const Color(0xFF616161);
                                                                                                }
                                                                                              }(),
                                                                                            ),
                                                                                          ),
                                                                                          child: Align(
                                                                                            alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                            child: Text(
                                                                                              FFLocalizations.of(context).languageCode == 'ro'
                                                                                                  ? () {
                                                                                                      if (getJsonField(
                                                                                                                eventItem,
                                                                                                                r'''$.displayStatus''',
                                                                                                              ) ==
                                                                                                              1 &&
                                                                                                          getJsonField(
                                                                                                                eventItem,
                                                                                                                r'''$.is_live''',
                                                                                                              ) ==
                                                                                                              1) {
                                                                                                        return 'LIVE';
                                                                                                      } else if (getJsonField(
                                                                                                            eventItem,
                                                                                                            r'''$.displayStatus''',
                                                                                                          ) ==
                                                                                                          4) {
                                                                                                        return 'AMANAT';
                                                                                                      } else {
                                                                                                        return 'CURÂND';
                                                                                                      }
                                                                                                    }()
                                                                                                  : () {
                                                                                                      if (getJsonField(
                                                                                                                eventItem,
                                                                                                                r'''$.displayStatus''',
                                                                                                              ) ==
                                                                                                              1 &&
                                                                                                          getJsonField(
                                                                                                                eventItem,
                                                                                                                r'''$.is_live''',
                                                                                                              ) ==
                                                                                                              1) {
                                                                                                        return 'LIVE';
                                                                                                      } else if (getJsonField(
                                                                                                            eventItem,
                                                                                                            r'''$.displayStatus''',
                                                                                                          ) ==
                                                                                                          4) {
                                                                                                        return 'DELAYED';
                                                                                                      } else {
                                                                                                        return 'SOON';
                                                                                                      }
                                                                                                    }(),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'Gelion',
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: false,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(22.0, 0.0, 18.0, 3.0),
                                                                                          child: Text(
                                                                                            functions.convertDateFormat(getJsonField(
                                                                                              matchItem,
                                                                                              r'''$.date''',
                                                                                            ).toString()),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Gelion',
                                                                                                  color: const Color(0xFFD8DDEA),
                                                                                                  fontSize: 16.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.bold,
                                                                                                  useGoogleFonts: false,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                          child: Text(
                                                                                            functions.unixToTime(getJsonField(
                                                                                              eventItem,
                                                                                              r'''$.date_time''',
                                                                                            )),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'Gelion',
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: false,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: eventIndex % 2 == 1 ? const Color(0xFFEBEBEB) : Colors.white,
                                                                                      border: Border.all(
                                                                                        color: const Color(0xFFEBEBEB),
                                                                                      ),
                                                                                    ),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Container(
                                                                                          width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                          height: 75.0,
                                                                                          decoration: const BoxDecoration(),
                                                                                          child: Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                            child: InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                context.pushNamed(
                                                                                                  'MatchPage',
                                                                                                  queryParameters: {
                                                                                                    'matchSeries': serializeParam(
                                                                                                      getJsonField(
                                                                                                        iDItem,
                                                                                                        r'''$.groupedTitle''',
                                                                                                      ).toString(),
                                                                                                      ParamType.String,
                                                                                                    ),
                                                                                                    'id': serializeParam(
                                                                                                      getJsonField(
                                                                                                        eventItem,
                                                                                                        r'''$.id''',
                                                                                                      ),
                                                                                                      ParamType.int,
                                                                                                    ),
                                                                                                    'odd': serializeParam(
                                                                                                      getJsonField(
                                                                                                        eventItem,
                                                                                                        r'''$.odds''',
                                                                                                      ),
                                                                                                      ParamType.JSON,
                                                                                                    ),
                                                                                                  }.withoutNulls,
                                                                                                  extra: <String, dynamic>{
                                                                                                    kTransitionInfoKey: const TransitionInfo(
                                                                                                      hasTransition: true,
                                                                                                      transitionType: PageTransitionType.leftToRight,
                                                                                                    ),
                                                                                                  },
                                                                                                );
                                                                                              },
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                                    child: Container(
                                                                                                      width: (MediaQuery.sizeOf(context).width - 100) / 2,
                                                                                                      height: 75.0,
                                                                                                      decoration: const BoxDecoration(),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                                            children: [
                                                                                                              ClipRRect(
                                                                                                                borderRadius: BorderRadius.circular(10.0),
                                                                                                                child: Image.network(
                                                                                                                  getJsonField(
                                                                                                                    eventItem,
                                                                                                                    r'''$.homeTeam.logo_so_small''',
                                                                                                                  ).toString(),
                                                                                                                  width: 25.0,
                                                                                                                  height: 25.0,
                                                                                                                  fit: BoxFit.contain,
                                                                                                                ),
                                                                                                              ),
                                                                                                              if (valueOrDefault<bool>(
                                                                                                                getJsonField(
                                                                                                                          eventItem,
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
                                                                                                                                  eventItem,
                                                                                                                                  r'''$.homeTeamScore''',
                                                                                                                                ) ??
                                                                                                                                0) >
                                                                                                                            0
                                                                                                                        ? const Color(0xFFF9CF58)
                                                                                                                        : Colors.white,
                                                                                                                    borderRadius: BorderRadius.circular(5.0),
                                                                                                                    border: Border.all(
                                                                                                                      color: const Color(0xFFCCCCCC),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  child: Align(
                                                                                                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                    child: Text(
                                                                                                                      valueOrDefault<String>(
                                                                                                                        getJsonField(
                                                                                                                          eventItem,
                                                                                                                          r'''$.homeTeamScore''',
                                                                                                                        )?.toString(),
                                                                                                                        'null',
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: 'Gelion',
                                                                                                                            color: const Color(0xFFCD1C21),
                                                                                                                            fontSize: 16.0,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            fontWeight: FontWeight.w500,
                                                                                                                            useGoogleFonts: false,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                            ].divide(const SizedBox(width: 5.0)),
                                                                                                          ),
                                                                                                          Text(
                                                                                                            getJsonField(
                                                                                                              eventItem,
                                                                                                              r'''$.homeTeam.name''',
                                                                                                            ).toString(),
                                                                                                            textAlign: TextAlign.start,
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Gelion',
                                                                                                                  color: const Color(0xFFCD1C21),
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
                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                                    child: Container(
                                                                                                      width: (MediaQuery.sizeOf(context).width - 100) / 2,
                                                                                                      height: 75.0,
                                                                                                      decoration: const BoxDecoration(),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                                                                        children: [
                                                                                                          Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                                                                            children: [
                                                                                                              if (valueOrDefault<bool>(
                                                                                                                getJsonField(
                                                                                                                          eventItem,
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
                                                                                                                                  eventItem,
                                                                                                                                  r'''$.awayTeamScore''',
                                                                                                                                ) ??
                                                                                                                                0) >
                                                                                                                            0
                                                                                                                        ? const Color(0xFFF9CF58)
                                                                                                                        : Colors.white,
                                                                                                                    borderRadius: BorderRadius.circular(5.0),
                                                                                                                    border: Border.all(
                                                                                                                      color: const Color(0xFFCCCCCC),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  child: Align(
                                                                                                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                    child: Text(
                                                                                                                      valueOrDefault<String>(
                                                                                                                        getJsonField(
                                                                                                                          eventItem,
                                                                                                                          r'''$.awayTeamScore''',
                                                                                                                        )?.toString(),
                                                                                                                        'null',
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: 'Gelion',
                                                                                                                            color: const Color(0xFFCD1C21),
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
                                                                                                                    eventItem,
                                                                                                                    r'''$.awayTeam.logo_so_small''',
                                                                                                                  ).toString(),
                                                                                                                  width: 25.0,
                                                                                                                  height: 25.0,
                                                                                                                  fit: BoxFit.contain,
                                                                                                                ),
                                                                                                              ),
                                                                                                            ].divide(const SizedBox(width: 5.0)),
                                                                                                          ),
                                                                                                          Text(
                                                                                                            getJsonField(
                                                                                                              eventItem,
                                                                                                              r'''$.awayTeam.name''',
                                                                                                            ).toString(),
                                                                                                            textAlign: TextAlign.end,
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: 'Gelion',
                                                                                                                  color: const Color(0xFFCD1C21),
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
                                                                                        ),
                                                                                        if (FFAppState().bet)
                                                                                          Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                height: 50.0,
                                                                                                decoration: const BoxDecoration(),
                                                                                                child: Padding(
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 10.0, 10.0),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                    children: [
                                                                                                      InkWell(
                                                                                                        splashColor: Colors.transparent,
                                                                                                        focusColor: Colors.transparent,
                                                                                                        hoverColor: Colors.transparent,
                                                                                                        highlightColor: Colors.transparent,
                                                                                                        onTap: () async {
                                                                                                          await launchURL('https://cote-pariuri.ro/go/mozzartbet');
                                                                                                        },
                                                                                                        child: Image.asset(
                                                                                                          'assets/images/mozzart.png',
                                                                                                          width: 73.0,
                                                                                                          height: 50.0,
                                                                                                          fit: BoxFit.contain,
                                                                                                        ),
                                                                                                      ),
                                                                                                      if (!(getJsonField(
                                                                                                            eventItem,
                                                                                                            r'''$.odds[0].o1.odd''',
                                                                                                          ) ==
                                                                                                          null))
                                                                                                        InkWell(
                                                                                                          splashColor: Colors.transparent,
                                                                                                          focusColor: Colors.transparent,
                                                                                                          hoverColor: Colors.transparent,
                                                                                                          highlightColor: Colors.transparent,
                                                                                                          onTap: () async {
                                                                                                            await launchURL('https://cote-pariuri.ro/go/mozzartbet');
                                                                                                          },
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Container(
                                                                                                                width: 42.0,
                                                                                                                height: 30.0,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: valueOrDefault<Color>(
                                                                                                                    getJsonField(
                                                                                                                              eventItem,
                                                                                                                              r'''$.odds[0].o1.isMax''',
                                                                                                                            ) ==
                                                                                                                            true
                                                                                                                        ? const Color(0xFF232948)
                                                                                                                        : const Color(0xFFD8D8D8),
                                                                                                                    const Color(0xFFD8D8D8),
                                                                                                                  ),
                                                                                                                  boxShadow: const [
                                                                                                                    BoxShadow(
                                                                                                                      blurRadius: 4.0,
                                                                                                                      color: Color(0x33000000),
                                                                                                                      offset: Offset(
                                                                                                                        2.0,
                                                                                                                        0.0,
                                                                                                                      ),
                                                                                                                    )
                                                                                                                  ],
                                                                                                                  borderRadius: const BorderRadius.only(
                                                                                                                    bottomLeft: Radius.circular(5.0),
                                                                                                                    bottomRight: Radius.circular(0.0),
                                                                                                                    topLeft: Radius.circular(5.0),
                                                                                                                    topRight: Radius.circular(0.0),
                                                                                                                  ),
                                                                                                                  border: Border.all(
                                                                                                                    color: const Color(0xFFB8BFD4),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                child: Align(
                                                                                                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                  child: Text(
                                                                                                                    valueOrDefault<String>(
                                                                                                                      functions.hideNullValue(valueOrDefault<String>(
                                                                                                                        getJsonField(
                                                                                                                          eventItem,
                                                                                                                          r'''$.odds[0].o1.odd''',
                                                                                                                        )?.toString(),
                                                                                                                        '-',
                                                                                                                      )),
                                                                                                                      '-',
                                                                                                                    ),
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'Gelion',
                                                                                                                          color: valueOrDefault<Color>(
                                                                                                                            getJsonField(
                                                                                                                                      eventItem,
                                                                                                                                      r'''$.odds[0].o1.isMax''',
                                                                                                                                    ) ==
                                                                                                                                    true
                                                                                                                                ? const Color(0xFFD8DDEA)
                                                                                                                                : const Color(0xFF1D242F),
                                                                                                                            const Color(0xFF1D242F),
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
                                                                                                                              eventItem,
                                                                                                                              r'''$.odds[0].oX.isMax''',
                                                                                                                            ) ==
                                                                                                                            true
                                                                                                                        ? const Color(0xFF232948)
                                                                                                                        : const Color(0xFFD8D8D8),
                                                                                                                    const Color(0xFFD8D8D8),
                                                                                                                  ),
                                                                                                                  boxShadow: const [
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
                                                                                                                    color: const Color(0xFFB8BFD4),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                child: Align(
                                                                                                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                  child: Text(
                                                                                                                    valueOrDefault<String>(
                                                                                                                      functions.hideNullValue(valueOrDefault<String>(
                                                                                                                        getJsonField(
                                                                                                                          eventItem,
                                                                                                                          r'''$.odds[0].oX.odd''',
                                                                                                                        )?.toString(),
                                                                                                                        '-',
                                                                                                                      )),
                                                                                                                      '-',
                                                                                                                    ),
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'Gelion',
                                                                                                                          color: valueOrDefault<Color>(
                                                                                                                            getJsonField(
                                                                                                                                      eventItem,
                                                                                                                                      r'''$.odds[0].oX.isMax''',
                                                                                                                                    ) ==
                                                                                                                                    true
                                                                                                                                ? const Color(0xFFD8DDEA)
                                                                                                                                : const Color(0xFF1D242F),
                                                                                                                            const Color(0xFF1D242F),
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
                                                                                                                              eventItem,
                                                                                                                              r'''$.odds[0].o2.isMax''',
                                                                                                                            ) ==
                                                                                                                            true
                                                                                                                        ? const Color(0xFF232948)
                                                                                                                        : const Color(0xFFD8D8D8),
                                                                                                                    const Color(0xFFD8D8D8),
                                                                                                                  ),
                                                                                                                  boxShadow: const [
                                                                                                                    BoxShadow(
                                                                                                                      blurRadius: 4.0,
                                                                                                                      color: Color(0x33000000),
                                                                                                                      offset: Offset(
                                                                                                                        2.0,
                                                                                                                        0.0,
                                                                                                                      ),
                                                                                                                    )
                                                                                                                  ],
                                                                                                                  borderRadius: const BorderRadius.only(
                                                                                                                    bottomLeft: Radius.circular(0.0),
                                                                                                                    bottomRight: Radius.circular(5.0),
                                                                                                                    topLeft: Radius.circular(0.0),
                                                                                                                    topRight: Radius.circular(5.0),
                                                                                                                  ),
                                                                                                                  border: Border.all(
                                                                                                                    color: const Color(0xFFB8BFD4),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                child: Align(
                                                                                                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                  child: Text(
                                                                                                                    valueOrDefault<String>(
                                                                                                                      functions.hideNullValue(valueOrDefault<String>(
                                                                                                                        getJsonField(
                                                                                                                          eventItem,
                                                                                                                          r'''$.odds[0].o2.odd''',
                                                                                                                        )?.toString(),
                                                                                                                        '-',
                                                                                                                      )),
                                                                                                                      '-',
                                                                                                                    ),
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'Gelion',
                                                                                                                          color: valueOrDefault<Color>(
                                                                                                                            getJsonField(
                                                                                                                                      eventItem,
                                                                                                                                      r'''$.odds[0].o2.isMax''',
                                                                                                                                    ) ==
                                                                                                                                    true
                                                                                                                                ? const Color(0xFFD8DDEA)
                                                                                                                                : const Color(0xFF1D242F),
                                                                                                                            const Color(0xFF1D242F),
                                                                                                                          ),
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          useGoogleFonts: false,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ].divide(const SizedBox(width: 10.0)),
                                                                                                          ),
                                                                                                        ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Container(
                                                                                                width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                height: 50.0,
                                                                                                decoration: const BoxDecoration(),
                                                                                                child: Padding(
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 10.0, 10.0),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                    children: [
                                                                                                      InkWell(
                                                                                                        splashColor: Colors.transparent,
                                                                                                        focusColor: Colors.transparent,
                                                                                                        hoverColor: Colors.transparent,
                                                                                                        highlightColor: Colors.transparent,
                                                                                                        onTap: () async {
                                                                                                          await launchURL('https://cote-pariuri.ro/go/cote-superbet');
                                                                                                        },
                                                                                                        child: Image.asset(
                                                                                                          'assets/images/superbet.png',
                                                                                                          width: 73.0,
                                                                                                          height: 50.0,
                                                                                                          fit: BoxFit.contain,
                                                                                                        ),
                                                                                                      ),
                                                                                                      if (!(getJsonField(
                                                                                                            eventItem,
                                                                                                            r'''$.odds[1].o1.odd''',
                                                                                                          ) ==
                                                                                                          null))
                                                                                                        InkWell(
                                                                                                          splashColor: Colors.transparent,
                                                                                                          focusColor: Colors.transparent,
                                                                                                          hoverColor: Colors.transparent,
                                                                                                          highlightColor: Colors.transparent,
                                                                                                          onTap: () async {
                                                                                                            await launchURL('https://cote-pariuri.ro/go/cote-superbet');
                                                                                                          },
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Container(
                                                                                                                width: 42.0,
                                                                                                                height: 30.0,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: valueOrDefault<Color>(
                                                                                                                    getJsonField(
                                                                                                                              eventItem,
                                                                                                                              r'''$.odds[1].o1.isMax''',
                                                                                                                            ) ==
                                                                                                                            true
                                                                                                                        ? const Color(0xFF232948)
                                                                                                                        : const Color(0xFFD8D8D8),
                                                                                                                    const Color(0xFFD8D8D8),
                                                                                                                  ),
                                                                                                                  boxShadow: const [
                                                                                                                    BoxShadow(
                                                                                                                      blurRadius: 4.0,
                                                                                                                      color: Color(0x33000000),
                                                                                                                      offset: Offset(
                                                                                                                        2.0,
                                                                                                                        0.0,
                                                                                                                      ),
                                                                                                                    )
                                                                                                                  ],
                                                                                                                  borderRadius: const BorderRadius.only(
                                                                                                                    bottomLeft: Radius.circular(5.0),
                                                                                                                    bottomRight: Radius.circular(0.0),
                                                                                                                    topLeft: Radius.circular(5.0),
                                                                                                                    topRight: Radius.circular(0.0),
                                                                                                                  ),
                                                                                                                  border: Border.all(
                                                                                                                    color: const Color(0xFFB8BFD4),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                child: Align(
                                                                                                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                  child: Text(
                                                                                                                    valueOrDefault<String>(
                                                                                                                      functions.hideNullValue(getJsonField(
                                                                                                                        eventItem,
                                                                                                                        r'''$.odds[1].o1.odd''',
                                                                                                                      ).toString()),
                                                                                                                      '-',
                                                                                                                    ),
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'Gelion',
                                                                                                                          color: valueOrDefault<Color>(
                                                                                                                            getJsonField(
                                                                                                                                      eventItem,
                                                                                                                                      r'''$.odds[1].o1.isMax''',
                                                                                                                                    ) ==
                                                                                                                                    true
                                                                                                                                ? const Color(0xFFD8DDEA)
                                                                                                                                : const Color(0xFF1D242F),
                                                                                                                            const Color(0xFF1D242F),
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
                                                                                                                              eventItem,
                                                                                                                              r'''$.odds[1].oX.isMax''',
                                                                                                                            ) ==
                                                                                                                            true
                                                                                                                        ? const Color(0xFF232948)
                                                                                                                        : const Color(0xFFD8D8D8),
                                                                                                                    const Color(0xFFD8D8D8),
                                                                                                                  ),
                                                                                                                  boxShadow: const [
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
                                                                                                                    color: const Color(0xFFB8BFD4),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                child: Align(
                                                                                                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                  child: Text(
                                                                                                                    valueOrDefault<String>(
                                                                                                                      functions.hideNullValue(getJsonField(
                                                                                                                        eventItem,
                                                                                                                        r'''$.odds[1].oX.odd''',
                                                                                                                      ).toString()),
                                                                                                                      '-',
                                                                                                                    ),
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'Gelion',
                                                                                                                          color: valueOrDefault<Color>(
                                                                                                                            getJsonField(
                                                                                                                                      eventItem,
                                                                                                                                      r'''$.odds[1].oX.isMax''',
                                                                                                                                    ) ==
                                                                                                                                    true
                                                                                                                                ? const Color(0xFFD8DDEA)
                                                                                                                                : const Color(0xFF1D242F),
                                                                                                                            const Color(0xFF1D242F),
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
                                                                                                                              eventItem,
                                                                                                                              r'''$.odds[1].o2.isMax''',
                                                                                                                            ) ==
                                                                                                                            true
                                                                                                                        ? const Color(0xFF232948)
                                                                                                                        : const Color(0xFFD8D8D8),
                                                                                                                    const Color(0xFFD8D8D8),
                                                                                                                  ),
                                                                                                                  boxShadow: const [
                                                                                                                    BoxShadow(
                                                                                                                      blurRadius: 4.0,
                                                                                                                      color: Color(0x33000000),
                                                                                                                      offset: Offset(
                                                                                                                        2.0,
                                                                                                                        0.0,
                                                                                                                      ),
                                                                                                                    )
                                                                                                                  ],
                                                                                                                  borderRadius: const BorderRadius.only(
                                                                                                                    bottomLeft: Radius.circular(0.0),
                                                                                                                    bottomRight: Radius.circular(5.0),
                                                                                                                    topLeft: Radius.circular(0.0),
                                                                                                                    topRight: Radius.circular(5.0),
                                                                                                                  ),
                                                                                                                  border: Border.all(
                                                                                                                    color: const Color(0xFFB8BFD4),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                child: Align(
                                                                                                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                  child: Text(
                                                                                                                    valueOrDefault<String>(
                                                                                                                      functions.hideNullValue(getJsonField(
                                                                                                                        eventItem,
                                                                                                                        r'''$.odds[1].o2.odd''',
                                                                                                                      ).toString()),
                                                                                                                      '-',
                                                                                                                    ),
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'Gelion',
                                                                                                                          color: valueOrDefault<Color>(
                                                                                                                            getJsonField(
                                                                                                                                      eventItem,
                                                                                                                                      r'''$.odds[1].o2.isMax''',
                                                                                                                                    ) ==
                                                                                                                                    true
                                                                                                                                ? const Color(0xFFD8DDEA)
                                                                                                                                : const Color(0xFF1D242F),
                                                                                                                            const Color(0xFF1D242F),
                                                                                                                          ),
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          useGoogleFonts: false,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ].divide(const SizedBox(width: 10.0)),
                                                                                                          ),
                                                                                                        ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Container(
                                                                                                width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                height: 50.0,
                                                                                                decoration: const BoxDecoration(),
                                                                                                child: Padding(
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 10.0, 10.0),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                    children: [
                                                                                                      InkWell(
                                                                                                        splashColor: Colors.transparent,
                                                                                                        focusColor: Colors.transparent,
                                                                                                        hoverColor: Colors.transparent,
                                                                                                        highlightColor: Colors.transparent,
                                                                                                        onTap: () async {
                                                                                                          await launchURL('https://cote-pariuri.ro/go/unbt');
                                                                                                        },
                                                                                                        child: Image.asset(
                                                                                                          'assets/images/unibet.png',
                                                                                                          width: 73.0,
                                                                                                          height: 50.0,
                                                                                                          fit: BoxFit.contain,
                                                                                                        ),
                                                                                                      ),
                                                                                                      if (!(getJsonField(
                                                                                                            eventItem,
                                                                                                            r'''$.odds[2].o1.odd''',
                                                                                                          ) ==
                                                                                                          null))
                                                                                                        InkWell(
                                                                                                          splashColor: Colors.transparent,
                                                                                                          focusColor: Colors.transparent,
                                                                                                          hoverColor: Colors.transparent,
                                                                                                          highlightColor: Colors.transparent,
                                                                                                          onTap: () async {
                                                                                                            await launchURL('https://cote-pariuri.ro/go/unbt');
                                                                                                          },
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Container(
                                                                                                                width: 42.0,
                                                                                                                height: 30.0,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: valueOrDefault<Color>(
                                                                                                                    getJsonField(
                                                                                                                              eventItem,
                                                                                                                              r'''$.odds[2].o1.isMax''',
                                                                                                                            ) ==
                                                                                                                            true
                                                                                                                        ? const Color(0xFF232948)
                                                                                                                        : const Color(0xFFD8D8D8),
                                                                                                                    const Color(0xFFD8D8D8),
                                                                                                                  ),
                                                                                                                  boxShadow: const [
                                                                                                                    BoxShadow(
                                                                                                                      blurRadius: 4.0,
                                                                                                                      color: Color(0x33000000),
                                                                                                                      offset: Offset(
                                                                                                                        2.0,
                                                                                                                        0.0,
                                                                                                                      ),
                                                                                                                    )
                                                                                                                  ],
                                                                                                                  borderRadius: const BorderRadius.only(
                                                                                                                    bottomLeft: Radius.circular(5.0),
                                                                                                                    bottomRight: Radius.circular(0.0),
                                                                                                                    topLeft: Radius.circular(5.0),
                                                                                                                    topRight: Radius.circular(0.0),
                                                                                                                  ),
                                                                                                                  border: Border.all(
                                                                                                                    color: const Color(0xFFB8BFD4),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                child: Align(
                                                                                                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                  child: Text(
                                                                                                                    valueOrDefault<String>(
                                                                                                                      functions.hideNullValue(getJsonField(
                                                                                                                        eventItem,
                                                                                                                        r'''$.odds[2].o1.odd''',
                                                                                                                      ).toString()),
                                                                                                                      '-',
                                                                                                                    ),
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'Gelion',
                                                                                                                          color: valueOrDefault<Color>(
                                                                                                                            getJsonField(
                                                                                                                                      eventItem,
                                                                                                                                      r'''$.odds[2].o1.isMax''',
                                                                                                                                    ) ==
                                                                                                                                    true
                                                                                                                                ? const Color(0xFFD8DDEA)
                                                                                                                                : const Color(0xFF1D242F),
                                                                                                                            const Color(0xFF1D242F),
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
                                                                                                                              eventItem,
                                                                                                                              r'''$.odds[2].oX.isMax''',
                                                                                                                            ) ==
                                                                                                                            true
                                                                                                                        ? const Color(0xFF232948)
                                                                                                                        : const Color(0xFFD8D8D8),
                                                                                                                    const Color(0xFFD8D8D8),
                                                                                                                  ),
                                                                                                                  boxShadow: const [
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
                                                                                                                    color: const Color(0xFFB8BFD4),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                child: Align(
                                                                                                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                  child: Text(
                                                                                                                    valueOrDefault<String>(
                                                                                                                      functions.hideNullValue(getJsonField(
                                                                                                                        eventItem,
                                                                                                                        r'''$.odds[2].oX.odd''',
                                                                                                                      ).toString()),
                                                                                                                      '-',
                                                                                                                    ),
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'Gelion',
                                                                                                                          color: valueOrDefault<Color>(
                                                                                                                            getJsonField(
                                                                                                                                      eventItem,
                                                                                                                                      r'''$.odds[2].oX.isMax''',
                                                                                                                                    ) ==
                                                                                                                                    true
                                                                                                                                ? const Color(0xFFD8DDEA)
                                                                                                                                : const Color(0xFF1D242F),
                                                                                                                            const Color(0xFF1D242F),
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
                                                                                                                              eventItem,
                                                                                                                              r'''$.odds[2].o2.isMax''',
                                                                                                                            ) ==
                                                                                                                            true
                                                                                                                        ? const Color(0xFF232948)
                                                                                                                        : const Color(0xFFD8D8D8),
                                                                                                                    const Color(0xFFD8D8D8),
                                                                                                                  ),
                                                                                                                  boxShadow: const [
                                                                                                                    BoxShadow(
                                                                                                                      blurRadius: 4.0,
                                                                                                                      color: Color(0x33000000),
                                                                                                                      offset: Offset(
                                                                                                                        2.0,
                                                                                                                        0.0,
                                                                                                                      ),
                                                                                                                    )
                                                                                                                  ],
                                                                                                                  borderRadius: const BorderRadius.only(
                                                                                                                    bottomLeft: Radius.circular(0.0),
                                                                                                                    bottomRight: Radius.circular(5.0),
                                                                                                                    topLeft: Radius.circular(0.0),
                                                                                                                    topRight: Radius.circular(5.0),
                                                                                                                  ),
                                                                                                                  border: Border.all(
                                                                                                                    color: const Color(0xFFB8BFD4),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                child: Align(
                                                                                                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                  child: Text(
                                                                                                                    valueOrDefault<String>(
                                                                                                                      functions.hideNullValue(getJsonField(
                                                                                                                        eventItem,
                                                                                                                        r'''$.odds[2].o2.odd''',
                                                                                                                      ).toString()),
                                                                                                                      '-',
                                                                                                                    ),
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'Gelion',
                                                                                                                          color: valueOrDefault<Color>(
                                                                                                                            getJsonField(
                                                                                                                                      eventItem,
                                                                                                                                      r'''$.odds[2].o2.isMax''',
                                                                                                                                    ) ==
                                                                                                                                    true
                                                                                                                                ? const Color(0xFFD8DDEA)
                                                                                                                                : const Color(0xFF1D242F),
                                                                                                                            const Color(0xFF1D242F),
                                                                                                                          ),
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          useGoogleFonts: false,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ].divide(const SizedBox(width: 10.0)),
                                                                                                          ),
                                                                                                        ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Container(
                                                                                                width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                height: 50.0,
                                                                                                decoration: const BoxDecoration(),
                                                                                                child: Padding(
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 10.0, 10.0),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                    children: [
                                                                                                      InkWell(
                                                                                                        splashColor: Colors.transparent,
                                                                                                        focusColor: Colors.transparent,
                                                                                                        hoverColor: Colors.transparent,
                                                                                                        highlightColor: Colors.transparent,
                                                                                                        onTap: () async {
                                                                                                          await launchURL('https://cote-pariuri.ro/go/cote-betano');
                                                                                                        },
                                                                                                        child: Image.asset(
                                                                                                          'assets/images/betano.png',
                                                                                                          width: 73.0,
                                                                                                          height: 50.0,
                                                                                                          fit: BoxFit.contain,
                                                                                                        ),
                                                                                                      ),
                                                                                                      if (!(getJsonField(
                                                                                                            eventItem,
                                                                                                            r'''$.odds[3].o1.odd''',
                                                                                                          ) ==
                                                                                                          null))
                                                                                                        InkWell(
                                                                                                          splashColor: Colors.transparent,
                                                                                                          focusColor: Colors.transparent,
                                                                                                          hoverColor: Colors.transparent,
                                                                                                          highlightColor: Colors.transparent,
                                                                                                          onTap: () async {
                                                                                                            await launchURL('https://cote-pariuri.ro/go/cote-betano');
                                                                                                          },
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Container(
                                                                                                                width: 42.0,
                                                                                                                height: 30.0,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: valueOrDefault<Color>(
                                                                                                                    getJsonField(
                                                                                                                              eventItem,
                                                                                                                              r'''$.odds[3].o1.isMax''',
                                                                                                                            ) ==
                                                                                                                            true
                                                                                                                        ? const Color(0xFF232948)
                                                                                                                        : const Color(0xFFD8D8D8),
                                                                                                                    const Color(0xFFD8D8D8),
                                                                                                                  ),
                                                                                                                  boxShadow: const [
                                                                                                                    BoxShadow(
                                                                                                                      blurRadius: 4.0,
                                                                                                                      color: Color(0x33000000),
                                                                                                                      offset: Offset(
                                                                                                                        2.0,
                                                                                                                        0.0,
                                                                                                                      ),
                                                                                                                    )
                                                                                                                  ],
                                                                                                                  borderRadius: const BorderRadius.only(
                                                                                                                    bottomLeft: Radius.circular(5.0),
                                                                                                                    bottomRight: Radius.circular(0.0),
                                                                                                                    topLeft: Radius.circular(5.0),
                                                                                                                    topRight: Radius.circular(0.0),
                                                                                                                  ),
                                                                                                                  border: Border.all(
                                                                                                                    color: const Color(0xFFB8BFD4),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                child: Align(
                                                                                                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                  child: Text(
                                                                                                                    valueOrDefault<String>(
                                                                                                                      functions.hideNullValue(getJsonField(
                                                                                                                        eventItem,
                                                                                                                        r'''$.odds[3].o1.odd''',
                                                                                                                      ).toString()),
                                                                                                                      '-',
                                                                                                                    ),
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'Gelion',
                                                                                                                          color: valueOrDefault<Color>(
                                                                                                                            getJsonField(
                                                                                                                                      eventItem,
                                                                                                                                      r'''$.odds[3].o1.isMax''',
                                                                                                                                    ) ==
                                                                                                                                    true
                                                                                                                                ? const Color(0xFFD8DDEA)
                                                                                                                                : const Color(0xFF1D242F),
                                                                                                                            const Color(0xFF1D242F),
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
                                                                                                                              eventItem,
                                                                                                                              r'''$.odds[3].oX.isMax''',
                                                                                                                            ) ==
                                                                                                                            true
                                                                                                                        ? const Color(0xFF232948)
                                                                                                                        : const Color(0xFFD8D8D8),
                                                                                                                    const Color(0xFFD8D8D8),
                                                                                                                  ),
                                                                                                                  boxShadow: const [
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
                                                                                                                    color: const Color(0xFFB8BFD4),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                child: Align(
                                                                                                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                  child: Text(
                                                                                                                    valueOrDefault<String>(
                                                                                                                      functions.hideNullValue(getJsonField(
                                                                                                                        eventItem,
                                                                                                                        r'''$.odds[3].oX.odd''',
                                                                                                                      ).toString()),
                                                                                                                      '-',
                                                                                                                    ),
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'Gelion',
                                                                                                                          color: valueOrDefault<Color>(
                                                                                                                            getJsonField(
                                                                                                                                      eventItem,
                                                                                                                                      r'''$.odds[3].oX.isMax''',
                                                                                                                                    ) ==
                                                                                                                                    true
                                                                                                                                ? const Color(0xFFD8DDEA)
                                                                                                                                : const Color(0xFF1D242F),
                                                                                                                            const Color(0xFF1D242F),
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
                                                                                                                              eventItem,
                                                                                                                              r'''$.odds[3].o2.isMax''',
                                                                                                                            ) ==
                                                                                                                            true
                                                                                                                        ? const Color(0xFF232948)
                                                                                                                        : const Color(0xFFD8D8D8),
                                                                                                                    const Color(0xFFD8D8D8),
                                                                                                                  ),
                                                                                                                  boxShadow: const [
                                                                                                                    BoxShadow(
                                                                                                                      blurRadius: 4.0,
                                                                                                                      color: Color(0x33000000),
                                                                                                                      offset: Offset(
                                                                                                                        2.0,
                                                                                                                        0.0,
                                                                                                                      ),
                                                                                                                    )
                                                                                                                  ],
                                                                                                                  borderRadius: const BorderRadius.only(
                                                                                                                    bottomLeft: Radius.circular(0.0),
                                                                                                                    bottomRight: Radius.circular(5.0),
                                                                                                                    topLeft: Radius.circular(0.0),
                                                                                                                    topRight: Radius.circular(5.0),
                                                                                                                  ),
                                                                                                                  border: Border.all(
                                                                                                                    color: const Color(0xFFB8BFD4),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                child: Align(
                                                                                                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                  child: Text(
                                                                                                                    valueOrDefault<String>(
                                                                                                                      functions.hideNullValue(getJsonField(
                                                                                                                        eventItem,
                                                                                                                        r'''$.odds[3].o2.odd''',
                                                                                                                      ).toString()),
                                                                                                                      '-',
                                                                                                                    ),
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'Gelion',
                                                                                                                          color: valueOrDefault<Color>(
                                                                                                                            getJsonField(
                                                                                                                                      eventItem,
                                                                                                                                      r'''$.odds[3].o2.isMax''',
                                                                                                                                    ) ==
                                                                                                                                    true
                                                                                                                                ? const Color(0xFFD8DDEA)
                                                                                                                                : const Color(0xFF1D242F),
                                                                                                                            const Color(0xFF1D242F),
                                                                                                                          ),
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          useGoogleFonts: false,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ].divide(const SizedBox(width: 10.0)),
                                                                                                          ),
                                                                                                        ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Container(
                                                                                                width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                height: 50.0,
                                                                                                decoration: const BoxDecoration(
                                                                                                  borderRadius: BorderRadius.only(
                                                                                                    bottomLeft: Radius.circular(10.0),
                                                                                                    bottomRight: Radius.circular(10.0),
                                                                                                    topLeft: Radius.circular(0.0),
                                                                                                    topRight: Radius.circular(0.0),
                                                                                                  ),
                                                                                                ),
                                                                                                child: Padding(
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 10.0, 10.0),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                    children: [
                                                                                                      InkWell(
                                                                                                        splashColor: Colors.transparent,
                                                                                                        focusColor: Colors.transparent,
                                                                                                        hoverColor: Colors.transparent,
                                                                                                        highlightColor: Colors.transparent,
                                                                                                        onTap: () async {
                                                                                                          await launchURL('https://cote-pariuri.ro/go/cote-betfair');
                                                                                                        },
                                                                                                        child: Image.asset(
                                                                                                          'assets/images/betfair-logo.png',
                                                                                                          width: 73.0,
                                                                                                          height: 50.0,
                                                                                                          fit: BoxFit.contain,
                                                                                                        ),
                                                                                                      ),
                                                                                                      if (!(getJsonField(
                                                                                                            eventItem,
                                                                                                            r'''$.odds[4].o1.odd''',
                                                                                                          ) ==
                                                                                                          null))
                                                                                                        InkWell(
                                                                                                          splashColor: Colors.transparent,
                                                                                                          focusColor: Colors.transparent,
                                                                                                          hoverColor: Colors.transparent,
                                                                                                          highlightColor: Colors.transparent,
                                                                                                          onTap: () async {
                                                                                                            await launchURL('https://cote-pariuri.ro/go/cote-betfair');
                                                                                                          },
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Container(
                                                                                                                width: 42.0,
                                                                                                                height: 30.0,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: valueOrDefault<Color>(
                                                                                                                    getJsonField(
                                                                                                                              eventItem,
                                                                                                                              r'''$.odds[4].o1.isMax''',
                                                                                                                            ) ==
                                                                                                                            true
                                                                                                                        ? const Color(0xFF232948)
                                                                                                                        : const Color(0xFFD8D8D8),
                                                                                                                    const Color(0xFFD8D8D8),
                                                                                                                  ),
                                                                                                                  boxShadow: const [
                                                                                                                    BoxShadow(
                                                                                                                      blurRadius: 4.0,
                                                                                                                      color: Color(0x33000000),
                                                                                                                      offset: Offset(
                                                                                                                        2.0,
                                                                                                                        0.0,
                                                                                                                      ),
                                                                                                                    )
                                                                                                                  ],
                                                                                                                  borderRadius: const BorderRadius.only(
                                                                                                                    bottomLeft: Radius.circular(5.0),
                                                                                                                    bottomRight: Radius.circular(0.0),
                                                                                                                    topLeft: Radius.circular(5.0),
                                                                                                                    topRight: Radius.circular(0.0),
                                                                                                                  ),
                                                                                                                  border: Border.all(
                                                                                                                    color: const Color(0xFFB8BFD4),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                child: Align(
                                                                                                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                  child: Text(
                                                                                                                    valueOrDefault<String>(
                                                                                                                      functions.hideNullValue(getJsonField(
                                                                                                                        eventItem,
                                                                                                                        r'''$.odds[4].o1.odd''',
                                                                                                                      ).toString()),
                                                                                                                      '-',
                                                                                                                    ),
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'Gelion',
                                                                                                                          color: valueOrDefault<Color>(
                                                                                                                            getJsonField(
                                                                                                                                      eventItem,
                                                                                                                                      r'''$.odds[4].o1.isMax''',
                                                                                                                                    ) ==
                                                                                                                                    true
                                                                                                                                ? const Color(0xFFD8DDEA)
                                                                                                                                : const Color(0xFF1D242F),
                                                                                                                            const Color(0xFF1D242F),
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
                                                                                                                              eventItem,
                                                                                                                              r'''$.odds[4].oX.isMax''',
                                                                                                                            ) ==
                                                                                                                            true
                                                                                                                        ? const Color(0xFF232948)
                                                                                                                        : const Color(0xFFD8D8D8),
                                                                                                                    const Color(0xFFD8D8D8),
                                                                                                                  ),
                                                                                                                  boxShadow: const [
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
                                                                                                                    color: const Color(0xFFB8BFD4),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                child: Align(
                                                                                                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                  child: Text(
                                                                                                                    valueOrDefault<String>(
                                                                                                                      functions.hideNullValue(getJsonField(
                                                                                                                        eventItem,
                                                                                                                        r'''$.odds[4].oX.odd''',
                                                                                                                      ).toString()),
                                                                                                                      '-',
                                                                                                                    ),
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'Gelion',
                                                                                                                          color: valueOrDefault<Color>(
                                                                                                                            getJsonField(
                                                                                                                                      eventItem,
                                                                                                                                      r'''$.odds[4].oX.isMax''',
                                                                                                                                    ) ==
                                                                                                                                    true
                                                                                                                                ? const Color(0xFFD8DDEA)
                                                                                                                                : const Color(0xFF1D242F),
                                                                                                                            const Color(0xFF1D242F),
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
                                                                                                                              eventItem,
                                                                                                                              r'''$.odds[4].o2.isMax''',
                                                                                                                            ) ==
                                                                                                                            true
                                                                                                                        ? const Color(0xFF232948)
                                                                                                                        : const Color(0xFFD8D8D8),
                                                                                                                    const Color(0xFFD8D8D8),
                                                                                                                  ),
                                                                                                                  boxShadow: const [
                                                                                                                    BoxShadow(
                                                                                                                      blurRadius: 4.0,
                                                                                                                      color: Color(0x33000000),
                                                                                                                      offset: Offset(
                                                                                                                        2.0,
                                                                                                                        0.0,
                                                                                                                      ),
                                                                                                                    )
                                                                                                                  ],
                                                                                                                  borderRadius: const BorderRadius.only(
                                                                                                                    bottomLeft: Radius.circular(0.0),
                                                                                                                    bottomRight: Radius.circular(5.0),
                                                                                                                    topLeft: Radius.circular(0.0),
                                                                                                                    topRight: Radius.circular(5.0),
                                                                                                                  ),
                                                                                                                  border: Border.all(
                                                                                                                    color: const Color(0xFFB8BFD4),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                child: Align(
                                                                                                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                                                  child: Text(
                                                                                                                    valueOrDefault<String>(
                                                                                                                      functions.hideNullValue(getJsonField(
                                                                                                                        eventItem,
                                                                                                                        r'''$.odds[4].o2.odd''',
                                                                                                                      ).toString()),
                                                                                                                      '-',
                                                                                                                    ),
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: 'Gelion',
                                                                                                                          color: valueOrDefault<Color>(
                                                                                                                            getJsonField(
                                                                                                                                      eventItem,
                                                                                                                                      r'''$.odds[4].o2.isMax''',
                                                                                                                                    ) ==
                                                                                                                                    true
                                                                                                                                ? const Color(0xFFD8DDEA)
                                                                                                                                : const Color(0xFF1D242F),
                                                                                                                            const Color(0xFF1D242F),
                                                                                                                          ),
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          useGoogleFonts: false,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ].divide(const SizedBox(width: 10.0)),
                                                                                                          ),
                                                                                                        ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                            controller:
                                                                                _model.listViewController,
                                                                          );
                                                                        },
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                                controller: _model
                                                                    .matcheventListView,
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                    controller:
                                                        _model.matchListView,
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 1.0),
                                            child: wrapWithModel(
                                              model: _model.footerModel,
                                              updateCallback: () =>
                                                  setState(() {}),
                                              child: const FooterWidget(),
                                            ),
                                          ),
                                        ].divide(const SizedBox(height: 0.0)),
                                      ),
                                    ),
                                  if (_model.loading && _model.netstatus)
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: wrapWithModel(
                                        model: _model.loadingModel,
                                        updateCallback: () => setState(() {}),
                                        child: const LoadingWidget(),
                                      ),
                                    ),
                                  if (!_model.netstatus)
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: wrapWithModel(
                                        model: _model.neterrorModel,
                                        updateCallback: () => setState(() {}),
                                        child: const NeterrorWidget(),
                                      ),
                                    ),
                                ],
                              ),
                            ).animateOnPageLoad(animationsMap[
                                'containerOnPageLoadAnimation1']!),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: wrapWithModel(
                      model: _model.navbarModel,
                      updateCallback: () => setState(() {}),
                      child: const NavbarWidget(
                        selected: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

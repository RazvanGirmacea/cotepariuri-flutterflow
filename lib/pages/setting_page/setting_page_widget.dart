import '/components/navbar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'setting_page_model.dart';
export 'setting_page_model.dart';

class SettingPageWidget extends StatefulWidget {
  const SettingPageWidget({super.key});

  @override
  State<SettingPageWidget> createState() => _SettingPageWidgetState();
}

class _SettingPageWidgetState extends State<SettingPageWidget>
    with TickerProviderStateMixin {
  late SettingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingPageModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
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
      'rowOnPageLoadAnimation': AnimationInfo(
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
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'SettingPage',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: const Color(0xFF1D242F),
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(65.0),
              child: AppBar(
                backgroundColor: const Color(0xFF1D242F),
                automaticallyImplyLeading: false,
                title: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
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
                  ],
                ),
                actions: const [],
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
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ohymrhg0' /* Limba : */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Gelion',
                                                        color: Colors.black,
                                                        fontSize: 25.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                            FlutterFlowLanguageSelector(
                                              width: 200.0,
                                              backgroundColor:
                                                  const Color(0xFF232948),
                                              borderColor: Colors.transparent,
                                              dropdownIconColor: Colors.white,
                                              borderRadius: 8.0,
                                              textStyle: const TextStyle(
                                                fontFamily: 'Gelion',
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18.0,
                                              ),
                                              hideFlags: false,
                                              flagSize: 24.0,
                                              flagTextGap: 8.0,
                                              currentLanguage:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                              languages:
                                                  FFLocalizations.languages(),
                                              onChanged: (lang) =>
                                                  setAppLanguage(context, lang),
                                            ),
                                          ],
                                        ).animateOnPageLoad(animationsMap[
                                            'rowOnPageLoadAnimation']!),
                                      ]
                                          .divide(const SizedBox(height: 30.0))
                                          .addToStart(const SizedBox(height: 10.0)),
                                    ),
                                  ),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation']!),
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
                          selected: 3,
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

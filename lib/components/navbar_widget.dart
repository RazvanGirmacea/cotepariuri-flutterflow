import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'navbar_model.dart';
export 'navbar_model.dart';

class NavbarWidget extends StatefulWidget {
  const NavbarWidget({
    super.key,
    int? selected,
  }) : this.selected = selected ?? 0;

  final int selected;

  @override
  State<NavbarWidget> createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget> {
  late NavbarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavbarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: 60.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed('HomePage');
                },
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          if (widget.selected == 1) {
                            return FaIcon(
                              FontAwesomeIcons.home,
                              color: FlutterFlowTheme.of(context).accent1,
                              size: 20.0,
                            );
                          } else {
                            return FaIcon(
                              FontAwesomeIcons.home,
                              color: FlutterFlowTheme.of(context).accent2,
                              size: 20.0,
                            );
                          }
                        },
                      ),
                    ),
                    if (isiOS)
                      Builder(
                        builder: (context) {
                          if (widget.selected == 1) {
                            return Text(
                              FFLocalizations.of(context).getText(
                                '4v3rai5f' /* ACASĂ */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Gelion',
                                    color: FlutterFlowTheme.of(context).accent1,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                            );
                          } else {
                            return Text(
                              FFLocalizations.of(context).getText(
                                '8txvppv4' /* ACASĂ */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Gelion',
                                    color: FlutterFlowTheme.of(context).accent2,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                            );
                          }
                        },
                      ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed('SitePage');
                },
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          if (widget.selected == 2) {
                            return Icon(
                              Icons.style_rounded,
                              color: FlutterFlowTheme.of(context).accent1,
                              size: 25.0,
                            );
                          } else {
                            return Icon(
                              Icons.style_rounded,
                              color: FlutterFlowTheme.of(context).accent2,
                              size: 25.0,
                            );
                          }
                        },
                      ),
                    ),
                    if (isiOS)
                      Builder(
                        builder: (context) {
                          if (widget.selected == 2) {
                            return Text(
                              FFLocalizations.of(context).getText(
                                'f8t45btn' /* Pariuri */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Gelion',
                                    color: FlutterFlowTheme.of(context).accent1,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                            );
                          } else {
                            return Text(
                              FFLocalizations.of(context).getText(
                                'qz8jnl4s' /* Pariuri */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Gelion',
                                    color: FlutterFlowTheme.of(context).accent2,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                            );
                          }
                        },
                      ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed('SettingPage');
                },
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          if (widget.selected == 3) {
                            return Icon(
                              Icons.settings_suggest,
                              color: FlutterFlowTheme.of(context).accent1,
                              size: 25.0,
                            );
                          } else {
                            return Icon(
                              Icons.settings_suggest,
                              color: FlutterFlowTheme.of(context).accent2,
                              size: 25.0,
                            );
                          }
                        },
                      ),
                    ),
                    if (isiOS)
                      Builder(
                        builder: (context) {
                          if (widget.selected == 3) {
                            return Text(
                              FFLocalizations.of(context).getText(
                                'sdhi3s06' /* SETARI */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Gelion',
                                    color: FlutterFlowTheme.of(context).accent1,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                            );
                          } else {
                            return Text(
                              FFLocalizations.of(context).getText(
                                'p2fsv170' /* SETARI */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Gelion',
                                    color: FlutterFlowTheme.of(context).accent2,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                            );
                          }
                        },
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

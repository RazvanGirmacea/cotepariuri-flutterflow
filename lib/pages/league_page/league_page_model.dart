import '/backend/api_requests/api_calls.dart';
import '/components/choice_button_widget.dart';
import '/components/footer_widget.dart';
import '/components/loading_widget.dart';
import '/components/navbar_widget.dart';
import '/components/neterror_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'league_page_widget.dart' show LeaguePageWidget;
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LeaguePageModel extends FlutterFlowModel<LeaguePageWidget> {
  ///  Local state fields for this page.

  bool loading = true;

  bool netstatus = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for choiceButton component.
  late ChoiceButtonModel choiceButtonModel;
  // State field(s) for matchListView widget.
  ScrollController? matchListView;
  // State field(s) for matcheventListView widget.
  ScrollController? matcheventListView;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // Model for footer component.
  late FooterModel footerModel;
  // Model for Loading component.
  late LoadingModel loadingModel;
  // Model for neterror component.
  late NeterrorModel neterrorModel;
  // Model for navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    choiceButtonModel = createModel(context, () => ChoiceButtonModel());
    matchListView = ScrollController();
    matcheventListView = ScrollController();
    listViewController = ScrollController();
    footerModel = createModel(context, () => FooterModel());
    loadingModel = createModel(context, () => LoadingModel());
    neterrorModel = createModel(context, () => NeterrorModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    choiceButtonModel.dispose();
    matchListView?.dispose();
    matcheventListView?.dispose();
    listViewController?.dispose();
    footerModel.dispose();
    loadingModel.dispose();
    neterrorModel.dispose();
    navbarModel.dispose();
  }

  /// Action blocks.
  Future leagueData(BuildContext context) async {
    ApiCallResponse? leagueAPI;

    leagueAPI = await LeagueAPICall.call(
      language: FFLocalizations.of(context).languageCode,
      league: widget.leagueName,
    );
    if ((leagueAPI?.succeeded ?? true)) {
      loading = false;
      FFAppState().leagueData = (leagueAPI?.jsonBody ?? '');
    } else {
      netstatus = false;
    }
  }
}

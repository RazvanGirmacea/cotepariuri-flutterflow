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
import 'match_page_widget.dart' show MatchPageWidget;
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MatchPageModel extends FlutterFlowModel<MatchPageWidget> {
  ///  Local state fields for this page.

  bool loading = true;

  bool netStatus = true;

  dynamic stateChange;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Match API)] action in MatchPage widget.
  ApiCallResponse? apMatch;
  // Stores action output result for [Backend Call - API (Match API)] action in settingButton widget.
  ApiCallResponse? apMatchCopy;
  // State field(s) for matchsection widget.
  ScrollController? matchsection;
  // Models for ball_possession.
  late FlutterFlowDynamicModels<StatsModel> ballPossessionModels;
  // State field(s) for HomeListView widget.
  ScrollController? homeListView;
  // State field(s) for AwayListView widget.
  ScrollController? awayListView;
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
    matchsection = ScrollController();
    ballPossessionModels = FlutterFlowDynamicModels(() => StatsModel());
    homeListView = ScrollController();
    awayListView = ScrollController();
    footerModel = createModel(context, () => FooterModel());
    loadingModel = createModel(context, () => LoadingModel());
    neterrorModel = createModel(context, () => NeterrorModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    matchsection?.dispose();
    ballPossessionModels.dispose();
    homeListView?.dispose();
    awayListView?.dispose();
    footerModel.dispose();
    loadingModel.dispose();
    neterrorModel.dispose();
    navbarModel.dispose();
  }
}

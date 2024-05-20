import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'start_page_model.dart';
export 'start_page_model.dart';

class StartPageWidget extends StatefulWidget {
  const StartPageWidget({super.key});

  @override
  State<StartPageWidget> createState() => _StartPageWidgetState();
}

class _StartPageWidgetState extends State<StartPageWidget> {
  late StartPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StartPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().firstOpen) {
        setState(() {
          FFAppState().firstOpen = false;
        });
        setAppLanguage(context, 'ro');
      } else {
        setAppLanguage(context, FFLocalizations.of(context).languageCode);
      }

      context.pushNamed('HomePage');
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
    context.watch<FFAppState>();

    return Title(
        title: 'StartPage',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: const Color(0xFF1D242F),
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(10.0),
              child: AppBar(
                backgroundColor: const Color(0xFF1D242F),
                automaticallyImplyLeading: false,
                actions: const [],
                centerTitle: false,
                toolbarHeight: 10.0,
                elevation: 0.0,
              ),
            ),
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/logo-darkx1500.png',
                                  width: MediaQuery.sizeOf(context).width * 0.8,
                                  height: 100.0,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ].divide(const SizedBox(width: 10.0)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

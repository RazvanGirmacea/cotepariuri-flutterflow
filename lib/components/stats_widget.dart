import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'stats_model.dart';
export 'stats_model.dart';

class StatsWidget extends StatefulWidget {
  const StatsWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
  });

  final dynamic parameter1;
  final dynamic parameter2;
  final dynamic parameter3;

  @override
  State<StatsWidget> createState() => _StatsWidgetState();
}

class _StatsWidgetState extends State<StatsWidget> {
  late StatsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StatsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.parameter1 != null,
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        decoration: const BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Container(
                      decoration: const BoxDecoration(),
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                        child: Text(
                          widget.parameter1!.toString(),
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Gelion',
                                    color: Colors.black,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      decoration: const BoxDecoration(),
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                        child: Text(
                          widget.parameter2!.toString(),
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Gelion',
                                    color: Colors.black,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      decoration: const BoxDecoration(),
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                        child: Text(
                          widget.parameter3!.toString(),
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Gelion',
                                    color: Colors.black,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              decoration: const BoxDecoration(
                color: Color(0xFFEBEBEB),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.5,
                      height: 30.0,
                      decoration: const BoxDecoration(),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 5.0, 5.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFFD8DDEA),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                width: (MediaQuery.sizeOf(context).width - 70) /
                                    2 *
                                    (widget.parameter1!) /
                                    ((widget.parameter3!) +
                                        (widget.parameter1!)),
                                height: 10.0,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF232948),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.5,
                      height: 30.0,
                      decoration: const BoxDecoration(),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 10.0, 5.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFFD8DDEA),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: (MediaQuery.sizeOf(context).width - 70) /
                                    2 *
                                    (widget.parameter3!) /
                                    ((widget.parameter3!) +
                                        (widget.parameter1!)),
                                height: 10.0,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFEC4545),
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
          ],
        ),
      ),
    );
  }
}

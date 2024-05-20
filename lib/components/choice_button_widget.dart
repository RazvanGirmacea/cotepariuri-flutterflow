import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'choice_button_model.dart';
export 'choice_button_model.dart';

class ChoiceButtonWidget extends StatefulWidget {
  const ChoiceButtonWidget({
    super.key,
    required this.choice,
    required this.text1,
    required this.text2,
  });

  final bool? choice;
  final String? text1;
  final String? text2;

  @override
  State<ChoiceButtonWidget> createState() => _ChoiceButtonWidgetState();
}

class _ChoiceButtonWidgetState extends State<ChoiceButtonWidget> {
  late ChoiceButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChoiceButtonModel());

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
      decoration: const BoxDecoration(),
      child: Stack(
        children: [
          if (!widget.choice!)
            Material(
              color: Colors.transparent,
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFD8DDEA),
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFD8DDEA),
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 5.0, 10.0, 5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.text1!,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Gelion',
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ].divide(const SizedBox(width: 5.0)),
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF1D242F),
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 5.0, 10.0, 5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.text2!,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Gelion',
                                      color: const Color(0xFFE0E3E7),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ].divide(const SizedBox(width: 5.0)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (widget.choice ?? true)
            Material(
              color: Colors.transparent,
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFD8DDEA),
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Material(
                      color: Colors.transparent,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF1D242F),
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.text1!,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Gelion',
                                      color: const Color(0xFFE0E3E7),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ].divide(const SizedBox(width: 5.0)),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.text2!,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Gelion',
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ].divide(const SizedBox(width: 5.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'footer_model.dart';
export 'footer_model.dart';

class FooterWidget extends StatefulWidget {
  const FooterWidget({super.key});

  @override
  State<FooterWidget> createState() => _FooterWidgetState();
}

class _FooterWidgetState extends State<FooterWidget> {
  late FooterModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FooterModel());

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
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                FFLocalizations.of(context).getText(
                  '50uhno5w' /* COPYRIGHT © 2024 COTE-PARIURI.... */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Gelion',
                      color: FlutterFlowTheme.of(context).primary,
                      fontSize: 15.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      useGoogleFonts: false,
                    ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/pngtree-18-plus-labels-png-image_6438331.png',
                  width: 35.0,
                  height: 35.0,
                  fit: BoxFit.scaleDown,
                ),
              ),
              Text(
                FFLocalizations.of(context).getText(
                  'qm30uypr' /* 18+ | Site-ul este interzis mi... */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Gelion',
                      color: FlutterFlowTheme.of(context).primary,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      useGoogleFonts: false,
                    ),
              ),
            ].divide(const SizedBox(width: 5.0)),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/homepage-licences-onjn-trans_(2).png',
                  width: 35.0,
                  height: 35.0,
                  fit: BoxFit.scaleDown,
                ),
              ),
              Text(
                FFLocalizations.of(context).getText(
                  'kyvna2jb' /* Decizia ONJN Nr. 353/26.02.202... */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Gelion',
                      color: FlutterFlowTheme.of(context).primary,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      useGoogleFonts: false,
                    ),
              ),
            ].divide(const SizedBox(width: 5.0)),
          ),
        ].addToStart(const SizedBox(height: 5.0)).addToEnd(const SizedBox(height: 5.0)),
      ),
    );
  }
}

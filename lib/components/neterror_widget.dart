import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'neterror_model.dart';
export 'neterror_model.dart';

class NeterrorWidget extends StatefulWidget {
  const NeterrorWidget({super.key});

  @override
  State<NeterrorWidget> createState() => _NeterrorWidgetState();
}

class _NeterrorWidgetState extends State<NeterrorWidget> {
  late NeterrorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NeterrorModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 300.0,
        height: 300.0,
        decoration: BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              Icons.sync_problem_outlined,
              color: FlutterFlowTheme.of(context).error,
              size: 250.0,
            ),
            Text(
              FFLocalizations.of(context).getText(
                'sxvdc34b' /* Eroare de rețea */,
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Gelion',
                    color: Color(0xFFEC4545),
                    fontSize: 35.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w800,
                    useGoogleFonts: false,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

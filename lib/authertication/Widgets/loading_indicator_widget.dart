import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Screens/authertication_provider.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authRepo =
        Provider.of<AutherTicatationProvider>(context, listen: true);
    return authRepo.isLogedIn
        ? CircularProgressIndicator(color: Colors.orangeAccent)
        : SizedBox.shrink();
  }
}

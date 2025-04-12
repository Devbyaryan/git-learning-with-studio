import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_learning_with_studio/bloc/toggle_bloc.dart';
import 'package:git_learning_with_studio/bloc/toggle_event.dart';

import 'bloc/toggle_state.dart';

class TogglePage extends StatelessWidget {
  const TogglePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(create: (context) => ToggleBloc(),
        child: BlocBuilder<ToggleBloc, ToggleState>(
          builder: (context, state) {
            return Center(
              child: Switch(value: state.isOn, onChanged: (newValue){
                context.read<ToggleBloc>().add(ToggleSwitchEvent());
              }),
            );
          },
        ),
      ),
    );
  }
}

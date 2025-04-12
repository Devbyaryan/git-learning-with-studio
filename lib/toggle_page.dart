import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_learning_with_studio/bloc/toggle_bloc.dart';
import 'package:git_learning_with_studio/bloc/toggle_event.dart';
import 'package:git_learning_with_studio/bloc/toggle_state.dart';

class TogglePage extends StatelessWidget {
  const TogglePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => ToggleBloc(),
        child: Center(
          child: BlocBuilder<ToggleBloc, ToggleState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Switch(
                    value: state.isOn,
                    onChanged: (newValue) {
                      context.read<ToggleBloc>().add(ToggleSwitchEvent());
                    },
                    thumbIcon: WidgetStateProperty.resolveWith<Icon?>(
                          (Set<WidgetState> states) {
                        if (state.isOn) {
                          return const Icon(Icons.check);
                        } else {
                          return const Icon(Icons.close);
                        }
                      },
                    ),
                    dragStartBehavior: DragStartBehavior.start,
                  ),
                  BlocBuilder<ToggleBloc, ToggleState>(
                    builder: (context, state) {
                      return Container(
                          height: 200, width: 200, color: state.isOn ? Colors.red : Colors.blue
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

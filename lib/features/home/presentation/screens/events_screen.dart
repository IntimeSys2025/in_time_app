import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_time_app/features/home/presentation/logic/home_cubit.dart';
import '../widgets/event_card.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
        centerTitle: true,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        // physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: cubit.events.length,
        // itemCount: 7,
        itemBuilder: (context, index) {
          final event = cubit.events[index];
          // final partner = homeCubit.partners[index];
          return EventBookingCard(
            event: event,
          );
        },
      ),
    );
  }
}

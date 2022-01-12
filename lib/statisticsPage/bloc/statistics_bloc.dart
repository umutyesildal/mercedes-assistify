import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'statistics_event.dart';
part 'statistics_state.dart';

class StatisticsBloc extends Bloc<StatisticsEvent, StatisticsState> {
  StatisticsBloc() : super(StatisticsInitial()) {
    on<StatisticsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

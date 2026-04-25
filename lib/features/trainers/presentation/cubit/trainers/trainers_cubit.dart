import 'package:bloc/bloc.dart';
import 'package:fitness_app/features/trainers/data/models/trainers_model.dart';
import 'package:fitness_app/features/trainers/data/repositories/trainers_repository.dart';
import 'package:meta/meta.dart';

part 'trainers_state.dart';

class TrainersCubit extends Cubit<TrainersState> {
  TrainersCubit({required this.trainersRepository}) : super(TrainersInitial());
  final TrainersRepository trainersRepository;

  List<TrainersModel> allTrainers = []; // 🔥 الأصل
  List<TrainersModel> filteredTrainers = []; // 🔥 المعروض
  String searchQuery = "";
  Future<void> getTrainers() async {
    final result = await trainersRepository.getTrainers();
    result.fold(
      (failure) {
        emit(TrainersFailure(errorMessage: failure));
      },
      (trainers) {
        allTrainers = trainers;
        emit(TrainersSuccess(trainers: trainers));
      },
    );
  }

  void applyFilters() {
    filteredTrainers = List.of(allTrainers);
    if (searchQuery.isNotEmpty) {
      allTrainers = allTrainers.where((trainers) {
        return trainers.name.toLowerCase().contains(searchQuery.toLowerCase());
      }).toList();
    }
  }

  // ================= ACTIONS =================
  void searchTrainer(String query) {
    searchQuery = query;
    applyFilters();
    emit(TrainersSuccess(trainers: allTrainers));
  }

  void clearSearch() {
    searchQuery = "";
    applyFilters(); // 👈 هيرجع للأصل تلقائي
    emit(TrainersSuccess(trainers: allTrainers));
  }
}

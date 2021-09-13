import 'package:demo_flutter_project/models/db/database.dart';
import 'package:demo_flutter_project/models/repository/company_repository.dart';
import 'package:demo_flutter_project/models/service/company_repository.dart';
import 'package:demo_flutter_project/presentation/state/company_state.dart';
import 'package:demo_flutter_project/presentation/view_model/home_view_model.dart';
import 'package:demo_flutter_project/presentation/view_model/company_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//model
final databaseProvider = Provider.autoDispose<MyDatabase>((ref) {
  final database = MyDatabase();
  ref.onDispose(() {
  });
  return database;
});

final companyApiRepositoryProvider =
    Provider<CompanyRepositoryApi>((ref) => CompanyRepositoryApi());
final companyRepositoryProvider = Provider<CompanyRepository>(
    (ref) => CompanyRepositoryImpl(ref.read(databaseProvider)));

//viewModel
final homeViewModelProvider = Provider<HomeViewModel>((ref) => HomeViewModel());
final companyProvider =
    StateNotifierProvider<CompanyViewModel, CompanyState>(
        (ref) => CompanyViewModel(ref.read(companyRepositoryProvider)));

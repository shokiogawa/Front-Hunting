import 'package:demo_flutter_project/models/entity/company.dart';
import 'package:demo_flutter_project/models/repository/company_repository.dart';
import 'package:demo_flutter_project/presentation/state/company_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CompanyViewModel extends StateNotifier<CompanyState> {
  final CompanyRepository _companyRepository;

  CompanyViewModel(this._companyRepository)
      : super(const CompanyState());

  Future<void> makeCompany(
      String name, String detail, CompanyStatus status) async {
    state = state.copyWith(company: Company(null, name, detail, status));
    await _companyRepository.addCompanyRecords(state.company!);
    state.companyList.add(state.company!);
  }

  Future<void> listCompany() async {
    // await Future.delayed(Duration(seconds: 3));
    List<Company> company = await _companyRepository.getCompanyList();
    Map<CompanyStatus, List<Company>> varMapCompany = {
      CompanyStatus.Explanation: [],
      CompanyStatus.FirstInterview: [],
      CompanyStatus.SecondInterview: [],
      CompanyStatus.ThirdInterview: [],
      CompanyStatus.FinalInterview: [],
      CompanyStatus.Hunted: []
    };
    // Map<CompanyStatus, List<Company>> varMapCompany = {};
    for (var con in company) {
      varMapCompany[con.companyStatus]!.add(con);
    }
    state = state.copyWith(mapCompany: varMapCompany, companyList: company);
  }

  void dragAccepted(Company company, CompanyStatus newStatus) async {
    var mapCompany = {...state.mapCompany};
    mapCompany[company.companyStatus]!.remove(company);
    final newCompany = company.copyWith(companyStatus: newStatus);
    mapCompany[newStatus]!.add(newCompany);
    //新しいstatusを持った会社を保存。
    await _companyRepository
        .updateCompany(newCompany);
    state = state.copyWith(mapCompany: mapCompany);
  }

  void changeStatus(CompanyStatusJp companyStatusJp) {
    state = state.copyWith(companyStatusJp: companyStatusJp);
  }

  void changeName(String name) {
    state = state.copyWith(name: name);
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:demo_flutter_project/models/entity/company.dart';

part 'company_state.freezed.dart';

@freezed
class CompanyState with _$CompanyState {
  const factory CompanyState({
    Company? company,
    @Default(CompanyStatusJp(CompanyStatus.Explanation, "説明会"))CompanyStatusJp companyStatusJp,
    @Default({CompanyStatus.Explanation: [], CompanyStatus.FirstInterview: [], CompanyStatus.SecondInterview:[], CompanyStatus.ThirdInterview: [], CompanyStatus.FinalInterview: [], CompanyStatus.Hunted: []})Map<CompanyStatus, List<Company>> mapCompany,
    @Default("") String name,
    @Default("") String detail,
    @Default([]) List<Company> companyList,
  }) = _CompanyState;
}

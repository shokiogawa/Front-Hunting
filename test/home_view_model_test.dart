import 'package:demo_flutter_project/di.dart';
import 'package:demo_flutter_project/presentation/view_model/home_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  late HomeViewModel homeViewModel;

  setUp((){
    final container = ProviderContainer();
    homeViewModel = container.read(homeViewModelProvider);
    SharedPreferences.setMockInitialValues({});
  });

  test('saveIsPassT()', ()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    await homeViewModel.saveIsPassT();
    final expectedTime = pref.getBool('isPassT');
    expect(true, expectedTime);
  });
}
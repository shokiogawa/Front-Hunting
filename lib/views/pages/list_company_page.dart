import 'package:demo_flutter_project/di.dart';
import 'package:demo_flutter_project/models/entity/company.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CompanyCard extends StatelessWidget {
  final Company company;

  CompanyCard(this.company);

  @override
  Widget build(BuildContext context) {
    return Draggable(
      data: company,
      feedback: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(company.name),
        ),
      ),
      child: InkWell(
        onLongPress: () {
          showCompanyDetailDialog(context, company);
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(company.name),
          ),
        ),
      ),
      childWhenDragging: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            company.name,
            style: TextStyle(color: Colors.black.withOpacity(0.5)),
          ),
        ),
      ),
    );
  }

  void showCompanyDetailDialog(BuildContext context, Company company) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 20),
            backgroundColor: Colors.transparent,
            contentPadding:
                EdgeInsets.only(left: 0.0, top: 0, right: 0.0, bottom: 0),
            children: [
              Container(
                padding: EdgeInsets.only(top: 30),
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                          padding: EdgeInsets.only(top: 10),
                          child: Center(
                              child: Text(company.name,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 16)))),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(minHeight: 100),
                            child: Text(company.detail)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }
}

class ListCompanyPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(companyProvider);
    final viewModel = ref.read(companyProvider.notifier);
    final future = useMemoized(() async => await viewModel.listCompany());
    final snapshot = useFuture(future, initialData: []);
    if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasError) {
        throw snapshot.error!;
      }
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: DragTarget(onAccept: (Company data) {
            print(data.name);
            // viewModel.dragAccepted(
            //     data, statusList[index].companyStatus);
          },
              builder: (context, accepted, rejected) {
            return Icon(Icons.restore_from_trash);
          }),
            onPressed: (){print("やあ");}),
        body: ListView.builder(
            itemCount: statusList.length,
            itemBuilder: (BuildContext context, int index) {
              final List<Widget> listWidget = state
                  .mapCompany[statusList[index].companyStatus]!
                  .map((company) => CompanyCard(company))
                  .toList();
              return Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: SizedBox(
                  height: 200,
                  child: Card(
                    child: Column(
                      children: [
                        Expanded(
                            flex: 1, child: Text(statusList[index].statusJp)),
                        Expanded(
                          flex: 6,
                          child: DragTarget(onAccept: (Company data) {
                            viewModel.dragAccepted(
                                data, statusList[index].companyStatus);
                          }, builder: (context, accepted, rejected) {
                            return Container(
                              width: double.infinity,
                              child: Card(
                                color: Colors.indigoAccent.withOpacity(0.3),
                                child: Wrap(
                                  alignment: WrapAlignment.start,
                                  direction: Axis.horizontal,
                                  children: [...listWidget],
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}

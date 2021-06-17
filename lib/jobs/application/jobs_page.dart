import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ioniconf_2021_flutter/core/injection/injection.dart';
import 'package:ioniconf_2021_flutter/jobs/application/cubit/jobs_cubit.dart';
import 'package:ioniconf_2021_flutter/jobs/application/job_details/job_details_page.dart';
import 'package:ioniconf_2021_flutter/jobs/widgets/custom_sliver_grid_delegate.dart';
import 'package:ioniconf_2021_flutter/jobs/widgets/jobs_card_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

const Duration _changeStateDuration = Duration(milliseconds: 200);
const double _toolbarHeight = 45;
const Color _toolBarColor = const Color(0xFF5924B0);

class JobsPage extends StatefulWidget {
  const JobsPage({Key? key}) : super(key: key);

  @override
  _JobsPageState createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<JobsCubit>(
      create: (_) => getIt<JobsCubit>()..initialize(),
      child: Scaffold(
        appBar: _appBar(),
        body: BlocBuilder<JobsCubit, JobsState>(
          builder: _builder,
        ),
      ),
    );
  }

  PreferredSizeWidget _appBar() => AppBar(
        toolbarHeight: _toolbarHeight,
        backgroundColor: _toolBarColor,
        leading: const Icon(Icons.menu),
        centerTitle: false,
        title: const Text("Jobs"),
      );

  Widget _builder(BuildContext context, JobsState state) => AnimatedSwitcher(
        duration: _changeStateDuration,
        child: state.maybeMap(
          showLoading: (_) => Center(child: const CupertinoActivityIndicator()),
          showError: (state) => _buildError(state.error),
          showView: (state) => _buildResponsiveBuilder(context, state),
          orElse: () => _buildError("Something went wrong!"),
        ),
      );

  Widget _buildResponsiveBuilder(BuildContext context, ShowView state) {
    return ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) {
        return GridView.builder(
            itemCount: state.jobList.length,
            gridDelegate: CustomSliverGridDelegate(
              height: 395,
              crossAxisCount: (sizingInformation.deviceScreenType ==
                          DeviceScreenType.mobile ||
                      sizingInformation.deviceScreenType ==
                          DeviceScreenType.tablet ||
                      sizingInformation.deviceScreenType ==
                          DeviceScreenType.watch)
                  ? 1
                  : 4,
            ),
            itemBuilder: (context, index) {
              return JobsCardWidget(
                  job: state.jobList.elementAt(index),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => JobDetailsPage(
                              job: state.jobList.elementAt(index))),
                    );
                  });
            });
      },
    );
  }

  Widget _buildError(String message) => Center(child: Text(message));
}

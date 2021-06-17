import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ioniconf_2021_flutter/core/injection/injection.dart';
import 'package:ioniconf_2021_flutter/core/theme/colors.dart';
import 'package:ioniconf_2021_flutter/jobs/application/job_details/cubit/job_details_cubit.dart';
import 'package:ioniconf_2021_flutter/jobs/application/job_details/widgets/bottom_widget.dart';
import 'package:ioniconf_2021_flutter/jobs/application/job_details/widgets/desktop/calendar_desktop_widget.dart';
import 'package:ioniconf_2021_flutter/jobs/application/job_details/widgets/desktop/info_image_widget.dart';
import 'package:ioniconf_2021_flutter/jobs/application/job_details/widgets/desktop/job_details_desktop.dart';
import 'package:ioniconf_2021_flutter/jobs/application/job_details/widgets/mobile/calendar_widget.dart';
import 'package:ioniconf_2021_flutter/jobs/application/job_details/widgets/mobile/job_details_card.dart';
import 'package:ioniconf_2021_flutter/jobs/application/job_details/widgets/mobile/job_status.dart';
import 'package:ioniconf_2021_flutter/jobs/application/job_details/widgets/mobile/see_on_map_card.dart';
import 'package:ioniconf_2021_flutter/jobs/application/job_details/widgets/mobile/shift_licence_card.dart';
import 'package:ioniconf_2021_flutter/models/job/job.dart';
import 'package:responsive_builder/responsive_builder.dart';

const Duration _changeStateDuration = Duration(milliseconds: 200);
const double _toolbarHeight = 45;

class JobDetailsPage extends StatefulWidget {
  final Job job;
  const JobDetailsPage({Key? key, required this.job}) : super(key: key);

  @override
  _JobDetailsPageState createState() => _JobDetailsPageState();
}

class _JobDetailsPageState extends State<JobDetailsPage> {
  @override
  void dispose() {
    getIt<JobDetailsCubit>()..close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<JobDetailsCubit>(
      create: (_) => getIt<JobDetailsCubit>()..initialize(job: widget.job),
      child: Scaffold(
        appBar: _appBar(),
        body: BlocBuilder<JobDetailsCubit, JobDetailsState>(
          builder: _builder,
        ),
      ),
    );
  }

  PreferredSizeWidget _appBar() => AppBar(
        toolbarHeight: _toolbarHeight,
        backgroundColor: ThemeColors.toolBarColor,
        leading: GestureDetector(
            child: Icon(Icons.arrow_back_ios),
            onTap: () => Navigator.pop(context)),
        centerTitle: false,
        title: const Text("Job Details"),
      );

  Widget _builder(BuildContext context, JobDetailsState state) =>
      AnimatedSwitcher(
        duration: _changeStateDuration,
        child: state.maybeMap(
          showLoading: (_) => Center(child: const CupertinoActivityIndicator()),
          showError: (state) => _buildError(state.error),
          showView: (state) => _buildResponsiveBuilder(context, state),
          orElse: () => _buildError("Something went wrong!"),
        ),
      );

  Widget _buildResponsiveBuilder(BuildContext context, ShowView state) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ResponsiveBuilder(
          builder: (BuildContext context, SizingInformation sizingInformation) {
            if (sizingInformation.deviceScreenType == DeviceScreenType.mobile ||
                sizingInformation.deviceScreenType == DeviceScreenType.tablet ||
                sizingInformation.deviceScreenType == DeviceScreenType.watch)
              return _buildMobile(context, state);
            return _buildDesktop(context, state);
          },
        ),
        Positioned(child: BottomWidget(), bottom: 0, left: 0, right: 0)
      ],
    );
  }

  Widget _buildMobile(BuildContext context, ShowView state) {
    return SingleChildScrollView(
        child: Column(children: [
      ShiftLicenceCard(job: state.job),
      SeeOnMapCard(job: state.job),
      JobStatusWidget(job: state.job),
      JobDetailsCard(job: state.job),
      CalendarWidget(job: state.job),
      SizedBox(height: 100),
    ]));
  }

  Widget _buildDesktop(BuildContext context, ShowView state) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InfoImageWidget(job: state.job),
              JobDetailsDesktop(job: state.job),
            ],
          ),
          CalendarDesktopWidget(job: state.job),
          SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _buildError(String message) => Center(child: Text(message));
}

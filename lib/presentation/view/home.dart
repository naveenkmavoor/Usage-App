import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task/cubit/screentime_cubit.dart';
import 'package:task/data/convert.dart';
import 'package:task/presentation/styles.dart';
import 'package:task/presentation/widget/circular_progress.dart';
import 'package:task/presentation/widget/custom_container.dart';
import 'package:task/presentation/widget/indicator.dart';
import 'package:task/presentation/widget/linear_progress.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ScreentimeCubit>(context).getScreenTime();
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 10,
          elevation: 2.0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.pink[100],
            ),
          ),
          title: const Text('Michel'),
          actions: [
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'asset/images/settings.svg',
                  fit: BoxFit.cover,
                  color: Colors.black,
                ))
          ],
        ),
        body: BlocBuilder<ScreentimeCubit, ScreentimeState>(
          builder: (context, state) {
            if (state is! ScreentimeLoaded) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            //fetch the screen time instance from the state screentimeLoaded
            final screenTime = (state).screenTimes;
            final classTime = screenTime.chartData.classTime;
            final studyTime = screenTime.chartData.studyTime;
            final freeTime = screenTime.chartData.freeTime;
            //convert the time to the format we want ie, h:m
            final freeTimeFormat = Convert.convertMtoHM(freeTime);
            final freeTimeMaxUsage =
                Convert.convertMtoHM(screenTime.freeTimeMaxUsage);
            //Free time progress to plot
            final freeTimeProgress = freeTime / screenTime.freeTimeMaxUsage;
            final totalMobileTime =
                Convert.convertMtoHM(screenTime.deviceUsage.totalTime.mobile);
            final totalLaptopTime =
                Convert.convertMtoHM(screenTime.deviceUsage.totalTime.laptop);
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    const Text(
                      'Dashboard',
                      style: TextStyle(
                          fontFamily: 'EuclidCircularB',
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    AspectRatio(
                        aspectRatio: 1.5,
                        child: CircularProgress(
                          screenTime: screenTime,
                          classTime: classTime,
                          studyTime: studyTime,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Indicator(
                          color: const Color(
                            0xFF2D82FE,
                          ),
                          text1: 'Class',
                          text2: Convert.convertMtoHM(classTime),
                        ),
                        Indicator(
                          color: const Color(
                            0xFFFF9E57,
                          ),
                          text1: 'Study',
                          text2: Convert.convertMtoHM(studyTime),
                        ),
                        Indicator(
                          color: const Color(
                            0xFF2FED51,
                          ).withOpacity(0.76),
                          text1: 'Free-time',
                          text2: freeTimeFormat,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 32.92,
                    ),
                    const Divider(
                      thickness: 0.5,
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    const Text('Free-time Usage',
                        style: TextStyle(
                            fontFamily: 'EuclidCircularB',
                            fontSize: 20,
                            fontWeight: FontWeight.w400)),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Used', style: textStyle2),
                        Text(
                          'Max',
                          style: textStyle2,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(freeTimeFormat, style: textStyle1),
                        Text(
                          freeTimeMaxUsage,
                          style: textStyle3,
                        )
                      ],
                    ),
                    SizedBox(
                      width: 400,
                      height: 50,
                      child: LinearProgress(freeTimeProgress: freeTimeProgress),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomContainer(),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      'Change Time Restrictions',
                      style: textStyle5,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Divider(
                      thickness: 0.5,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      'By Devices',
                      style: textStyle6,
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 70,
                          height: 70,
                          child: SvgPicture.asset(
                            'asset/images/mobile.svg',
                            fit: BoxFit.cover,
                            color: Colors.black,
                          ),
                        ),
                        Column(
                          children: [
                            const Text('Adi\'s Phone', style: textStyle6),
                            Text(totalMobileTime, style: textStyle7),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 38,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 70,
                          height: 70,
                          child: SvgPicture.asset(
                            'asset/images/laptop.svg',
                            fit: BoxFit.cover,
                            color: Colors.black,
                          ),
                        ),
                        Column(
                          children: [
                            const Text('Adi\'s Laptop', style: textStyle6),
                            Text(totalLaptopTime, style: textStyle7),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 27,
                    ),
                    const Text('See All Devices', style: textStyle5),
                  ],
                ),
              ),
            );
          },
        ));
  }
}

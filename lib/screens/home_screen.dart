import 'package:animate_gradient/animate_gradient.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/controllers/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Obx(
        () => AnimateGradient(
          primaryColors: const [
            Color.fromARGB(255, 96, 96, 96),
            Color.fromARGB(255, 63, 63, 63),
            Color.fromARGB(255, 28, 28, 28),
          ],
          secondaryColors: const [
            Color.fromARGB(255, 28, 28, 28),
            Color.fromARGB(255, 63, 63, 63),
            Color.fromARGB(255, 96, 96, 96),
          ],
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.grey[100],
                        ),
                        Text(
                          controller.weatherModel.value.cityName ?? '',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[100],
                            fontSize: 40,
                          ),
                        ),
                      ],
                    ),
                    LottieBuilder.asset(
                      controller.weatherAnimation(
                        mainCondition: '',
                      ),
                    ),
                    Text(
                      '${controller.weatherModel.value.temperature?.round()} °',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[100],
                        fontSize: 50,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

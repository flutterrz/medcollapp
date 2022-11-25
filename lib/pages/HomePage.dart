import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medcollapp/controllers/HomeController.dart';
import 'package:medcollapp/widgets/LabelText.dart';
import 'package:medcollapp/widgets/ProgressContainerView.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _homeController = HomeController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((t) {
      _homeController.initData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Obx(
        () => ProgressContainerView(
          isProgressRunning: _homeController.showProgress,
          child: Column(
            children: [
              _countryCard(),
              const SizedBox(height: 12),
              _currencyCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _currencyCard() {
    return Card(
      margin: const EdgeInsets.all(12),
      child: Container(
        width: Get.width,
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LabelText(
                title: "Conversation Rate (1 USD)",
                value:
                    _homeController.currencyInfo.rates?.iNR.toString() ?? "-")
          ],
        ),
      ),
    );
  }

  Widget _countryCard() {
    return Card(
      margin: const EdgeInsets.all(12),
      child: Container(
        width: Get.width,
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: LabelText(
                    title: "Capital Code",
                    value: _homeController.countryData.countryCode ?? "-",
                  ),
                ),
                Expanded(
                  child: LabelText(
                    title: "Country Name",
                    value: _homeController.countryData.countryName ?? "-",
                  ),
                ),
                Expanded(
                  child: LabelText(
                    title: "Capital",
                    value: _homeController.countryData.capital ?? "-",
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: LabelText(
                    title: "population",
                    value: _homeController.countryData.population ?? "-",
                  ),
                ),
                Expanded(
                  child: LabelText(
                    title: "Area",
                    value: _homeController.countryData.areaInSqKm ?? "-",
                  ),
                ),
                Expanded(
                  child: LabelText(
                    title: "Continent Name",
                    value: _homeController.countryData.continentName ?? "-",
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            LabelText(
              title: "Languages",
              value: _homeController.countryData.languages ?? "-",
            ),
          ],
        ),
      ),
    );
  }
}

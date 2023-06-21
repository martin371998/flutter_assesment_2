import 'package:flutter/material.dart';
import 'package:flutter_assesment_2/API/dio_client.dart';
import 'package:flutter_assesment_2/models/forecast_model.dart';
import 'package:flutter_assesment_2/models/weather_model.dart';
import 'package:flutter_assesment_2/screens/daile_screen.dart';
import 'package:flutter_assesment_2/screens/forecast_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController? _pageController;
  int _currentIndex = 0;
  DioClient? dioClient;
  WeatherModel? weatherModel;

  @override
  void initState() {
    _pageController = PageController(initialPage: _currentIndex);
    dioClient = DioClient();
    super.initState();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onNavItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      _pageController?.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null, // Hide the AppBar
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    _onNavItemTapped(0);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                    color:
                        _currentIndex == 0 ? Colors.blue : Colors.transparent,
                    child: Text(
                      'Tab 1',
                      style: TextStyle(
                        fontSize: 16,
                        color: _currentIndex == 0 ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _onNavItemTapped(1);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                    color:
                        _currentIndex == 1 ? Colors.blue : Colors.transparent,
                    child: Text(
                      'Tab 2',
                      style: TextStyle(
                        fontSize: 16,
                        color: _currentIndex == 1 ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                children: [
                  Container(
                      child: FutureBuilder<WeatherModel>(
                          future: dioClient?.getWeather(),
                          builder: (context, snapshot) {
                            return snapshot.hasData
                                ? DailyScreen(
                                    weatherModel: snapshot.data,
                                  )
                                : Container();
                          })),
                  Container(
                      child: FutureBuilder<ForeCastModel?>(
                          future: dioClient?.getWeatherList(),
                          builder: (context, snapshot) {
                            return snapshot.hasData
                                ? ForeCastScreen(
                                    foreCastModel: snapshot.data,
                                  )
                                : Container();
                          })),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onNavItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Tab 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Tab 2',
          ),
        ],
      ),
    );
  }
}

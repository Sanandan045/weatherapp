import 'package:flutter/material.dart';
import 'package:weatherapp/model/weather_model.dart';

class WeatherDetailsPage extends StatelessWidget {
  final ApiResponse response;

  const WeatherDetailsPage({Key? key, required this.response})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Icon(
                    Icons.location_on,
                    size: 50,
                  ),
                  Text(
                    response.location?.name ?? "",
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    response.location?.country ?? "",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${response.current?.tempC ?? ""} °c",
                      style: const TextStyle(
                        fontSize: 55,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    response.current?.condition?.text ?? "",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Center(
                child: SizedBox(
                  height: 200,
                  child: Image.network(
                    "https:${response.current?.condition?.icon}"
                        .replaceAll("64x64", "128x128"),
                    scale: 0.7,
                  ),
                ),
              ),
              Card(
                elevation: 4,
                color: Colors.blueAccent,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _dataAndTitleWidget("Humidity",
                            response.current?.humidity?.toString() ?? ""),
                        _dataAndTitleWidget("Wind Speed",
                            "${response.current?.windKph?.toString() ?? ""} km/h"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _dataAndTitleWidget(
                            "UV", response.current?.uv?.toString() ?? ""),
                        _dataAndTitleWidget("Precipitation",
                            "${response.current?.precipMm?.toString() ?? ""} mm"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _dataAndTitleWidget(
                            "Local Time",
                            response.location?.localtime?.split(" ").last ??
                                ""),
                        _dataAndTitleWidget(
                            "Local Date",
                            response.location?.localtime?.split(" ").first ??
                                ""),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // This is widget use for showing date and title .

  Widget _dataAndTitleWidget(String title, String data) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Text(
            data,
            style: const TextStyle(
              fontSize: 27,
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

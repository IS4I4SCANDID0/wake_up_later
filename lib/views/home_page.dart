import 'package:flutter/material.dart';
import '../models/alarm_model.dart';

class AlarmHomePage extends StatefulWidget {
  final Function(ThemeMode) onThemeChanged;
  const AlarmHomePage({super.key, required this.onThemeChanged});

  @override
  State<AlarmHomePage> createState() => _AlarmHomePageState();
}

class _AlarmHomePageState extends State<AlarmHomePage> {
  // Lista ficitícia e provisória de alarmes
  List<AlarmModel> alarms = [
    AlarmModel(
      time: '07:30',
      label: 'Caminhada no Parque',
      weatherForecastCheck: true,
    ),
    AlarmModel(
      time: '09:00',
      label: 'Reunião Presencial',
      weatherForecastCheck: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wake Up Later ⛅'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              // Alterna entre os modos de tema claro e escuro
              final isDarkMode = Theme.of(context).brightness == Brightness.dark
                  ? ThemeMode.light
                  : ThemeMode.dark;
              widget.onThemeChanged(isDarkMode);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: alarms.length,
        itemBuilder: (context, index) {
          final alarm = alarms[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const Icon(
                Icons.alarm,
                size: 40,
                color: Colors.deepPurpleAccent,
              ),
              title: Text(
                alarm.time,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(alarm.label),
              trailing: Switch(value: true, onChanged: (val) {}),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Aqui abriremos a tela de novo alarme
        },
        label: const Text('Novo Alarme'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}

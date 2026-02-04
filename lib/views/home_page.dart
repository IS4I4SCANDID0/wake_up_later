import 'package:flutter/material.dart';
// import 'package:wake_up_later/core/theme/app_theme.dart';
import 'package:wake_up_later/models/alarm_model.dart';
import 'package:wake_up_later/widgets/switch_theme.dart';
// import 'package:wake_up_later/core/theme/app_theme.dart';

class AlarmHomePage extends StatefulWidget {
  final Function(ThemeMode) onThemeChanged;
  const AlarmHomePage({super.key, required this.onThemeChanged});

  @override
  State<AlarmHomePage> createState() => _AlarmHomePageState();
}

class _AlarmHomePageState extends State<AlarmHomePage> {
  // Lista ficitícia e provisória de alarmes
  List<AlarmModel> alarms = [
    AlarmModel(time: '07:30', label: 'Caminhada no Parque', weatherCheck: true),
    AlarmModel(time: '09:00', label: 'Reunião Presencial', weatherCheck: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wake Up Later ⛅'),
        centerTitle: true,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        actions: [
          // Botão para alternar o tema com padding
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: SwitchThemeBtn(
              isDark: Theme.of(context).brightness == Brightness.dark,
              onThemeChanged: widget.onThemeChanged,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: alarms.length,
        itemBuilder: (context, index) {
          final alarm = alarms[index];
          return Card(
            surfaceTintColor: Theme.of(context).brightness == Brightness.dark
                ? Colors.black38
                : Colors.white30,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              // selectedColor: ,
              leading: Icon(
                Icons.alarm,
                size: 24,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
              ),
              title: Text(
                alarm.time,
                style: const TextStyle(
                  fontSize: 18,
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
        extendedPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 8,
        ),
        label: const Text('Novo Alarme'),
        extendedTextStyle: TextStyle(fontWeight: FontWeight.w600),
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.black
            : Colors.white,
        icon: const Icon(Icons.add),
      ),
    );
  }
}

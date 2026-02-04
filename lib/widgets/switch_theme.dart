import 'package:flutter/material.dart';
import 'package:wake_up_later/core/theme/app_theme.dart';

class SwitchThemeBtn extends StatelessWidget {
  final bool isDark;
  final Function(ThemeMode) onThemeChanged;

  const SwitchThemeBtn({
    super.key,
    required this.isDark,
    required this.onThemeChanged,
  });

  // Widget personalizado para o troca de tema
  @override
  Widget build(BuildContext context) {
    // verifica se o tema atual é escuro
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      // Usamos  função que veio do constructor(widget.onThemeChanged) para alternar o tema
      onTap: () {
        onThemeChanged(isDark ? ThemeMode.light : ThemeMode.dark);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 55,
        height: 22,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: isDark
              ? AppColors.primaryLightColor
              : AppColors.primaryDarkColor,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Ícone de fundo (sol e lua)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.wb_sunny,
                  size: 16,
                  color: AppColors.accentSwitchIcon,
                ),
                Icon(
                  Icons.nightlight_round,
                  size: 18,
                  color: AppColors.accentSwitchIcon,
                ),
              ],
            ),
            // Bolinha que se move
            AnimatedAlign(
              duration: const Duration(microseconds: 300),
              // Se o tema for escuro, alinha à direita, senão à esquerda
              alignment: isDark ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isDark
                      ? AppColors.primaryDarkColor
                      : AppColors.primaryLightColor,

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

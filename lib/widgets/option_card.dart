import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  final String optionText;
  final bool isSelected; // Menandakan apakah ini jawaban yang dipilih
  final VoidCallback onTap; // Fungsi yang dipanggil saat diklik

  const OptionCard({
    super.key,
    required this.optionText,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: isSelected ? 8 : 2, // Efek bayangan jika dipilih
      color: isSelected ? Theme.of(context).primaryColorLight : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: isSelected
              ? Theme.of(context).primaryColor
              : Colors.grey.shade300,
          width: 2,
        ),
      ),
      child: InkWell(
        // Efek ripple saat diklik
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(
                isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
                color: isSelected
                    ? Theme.of(context).primaryColor
                    : Colors.grey,
              ),
              SizedBox(width: 16),
              Expanded(
                child: Text(
                  optionText,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

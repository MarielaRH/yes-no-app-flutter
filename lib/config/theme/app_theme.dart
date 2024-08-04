import 'package:flutter/material.dart';

// Los colores hexagesimales se representan anteponiendo 0xFF ante del numero del color.
/**Las propiedades cuyo nombre inicia con _ significa que son propiedades privadas y solo pueden ser utilizadas
 * dentro de la clase que fueron declaras
 *  */

const Color _customColor = Color(0xFF161F61);
const List<Color> _colorThemes = [
  _customColor,
  Color.fromARGB(255, 34, 3, 110),
  Color.fromARGB(255, 255, 153, 0),
  Color.fromARGB(255, 102, 146, 40),
  Color.fromARGB(255, 48, 156, 52),
  Color.fromARGB(202, 2, 141, 255)
];

class AppTheme {
  final int selectedColor;

  /**
  * Las asersiones nos permiten especificar validaciones que se deben cumplir para que nuestro código no se rompa, estas se muestran
  al usuario de manera informativa
  */
  AppTheme({this.selectedColor = 3})
      : assert(selectedColor >= 0 && selectedColor < _colorThemes.length,
            'Colors must be between 0 and ${_colorThemes.length}');

  ThemeData theme() {
    //colorSchemeSeed
    return ThemeData(
        useMaterial3: true,
        colorSchemeSeed: _colorThemes[selectedColor],
        brightness: Brightness.dark);
  }
}

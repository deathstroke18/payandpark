import 'package:flutter/material.dart';
import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:image/image.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'dart:typed_data';
import 'package:payandpark/services/database.dart';


Future<void> testReceipt(NetworkPrinter printer) async {
  printer.text(
      'Regular: aA bB cC dD eE fF gG hH iI jJ kK lL mM nN oO pP qQ rR sS tT uU vV wW xX yY zZ');
  printer.text('Special 1: àÀ èÈ éÉ ûÛ üÜ çÇ ôÔ',
      styles: PosStyles(codeTable: 'CP1252'));
  printer.text('Special 2: blåbærgrød',
      styles: PosStyles(codeTable: 'CP1252'));

  printer.text('Bold text', styles: PosStyles(bold: true));
  printer.text('Reverse text', styles: PosStyles(reverse: true));
  printer.text('Underlined text',
      styles: PosStyles(underline: true), linesAfter: 1);
  printer.text('Align left', styles: PosStyles(align: PosAlign.left));
  printer.text('Align center', styles: PosStyles(align: PosAlign.center));
  printer.text('Align right',
      styles: PosStyles(align: PosAlign.right), linesAfter: 1);

  printer.row([
    PosColumn(
      text: 'col3',
      width: 3,
      styles: PosStyles(align: PosAlign.center, underline: true),
    ),
    PosColumn(
      text: 'col6',
      width: 6,
      styles: PosStyles(align: PosAlign.center, underline: true),
    ),
    PosColumn(
      text: 'col3',
      width: 3,
      styles: PosStyles(align: PosAlign.center, underline: true),
    ),
  ]);

  printer.text('Text size 200%',
      styles: PosStyles(
        height: PosTextSize.size2,
        width: PosTextSize.size2,
      ));
  printer.feed(2);
  printer.cut();
}

Future _generateBarCode(poop) async {
  Uint8List result = await scanner.generateBarCode(poop);
  print(result);
}

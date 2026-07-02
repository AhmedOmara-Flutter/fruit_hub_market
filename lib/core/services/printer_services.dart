// import 'package:unified_esc_pos_printer/unified_esc_pos_printer.dart';
//
// class PrinterService {
//   PrinterService._();
//
//   static final PrinterService instance = PrinterService._();
//
//   final PrinterManager _manager = PrinterManager();
//
//   PrinterDevice? _device;
//
//   bool get isConnected => _manager.isConnected;
//
//   Future<List<PrinterDevice>> scanPrinters() async {
//     return await _manager.scanPrinters(
//       timeout: const Duration(seconds: 5),
//     );
//   }
//
//   Future<void> connect(PrinterDevice device) async {
//     await _manager.connect(device);
//     _device = device;
//   }
//
//   Future<void> disconnect() async {
//     await _manager.disconnect();
//     _device = null;
//   }
//
//   Future<void> printTest() async {
//     if (!_manager.isConnected) {
//       throw Exception("Printer not connected");
//     }
//
//     final ticket = await Ticket.create(PaperSize.mm80);
//
//     ticket.text(
//       "HIKAYA",
//       align: PrintAlign.center,
//       style: const PrintTextStyle(
//         bold: true,
//         height: TextSize.size3,
//         width: TextSize.size3,
//       ),
//     );
//
//     ticket.separator();
//
//     ticket.text(
//       "Printer Connected Successfully",
//       align: PrintAlign.center,
//     );
//
//     ticket.separator();
//
//     ticket.cut();
//
//     await _manager.printTicket(ticket);
//   }
//
//   PrinterManager get manager => _manager;
// }
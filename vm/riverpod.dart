import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/vm/main_vm.dart';

final mainVM = ChangeNotifierProvider<MainVM>((ref) => MainVM());
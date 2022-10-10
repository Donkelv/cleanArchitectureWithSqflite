import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/utils/exports.dart';
import '../../domain/notifier/create_customer_notifier.dart';

class CustomDateSelector extends ConsumerWidget {
  
  const CustomDateSelector({Key? key, this.onTap}) : super(key: key);

  final void Function()? onTap;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: ColorConst().grayColor300, width: 1.0),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(8.0),
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 13.0.h),
            child: Text(
              ref.watch(customerRegProvider.notifier).dob.text.isEmpty ? "Select date" : ref.watch(customerRegProvider.notifier).dob.text,
              style: normalText().copyWith(color: ColorConst().grayColor700),
            ),
          ),
        ),
      ),
    );
  }
}

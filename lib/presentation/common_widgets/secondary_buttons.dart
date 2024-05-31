part of 'common_widgets_import.dart';

class Secondarybottom extends StatelessWidget {
  final String text;
  final VoidCallback onpressed;

  const Secondarybottom({
    super.key,
    required this.text,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(18.r),
          ),
          height: 50.h,
          width: MediaQuery.sizeOf(context).width,
          child:
              text.text.size(20.sp).bold.color(Colors.white).make().centered()),
    );
  }
}

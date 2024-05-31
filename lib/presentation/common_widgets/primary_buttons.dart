part of 'common_widgets_import.dart';

class Primarybottom extends StatelessWidget {
  final String text;
  final VoidCallback onpressed;
  final bool? isloading;

  const Primarybottom({
    super.key,
    required this.text,
    required this.onpressed,
    this.isloading,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.white,
      onTap: onpressed,
      child: Container(
          decoration: BoxDecoration(
            color: MyColors.appcolor,
            borderRadius: BorderRadius.circular(18.r),
          ),
          height: 50.h,
          width: MediaQuery.sizeOf(context).width,
          child: isloading == true
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.white,
                ))
              : text.text
                  .size(18.sp)
                  .bold
                  .color(Colors.white)
                  .make()
                  .centered()),
    );
  }
}

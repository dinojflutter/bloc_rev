part of 'home_imports.dart';

@RoutePage()
class HomeDetails extends StatefulWidget {
  const HomeDetails({super.key});

  @override
  State<HomeDetails> createState() => _HomeDetailsState();
}

class _HomeDetailsState extends State<HomeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "One Piece Episode 1081 Release Date and Time"
            .text
            .ellipsis
            .color(Colors.white)
            .make(),
      ),
      body: ListView(
        children: [
          Image.asset(
            MyAssets.assetsImagesLogoNetflix,
          ),
          10.h.heightBox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                "One Piece Episode 1081 Release Date and Time"
                    .text
                    .bold
                    .xl2
                    .make(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(FeatherIcons.eye),
                    5.w.widthBox,
                    "160 Views".text.make(),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FeatherIcons.thumbsUp,
                        color: Colors.green,
                      ),
                    ),
                    "0".text.make(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        FeatherIcons.thumbsDown,
                        color: Colors.red,
                      ),
                    ),
                    "0".text.make(),
                  ],
                ),
                """It is confirmed that Shanks will finally make a comeback to the anime after years, as shown in the episode 1081 teaser shown at the end of last week’s episode (#1080). One Piece episode 1081, titled “The World Will Burn! The Onslaught of a Navy Admiral,” will be released on October 29, 2023, (Sunday) at 09:30 AM JST. Ryokyugyu, one of the strongest admirals, will also make an appearance. The Wano land has been successfully liberated after Luffy’s battle with Kaido. Yet, word of the two Yonkos being overthrown by the worst generation has spread to every part of the globe.
                
                It is confirmed that Shanks will finally make a comeback to the anime after years, as shown in the episode 1081 teaser shown at the end of last week’s episode (#1080). One Piece episode 1081, titled “The World Will Burn! The Onslaught of a Navy Admiral,” will be released on October 29, 2023, (Sunday) at 09:30 AM JST. Ryokyugyu, one of the strongest admirals, will also make an appearance. The Wano land has been successfully liberated after Luffy’s battle with Kaido. Yet, word of the two Yonkos being overthrown by the worst generation has spread to every part of the globe."""
                    .text
                    .make()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

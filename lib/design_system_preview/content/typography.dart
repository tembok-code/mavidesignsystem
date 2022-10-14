import 'package:flutter/material.dart';
import '../../theme/theme.dart';
import '../components/components_preview.dart';

class ContentTypography extends StatelessWidget {
  const ContentTypography({super.key});

  @override
  Widget build(BuildContext context) {
    //
    var colorScheme = Theme.of(context).colorScheme;
    Color colorPrimary = colorScheme.primary;
    //
    String title = "Typography";
    String bodyTextSample =
        "There are many variations of passages of Lorem Ipsiom avalieable, but the majority have suffered alteration in some form, by injected humour.";
    String loremIpsum =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum";

    return CustomScrollView(
      slivers: [
        SectionWidget(title: '$title - Font', slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: margin_lg),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MaviTextTheme().h2(text: title),
                      maviThemeSpacer(),
                      Container(color: colorPrimary, height: 2, width: 50),
                      maviThemeSpacer(),
                      MaviTextTheme().body(
                          text:
                              'As a web font you should use Poppins for all headlines and Hind for body text. Every graphic design artwork should be made using these two fonts.'),
                      maviThemeSpacer(),
                      MaviTextTheme().bodyBig(text: 'Headlines'),
                      MaviTextTheme().bodyBold(
                          text: 'https://fonts.google.com/specimen/Poppins'),
                      MaviTextTheme().body(
                          text:
                              'The Devanagari is designed by Ninad Kale. The Latin is by Jonny Pinhorn. TO controbute, see github.com/itfoundary/poppins'),
                      maviThemeSpacer(),
                      MaviTextTheme().bodyBig(text: 'Body Text'),
                      MaviTextTheme().bodyBold(
                          text: 'https://fonts.google.com/specimen/Hind'),
                      MaviTextTheme().body(
                          text:
                              'Designed by: Manushi Parikh for the indian Type Foundry, who first published the fonts in 2014.'),
                    ],
                  )),
                  SizedBox(height: 100, child: maviThemeVerticalSpacer()),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        _fontResume(
                            fontName: "Poppins",
                            use: "Headings",
                            style: MaviTextTheme().headingStyle()),
                        _fontResume(
                            fontName: "Hind",
                            use: "Body",
                            style: MaviTextTheme().bodyStyle()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
        SectionWidget(title: '$title - Headers', slivers: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: margin_lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _fontStyleRow(MaviTextTheme().h1(), 'This is a Header H1'),
                _fontStyleRow(MaviTextTheme().h2(), 'This is a Header H2'),
                _fontStyleRow(MaviTextTheme().h3(), 'This is a Header H3'),
                _fontStyleRow(MaviTextTheme().h4(), 'This is a Header H4'),
                _fontStyleRow(
                    MaviTextTheme().subtitle(), 'This is a big subtitle'),
                _fontStyleRow(MaviTextTheme().buttonText(), 'Button Text'),
                _fontStyleRow(MaviTextTheme().overline(), 'Overline'),
              ].map((e) => Column(children: [e, maviThemeSpacer()])).toList(),
            ),
          ),
        ]),
        SectionWidget(title: '$title - Body Text', slivers: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: margin_lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _fontStyleRow(
                    MaviTextTheme().bodyBig(), 'Body Big - $bodyTextSample'),
                _fontStyleRow(MaviTextTheme().body(), 'Body - $bodyTextSample'),
                _fontStyleRow(
                    MaviTextTheme().bodyBold(), 'Body Bold - $bodyTextSample'),
                _fontStyleRow(MaviTextTheme().bodySmall(),
                    'Body Small - $bodyTextSample'),
                _fontStyleRow(MaviTextTheme().bodySmallBold(),
                    'Body Small Bold - $bodyTextSample'),
              ].map((e) => Column(children: [e, maviThemeSpacer()])).toList(),
            ),
          ),
        ]),
        SectionWidget(title: "$title - Font Pairing", slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: margin_lg),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '&',
                        style:
                            MaviTextTheme().bodyStyle().copyWith(fontSize: 112),
                      ),
                      MaviTextTheme().h3(text: 'Pairing\nFonts\nBoard'),
                    ],
                  )),
                  Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MaviTextTheme().h1(text: 'Awesome'),
                          Text(
                            'Font pairing',
                            style: MaviTextTheme()
                                .bodyStyle()
                                .copyWith(fontSize: 32),
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child:
                                      MaviTextTheme().body(text: loremIpsum)),
                              maviThemeVerticalSpacer(),
                              Expanded(
                                  child: MaviTextTheme().body(text: loremIpsum))
                            ],
                          )
                        ],
                      ))
                ],
              ),
            ),
          )
        ])
      ],
    );
  }
}

Widget _fontResume({required String fontName, String? use, TextStyle? style}) {
  return Column(
    children: [
      Row(
        children: [
          SizedBox(
            width: 100,
            child: Center(
              child: RotatedBox(
                quarterTurns: -1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      fontName,
                      style: style,
                    ),
                    if (use != null) Text(use)
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              child: Text(
            "Aa",
            textScaleFactor: 6,
            style: style,
          ))
        ],
      ),
      Row(
        children: [
          const SizedBox(width: 100),
          Expanded(
            child: Text(
              "ABCDEFGHIJKLMNOPQRSTUVWXYZ\n"
              "abcdefghijklmnopqrstuvxyz\n"
              "0 1 2 3 4 5 6 7 8 9",
              style: style,
            ),
          )
        ],
      )
    ],
  );
}

Widget _fontStyleRow(MaviThemeTextWidget textStyle, String description) {
  return DefaultTextStyle.merge(
    style: textStyle.getStyle,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(flex: 2, child: textStyle.textWidget(text: description)),
        Expanded(
            child: Align(
                alignment: Alignment.centerRight,
                child: textStyle.textWidget(
                    text: textStyle.getStyle.fontWeight
                        .toString()
                        .replaceAll("FontWeight.", "")))),
        Expanded(
            child: Align(
                alignment: Alignment.centerRight,
                child: textStyle.textWidget(
                    text: "${textStyle.getStyle.fontSize?.toInt()}"))),
      ],
    ),
  );
}

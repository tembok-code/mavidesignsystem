import 'package:flutter/material.dart';
import 'package:mavi_design_system/components/elements/contents/text.dart';
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
                      MText(title, style: MaviTextStyles.h2),
                      maviThemeSpacer(),
                      Container(color: colorPrimary, height: 2, width: 50),
                      maviThemeSpacer(),
                      const MText(
                          'As a web font you should use Poppins for all headlines and Hind for body text. Every graphic design artwork should be made using these two fonts.'),
                      maviThemeSpacer(),
                      const MText('Headlines', style: MaviTextStyles.bodyBig),
                      const MText('https://fonts.google.com/specimen/Poppins',
                          fontWeight: FontWeight.bold),
                      const MText(
                          'The Devanagari is designed by Ninad Kale. The Latin is by Jonny Pinhorn. TO controbute, see github.com/itfoundary/poppins'),
                      maviThemeSpacer(),
                      const MText('Body Text', style: MaviTextStyles.bodyBig),
                      const MText('https://fonts.google.com/specimen/Hind',
                          fontWeight: FontWeight.bold),
                      const MText(
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
                            style: MaviTextStyles.h1.style),
                        _fontResume(
                            fontName: "Hind",
                            use: "Body",
                            style: MaviTextStyles.body.style),
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
                ...[
                  MaviTextStyles.h1,
                  MaviTextStyles.h2,
                  MaviTextStyles.h3,
                  MaviTextStyles.h4
                ]
                    .map((e) => _fontStyleRow(
                          e,
                          'This is a Header ${e.name.toUpperCase()}',
                        ))
                    .toList(),
                _fontStyleRow(
                    MaviTextStyles.subtitle, 'This is a big subtitle'),
                _fontStyleRow(MaviTextStyles.buttonText, 'Button Text'),
                _fontStyleRow(MaviTextStyles.overline, 'Overline'),
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
                    MaviTextStyles.bodyBig, 'Body Big - $bodyTextSample'),
                _fontStyleRow(MaviTextStyles.body, 'Body - $bodyTextSample'),
                _fontStyleRow(
                    MaviTextStyles.body, 'Body Bold - $bodyTextSample'),
                _fontStyleRow(
                    MaviTextStyles.bodySmall, 'Body Small - $bodyTextSample'),
                _fontStyleRow(MaviTextStyles.bodySmall,
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
                    children: const [
                      MText('&', fontSize: 112),
                      MText(
                        'Pairing\nFonts\nBoard',
                        style: MaviTextStyles.h3,
                      ),
                    ],
                  )),
                  Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MText('Awesome', style: MaviTextStyles.h1),
                          MText('Font pairing', fontSize: 32),
                          Row(
                            children: [
                              Expanded(child: MText(loremIpsum)),
                              maviThemeVerticalSpacer(),
                              Expanded(child: MText(loremIpsum))
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

Widget _fontStyleRow(MaviTextStyles textStyle, String description) {
  return DefaultTextStyle.merge(
    style: textStyle.style,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(flex: 2, child: textStyle.widget(description)),
        Expanded(
            child: Align(
                alignment: Alignment.centerRight,
                child: textStyle.widget(textStyle.style.fontWeight
                    .toString()
                    .replaceAll("FontWeight.", "")))),
        Expanded(
            child: Align(
                alignment: Alignment.centerRight,
                child:
                    textStyle.widget("${textStyle.style.fontSize?.toInt()}"))),
      ],
    ),
  );
}

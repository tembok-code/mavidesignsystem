import 'package:flutter/material.dart';
import 'package:mavi_design_system/components/elements/contents/text.dart';

import '../../../theme/theme.dart';
import '../../components/components_preview.dart';

class ContentText extends StatelessWidget {
  const ContentText({super.key});

  @override
  Widget build(BuildContext context) {
    //
    String title = 'Text';
    //
    return CustomScrollView(
      slivers: [
        SectionWidget(title: '$title - Variants', slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: margin_lg),
              child: Row(
                children: [
                  Expanded(child: MText('Sample Text')),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const MText(
                        'Playground',
                        style: MaviTextStyles.h4,
                      ),
                      Row(
                        children: [
                          Flexible(
                              child:
                                  MText('Styles', fontWeight: FontWeight.bold)),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: MaviTextStyles.values
                                  .map((e) => ListTile(
                                      onTap: (() {}),
                                      title: MText(e.name.toUpperCase(),
                                          style: e)))
                                  .toList(),
                            ),
                          )
                        ],
                      ),
                    ],
                  )),
                ],
              ),
            ),
          ),
        ]),
      ],
    );
  }
}

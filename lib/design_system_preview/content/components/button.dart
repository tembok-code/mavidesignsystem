import 'package:flutter/material.dart';
import 'package:mavi_design_system/components/elements/contents/text.dart';
import 'package:mavi_design_system/components/elements/frame.dart';
import 'package:mavi_design_system/mavi_design_system.dart';

import '../../components/components_preview.dart';

class ContentButton extends StatefulWidget {
  const ContentButton({super.key});

  @override
  State<ContentButton> createState() => _ContentButtonState();
}

class _ContentButtonState extends State<ContentButton> {
  //
  bool disabled = false;
  ButtonVariant selectedVariant = ButtonVariant.solid;
  List<bool> selectedSizeState = [false, true, false];
  ButtonSize selectedSize = ButtonSize.md;
  List<ButtonSize> buttonSizeOptions = [
    ButtonSize.sm,
    ButtonSize.md,
    ButtonSize.lg
  ];
  //
  //
  toggleDisabled() => setState(() => disabled = !disabled);
  setVariant(ButtonVariant value) => setState(() => selectedVariant = value);
  setSize(int index) => setState(() {
        selectedSizeState = selectedSizeState.map((e) => false).toList();
        selectedSizeState[index] = true;
        selectedSize = buttonSizeOptions[index];
      });
  //
  @override
  Widget build(BuildContext context) {
    //
    var colorScheme = Theme.of(context).colorScheme;
    //
    String title = "Button";
    //

    return CustomScrollView(slivers: [
      SectionWidget(title: '$title - Variants', slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: margin_lg),
            child: Row(
              children: [
                Expanded(
                    child: Wrap(
                  spacing: spacing_md,
                  runSpacing: spacing_md,
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  children: [
                    MButton(
                        onTap: () {},
                        label: 'Solid',
                        disabled: disabled,
                        size: selectedSize),
                    MButton(
                        onTap: () {},
                        label: 'Soft',
                        variant: ButtonVariant.soft,
                        disabled: disabled,
                        size: selectedSize),
                    MButton(
                        onTap: () {},
                        label: 'Outlined',
                        variant: ButtonVariant.outlined,
                        disabled: disabled,
                        size: selectedSize),
                    MButton(
                        onTap: () {},
                        label: 'Plain',
                        variant: ButtonVariant.plain,
                        disabled: disabled,
                        size: selectedSize),
                  ],
                )),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MText('Playground', style: MaviTextStyles.h4),
                    Row(
                      children: [
                        const MText('Disabled', fontWeight: FontWeight.bold),
                        MSwitch(
                            value: disabled,
                            onChanged: (value) => toggleDisabled())
                      ],
                    ),
                    Row(
                      children: [
                        const MText('Size', fontWeight: FontWeight.bold),
                        ToggleButtons(
                          isSelected: selectedSizeState,
                          onPressed: (index) => setSize(index),
                          children: const [
                            MText('Small'),
                            MText('Medium'),
                            MText('Large')
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const MText('Variant', fontWeight: FontWeight.bold),
                        DropdownButtonHideUnderline(
                          child: DropdownButton(
                              value: selectedVariant,
                              onChanged: (value) =>
                                  setVariant(value ?? ButtonVariant.solid),
                              items: const [
                                DropdownMenuItem(
                                    value: ButtonVariant.solid,
                                    child: MText('Solid')),
                                DropdownMenuItem(
                                    value: ButtonVariant.soft,
                                    child: MText('Soft')),
                                DropdownMenuItem(
                                    value: ButtonVariant.outlined,
                                    child: MText('Outlined')),
                                DropdownMenuItem(
                                    value: ButtonVariant.plain,
                                    child: MText('Plain'))
                              ]),
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
      SectionWidget(title: '$title - Sizes', slivers: [
        SliverToBoxAdapter(
            child: MFrame(
          child: Wrap(
            spacing: spacing_md,
            runSpacing: spacing_md,
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              MButton(
                  onTap: () {},
                  label: 'Small',
                  variant: selectedVariant,
                  disabled: disabled,
                  size: ButtonSize.sm),
              MButton(
                  onTap: () {},
                  label: 'Medium',
                  variant: selectedVariant,
                  disabled: disabled),
              MButton(
                  onTap: () {},
                  label: 'Large',
                  variant: selectedVariant,
                  disabled: disabled,
                  size: ButtonSize.lg),
            ],
          ),
        ))
      ]),
      SectionWidget(title: '$title - Leading and Tailing', slivers: [
        SliverToBoxAdapter(
            child: Wrap(
          spacing: spacing_md,
          runSpacing: spacing_md,
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            MButton(
                onTap: () {},
                leading: Icons.add,
                label: 'Add to cart',
                variant: selectedVariant,
                disabled: disabled,
                isExpanded: true,
                size: selectedSize),
            MButton(
                onTap: () {},
                leading: Icons.favorite,
                variant: selectedVariant,
                disabled: disabled,
                size: selectedSize),
            MButton(
                onTap: () {},
                label: 'Checkout',
                tailing: Icons.arrow_forward_ios,
                variant: selectedVariant,
                disabled: disabled,
                size: selectedSize),
          ],
        ))
      ]),
      SectionWidget(title: '$title - Loading', slivers: [
        SliverToBoxAdapter(
          child: MFrame(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MButton(
                    onTap: () {},
                    loading: true,
                    variant: selectedVariant,
                    size: selectedSize),
              ],
            ),
          ),
        )
      ])
    ]);
  }
}

import 'package:flutter/material.dart';

import '../theme/theme.dart';
import 'content/content_preview.dart';

class MaviDesignSystemPreview extends StatefulWidget {
  const MaviDesignSystemPreview({super.key});

  @override
  State<MaviDesignSystemPreview> createState() =>
      _MaviDesignSystemPreviewState();
}

class _MaviDesignSystemPreviewState extends State<MaviDesignSystemPreview> {
  //
  _RouteModel currentRoute = _routes.first;
  _RouteModel? hovered;
  //

  setPage(_RouteModel route) {
    setState(() => currentRoute = route);
  }

  setHovered(_RouteModel? route) {
    setState(() => hovered = route);
  }

  @override
  Widget build(BuildContext context) {
    //
    var colorScheme = Theme.of(context).colorScheme;
    Color primary = colorScheme.primary;
    //

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: Row(
        children: [
          Container(
              width: 150,
              //color: colorScheme.surface,
              child: Column(
                children: [
                  Expanded(
                    child: CustomScrollView(
                      shrinkWrap: true,
                      slivers: [
                        SliverToBoxAdapter(
                          child: Column(children: [
                            Text('Content'),
                            ..._routes
                                .map((e) => _ContentButtonWidget(context, e,
                                    currentRoute: currentRoute,
                                    hovered: hovered,
                                    setPage: setPage,
                                    setHovered: setHovered))
                                .toList(),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  Switch(value: true, onChanged: (value) {})
                ],
              )),
          Expanded(
              child: currentRoute.content ??
                  CustomScrollView(slivers: _page404(route: currentRoute)))
        ],
      ),
    );
  }
}

Widget _ContentButtonWidget(
  BuildContext context,
  _RouteModel route, {
  required _RouteModel currentRoute,
  required hovered,
  int level = 1,
  required Function setPage,
  required setHovered,
}) {
  //
  var colorScheme = Theme.of(context).colorScheme;
  Color primary = colorScheme.primary;
  //
  var children = route.subRoutes ?? [];
  bool hasChildren = children.isNotEmpty;
  //
  bool isSelected = currentRoute.name == route.name;
  bool isChildSelected =
      children.where((e) => e.name == currentRoute.name).isNotEmpty;
  bool isHovered = hovered?.name == route.name;

  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Material(
          color: Colors.transparent,
          child: InkWell(
              onTap: () => setPage(route),
              onHover: (value) => setHovered(value ? route : null),
              child: SizedBox(
                width: double.infinity,
                height: 40,
                child: Row(
                  children: [
                    SizedBox(
                      width: 12 * level.toDouble(),
                    ),
                    maviThemeVerticalSpacer(size: spacing_sm),
                    Expanded(
                      child: isSelected || isChildSelected
                          ? MaviTextTheme().bodyBold(text: route.name).copyWith(
                                newColor:
                                    level > 1 && isSelected ? primary : null,
                              )
                          : MaviTextTheme().body(text: route.name),
                    ),
                    Container(
                      width: level > 1 ? 1 : 2,
                      //height: double.infinity,
                      color: level == 1 &&
                              (isSelected || isChildSelected || isHovered)
                          ? primary
                          : level == 1
                              ? Colors.transparent
                              : colorScheme.background,
                    ),
                  ],
                ),
              ))),
      if (hasChildren)
        ListView(shrinkWrap: true, children: [
          ...children
              .map((e) => _ContentButtonWidget(context, e,
                  level: 2,
                  currentRoute: currentRoute,
                  hovered: hovered,
                  setPage: setPage,
                  setHovered: setHovered))
              .toList()
        ])
    ],
  );
}

List<_RouteModel> _routes = [
  _RouteModel(name: "Overview"),
  _RouteModel(name: "Colors", content: ContentColors()),
  _RouteModel(name: "Typography", content: ContentTypography()),
  _RouteModel(name: "Icons"),
  _RouteModel(name: "Components", subRoutes: [
    _RouteModel(name: "Button", content: ContentButton()),
    _RouteModel(name: "Inputs"),
  ])
];

class _RouteModel {
  final String name;
  final Widget? content;
  final List<_RouteModel>? subRoutes;

  _RouteModel({required this.name, this.content, this.subRoutes});
}

List<Widget> _page404({_RouteModel? route}) => [
      SliverToBoxAdapter(
        child: Column(
          children: [
            Text(
              '404',
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black12),
            ),
            Text("No Content to Display"),
            if (route != null) Text("Page: ${route.name}")
          ],
        ),
      )
    ];

// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/rendering.dart';

import 'framework.dart';

export 'package:flutter/rendering.dart' show
    AutoLayoutRect,
    AutoLayoutDelegate;

class AutoLayout extends MultiChildRenderObjectWidget {
  AutoLayout({
    Key key,
    this.delegate,
    List<Widget> children: const <Widget>[]
  }) : super(key: key, children: children);

  final AutoLayoutDelegate delegate;

  @override
  RenderAutoLayout createRenderObject(BuildContext context) => new RenderAutoLayout(delegate: delegate);

  @override
  void updateRenderObject(BuildContext context, RenderAutoLayout renderObject) {
    renderObject.delegate = delegate;
  }
}

class AutoLayoutChild extends ParentDataWidget<AutoLayout> {
  AutoLayoutChild({ AutoLayoutRect rect, Widget child })
    : rect = rect, super(key: new ObjectKey(rect), child: child);

  final AutoLayoutRect rect;

  @override
  void applyParentData(RenderObject renderObject) {
    assert(renderObject.parentData is AutoLayoutParentData);
    final AutoLayoutParentData parentData = renderObject.parentData;
    // AutoLayoutParentData filters out redundant writes and marks needs layout
    // as appropriate.
    parentData.rect = rect;
  }
}

// Copyright (c) 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

part of cassowary;

abstract class _EquationMember {
  Expression asExpression();

  bool get isConstant;

  double get value;

  Constraint operator >=(_EquationMember m) => asExpression() >= m;

  Constraint operator <=(_EquationMember m) => asExpression() <= m;

  Constraint equals(_EquationMember m) => asExpression().equals(m);

  Expression operator +(_EquationMember m) => asExpression() + m;

  Expression operator -(_EquationMember m) => asExpression() - m;

  Expression operator *(_EquationMember m) => asExpression() * m;

  Expression operator /(_EquationMember m) => asExpression() / m;
}

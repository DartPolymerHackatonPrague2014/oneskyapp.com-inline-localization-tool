// Copyright (c) 2014, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';


import 'package:polymer/polymer.dart';

/// A Polymer `<attr-high>` element.

@CustomTag('attr-high')
class AttrHigh extends PolymerElement {
  @observable bool checked = false;

  /// Constructor used to create instance of MainApp.
  AttrHigh.created() : super.created();

  void checkedChanged(bool oldValue, bool newValue) {
    var elements = document.querySelectorAll("*[translateId]");
    if (newValue) {
      elements.classes.add('highlight');
    } else {
      elements.classes.remove('highlight');
    }
  }

  // Optional lifecycle methods - uncomment if needed.

//  /// Called when an instance of main-app is inserted into the DOM.
//  attached() {
//    super.attached();
//  }

//  /// Called when an instance of main-app is removed from the DOM.
//  detached() {
//    super.detached();
//  }

//  /// Called when an attribute (such as a class) of an instance of
//  /// main-app is added, changed, or removed.
//  attributeChanged(String name, String oldValue, String newValue) {
//    super.attributeChanges(name, oldValue, newValue);
//  }

  /// Called when main-app has been fully prepared (Shadow DOM created,
  /// property observers set up, event listeners attached).
//  ready() {
//    super.ready();
//    this.querySelector("#myCheckbox")
//    ..onClick.listen((e) => registerAccount());
//  }

}

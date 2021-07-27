
@JS()
library event;
import 'package:js/js.dart';

@JS()
class Event {
  external factory Event(String type, [EventInit? eventInitDict]);

  /// The name of the event. Case-insensitive.
  external String get type;

  ///  A reference to the target to which the event was originally
  /// dispatched.
  external EventTarget? get target;

  ///  A non-standard alias (from old versions of Microsoft Internet
  /// Explorer) for [Event.target]. Some other browsers are starting to
  /// support it for web compatibility purposes.
  external EventTarget? get srcElement;

  ///  A reference to the currently registered target for the event.
  /// This is the object to which the event is currently slated to be
  /// sent. It's possible this has been changed along the way through
  /// retargeting.
  external EventTarget? get currentTarget;

  ///  Returns the event’s path (objects on which listeners will be
  /// invoked). This does not include nodes in shadow trees if the
  /// shadow root was created with its [ShadowRoot.mode] closed.
  /// var composed = Event.composedPath();
  external Iterable<EventTarget> composedPath();
  external static int get NONE;
  external static int get CAPTURING_PHASE;
  external static int get AT_TARGET;
  external static int get BUBBLING_PHASE;

  /// Indicates which phase of the event flow is being processed.
  external int get eventPhase;

  /// Stops the propagation of events further along in the DOM.
  /// event.stopPropagation();
  external Object stopPropagation();

  ///  A historical alias to [Event.stopPropagation()]. Setting its
  /// value to [true] before returning from an event handler prevents
  /// propagation of the event.
  external bool get cancelBubble;
  external set cancelBubble(bool newValue);

  ///  For this particular event, prevent all other listeners from
  /// being called. This includes listeners attached to the same
  /// element as well as those attached to elements that will be
  /// traversed later (during the capture phase, for instance).
  /// event.stopImmediatePropagation();
  external Object stopImmediatePropagation();

  ///  A boolean indicating whether or not the event bubbles up through
  /// the DOM.
  external bool get bubbles;

  /// A boolean indicating whether the event is cancelable.
  external bool get cancelable;

  ///  A historical property introduced by Internet Explorer and
  /// eventually adopted into the DOM specification in order to ensure
  /// existing sites continue to work. Ideally, you should try to use
  /// [Event.preventDefault()] and [Event.defaultPrevented] instead,
  /// but you can use if you choose to do so.
  @deprecated
  external dynamic get returnValue;
  external set returnValue(covariant dynamic newValue);

  /// Cancels the event (if it is cancelable).
  /// event.preventDefault();
  ///
  external Object preventDefault();

  ///  Indicates whether or not the call to [event.preventDefault()]
  /// canceled the event.
  external bool get defaultPrevented;

  ///  A boolean indicating whether or not the event can bubble across
  /// the boundary between the shadow DOM and the regular DOM.
  external bool get composed;

  ///  Indicates whether or not the event was initiated by the browser
  /// (after a user click, for instance) or by a script (using an event
  /// creation method, like [Event.initEvent]).
  external bool get isTrusted;

  ///  The time at which the event was created (in milliseconds). By
  /// specification, this value is time since epoch—but in reality,
  /// browsers' definitions vary. In addition, work is underway to
  /// change this to be a [DOMHighResTimeStamp] instead.
  external double get timeStamp;
  external Object initEvent(String type,
      [bool? bubbles = false, bool? cancelable = false]);
}



@JS()
class EventTarget {
  external factory EventTarget();

  ///  Registers an event handler of a specific event type on the
  /// [EventTarget].
  /// target.addEventListener(type, listener);
  /// target.addEventListener(type, listener, options);
  /// target.addEventListener(type, listener, useCapture);
  /// target.addEventListener(type, listener, useCapture, wantsUntrusted); // wantsUntrusted is Firefox only
  ///
  external Object addEventListener(String type, EventListener? callback,
      [dynamic options]);

  /// Removes an event listener from the [EventTarget].
  /// target.removeEventListener(type, listener[, options]);
  /// target.removeEventListener(type, listener[, useCapture]);
  /// This example shows how to add a mouseover-based event listener that
  ///  removes a click-based event listener.
  ///
  /// const body = document.querySelector('body')
  /// const clickTarget = document.getElementById('click-target')
  /// const mouseOverTarget = document.getElementById('mouse-over-target')
  ///
  /// let toggle = false;
  /// function makeBackgroundYellow() {
  ///   if (toggle) {
  ///     body.style.backgroundColor = 'white';
  ///   } else {
  ///     body.style.backgroundColor = 'yellow';
  ///   }
  ///
  ///   toggle = !toggle;
  /// }
  ///
  /// clickTarget.addEventListener('click',
  ///   makeBackgroundYellow,
  ///   false
  /// );
  ///
  /// mouseOverTarget.addEventListener('mouseover', function () {
  ///   clickTarget.removeEventListener('click',
  ///     makeBackgroundYellow,
  ///     false
  ///   );
  /// });
  ///
  external Object removeEventListener(String type, EventListener? callback,
      [dynamic options]);

  /// Dispatches an event to this [EventTarget].
  /// cancelled = !target.dispatchEvent(event)
  ///
  /// See Creating and triggering events.
  external bool dispatchEvent(Event event);
}

///  The interface represents an object that can handle an event
/// dispatched by an [EventTarget] object.
///  Note: Due to the need for compatibility with legacy content,
/// accepts both a function and an object with a [handleEvent()]
/// property function. This is shown in the example below.
///
@JS()
class EventListener {
  ///  A function that is called whenever an event of the specified
  /// type occurs.
  /// eventListener.handleEvent(event);
  ///
  external Object handleEvent(Event event);

  external factory EventListener();
}

@anonymous
@JS()
class EventInit {
  external bool get bubbles;
  external set bubbles(bool newValue);
  external bool get cancelable;
  external set cancelable(bool newValue);
  external bool get composed;
  external set composed(bool newValue);

  external factory EventInit(
      {bool bubbles = false, bool cancelable = false, bool composed = false});
}
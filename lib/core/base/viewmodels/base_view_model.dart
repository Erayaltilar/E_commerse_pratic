import 'dart:async';
import 'dart:developer';
import 'package:e_commerse_pratik/core/controllers/log_controller.dart';
import 'package:e_commerse_pratik/core/enums/event_status.dart';
import 'package:flutter/foundation.dart';

abstract class BaseViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool _isDisposed = false;
  bool _isInitialized = false;

  EventStatus _eventStatus = EventStatus.failure;

  FutureOr<void> _initialize;

  BaseViewModel() {
    load();
  }

  FutureOr<void> init();

  void load() async {
    if (!_isInitialized) {
      eventStatus = EventStatus.failure;
      isLoading = true;
      _initialize = init();
      try {
        await _initialize;
        eventStatus = EventStatus.success;
      } catch (e) {
        LogController.errorLog(e);
        eventStatus = EventStatus.failure;
      }
      _isInitialized = true;
      isLoading = false;
    }
  }

  void refresh() async {
    isLoading = true;
    _initialize = init();
    try {
      await _initialize;
      eventStatus = EventStatus.success;
    } catch (e) {
      log("[ERROR]", error: e.toString());
      eventStatus = EventStatus.failure;
    }
    _isInitialized = true;
    isLoading = false;
  }

  //Getters
  bool get isLoading => _isLoading;
  bool get isInitialized => _isInitialized;
  bool get isDisposed => _isDisposed;
  EventStatus get eventStatus => _eventStatus;

  //Setters
  set isLoading(bool value) {
    _isLoading = value;
    scheduleMicrotask(() {
      if (!_isDisposed) notifyListeners();
    });
  }

  set eventStatus(EventStatus value) {
    _eventStatus = value;
    scheduleMicrotask(() {
      if (!_isDisposed) notifyListeners();
    });
  }

  void reloadState() {
    if (!isLoading) notifyListeners();
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }
}

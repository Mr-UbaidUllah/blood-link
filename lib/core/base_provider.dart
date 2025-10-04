import 'package:flutter/material.dart';

enum LoadingState { initial, loading, loaded, error }

class BaseProvider extends ChangeNotifier {
  LoadingState _state = LoadingState.initial;
  String _errorMessage = '';
  bool _disposed = false;

  // Getters
  LoadingState get state => _state;
  String get errorMessage => _errorMessage;
  bool get isLoading => _state == LoadingState.loading;
  bool get hasError => _state == LoadingState.error;
  bool get isLoaded => _state == LoadingState.loaded;

  // State management methods
  void setLoading() {
    _state = LoadingState.loading;
    notifyListeners();
  }

  void setLoaded() {
    _state = LoadingState.loaded;
    notifyListeners();
  }

  void setError(String message) {
    _state = LoadingState.error;
    _errorMessage = message;
    notifyListeners();
  }

  void reset() {
    _state = LoadingState.initial;
    _errorMessage = '';
    notifyListeners();
  }

  // Override dispose to prevent memory leaks
  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }
} 
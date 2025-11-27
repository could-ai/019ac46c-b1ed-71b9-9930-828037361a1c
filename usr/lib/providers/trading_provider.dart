import 'package:flutter/material.dart';
import '../models/trade_model.dart';
import 'dart:math';

class TradingProvider with ChangeNotifier {
  bool _isAutoTrading = true;
  double _riskPerTrade = 1.0; // Percent
  bool _useSMCLogic = true;
  bool _stealthMode = true;

  // Mock Data
  final List<Trade> _activeTrades = [
    Trade(
      id: 'T-1024',
      symbol: 'EURUSD',
      type: TradeType.buy,
      entryPrice: 1.0850,
      currentPrice: 1.0875,
      lotSize: 0.5,
      status: TradeStatus.active,
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
      profit: 125.00,
      aiReasoning: 'Bullish Order Block retest + RSI Divergence',
    ),
    Trade(
      id: 'T-1025',
      symbol: 'XAUUSD',
      type: TradeType.sell,
      entryPrice: 2040.50,
      currentPrice: 2038.00,
      lotSize: 0.1,
      status: TradeStatus.active,
      timestamp: DateTime.now().subtract(const Duration(minutes: 45)),
      profit: 25.00,
      aiReasoning: 'Liquidity Sweep of Asian Highs',
    ),
  ];

  List<Trade> get activeTrades => _activeTrades;
  bool get isAutoTrading => _isAutoTrading;
  double get riskPerTrade => _riskPerTrade;
  bool get useSMCLogic => _useSMCLogic;
  bool get stealthMode => _stealthMode;

  void toggleAutoTrading(bool value) {
    _isAutoTrading = value;
    notifyListeners();
  }

  void setRiskPerTrade(double value) {
    _riskPerTrade = value;
    notifyListeners();
  }

  void toggleSMCLogic(bool value) {
    _useSMCLogic = value;
    notifyListeners();
  }
  
  void toggleStealthMode(bool value) {
    _stealthMode = value;
    notifyListeners();
  }

  // Simulate price updates
  void simulateMarketUpdate() {
    // In a real app, this would connect to a websocket
    final random = Random();
    for (var i = 0; i < _activeTrades.length; i++) {
      // Just random fluctuation for demo
      // ... logic to update currentPrice and profit
    }
    notifyListeners();
  }
}

enum TradeType { buy, sell }
enum TradeStatus { active, closed, pending }

class Trade {
  final String id;
  final String symbol;
  final TradeType type;
  final double entryPrice;
  final double currentPrice;
  final double lotSize;
  final TradeStatus status;
  final DateTime timestamp;
  final double profit;
  final String aiReasoning; // SMC logic explanation

  Trade({
    required this.id,
    required this.symbol,
    required this.type,
    required this.entryPrice,
    required this.currentPrice,
    required this.lotSize,
    required this.status,
    required this.timestamp,
    required this.profit,
    required this.aiReasoning,
  });
}

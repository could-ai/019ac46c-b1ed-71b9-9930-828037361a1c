import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/trading_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TradingProvider>(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('CONFIGURATION'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSectionHeader(theme, 'AUTOMATION'),
          SwitchListTile(
            title: const Text('Master Auto-Trading'),
            subtitle: const Text('Enable/Disable all automated entries'),
            value: provider.isAutoTrading,
            onChanged: provider.toggleAutoTrading,
            secondary: Icon(
              Icons.power_settings_new,
              color: provider.isAutoTrading ? theme.colorScheme.primary : Colors.grey,
            ),
          ),
          SwitchListTile(
            title: const Text('SMC Logic Engine'),
            subtitle: const Text('Use Smart Money Concepts for entry'),
            value: provider.useSMCLogic,
            onChanged: provider.toggleSMCLogic,
            secondary: const Icon(Icons.architecture),
          ),

          const SizedBox(height: 24),
          _buildSectionHeader(theme, 'RISK MANAGEMENT'),
          
          ListTile(
            title: const Text('Risk Per Trade'),
            subtitle: Text('${provider.riskPerTrade.toStringAsFixed(1)}% of Balance'),
            leading: const Icon(Icons.warning_amber_rounded),
          ),
          Slider(
            value: provider.riskPerTrade,
            min: 0.1,
            max: 5.0,
            divisions: 49,
            label: '${provider.riskPerTrade.toStringAsFixed(1)}%',
            onChanged: provider.setRiskPerTrade,
          ),
          
          const ListTile(
            title: Text('Max Daily Drawdown'),
            subtitle: Text('Hard stop at 5.0% loss'),
            leading: Icon(Icons.trending_down),
            trailing: Text('5.0%', style: TextStyle(fontWeight: FontWeight.bold)),
          ),

          const SizedBox(height: 24),
          _buildSectionHeader(theme, 'INTERFACE'),
          SwitchListTile(
            title: const Text('Stealth Mode'),
            subtitle: const Text('Hide sensitive balance info'),
            value: provider.stealthMode,
            onChanged: provider.toggleStealthMode,
            secondary: const Icon(Icons.visibility_off),
          ),
          
          const SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.colorScheme.error.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: theme.colorScheme.error.withOpacity(0.3)),
            ),
            child: Row(
              children: [
                Icon(Icons.dangerous, color: theme.colorScheme.error),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'EMERGENCY STOP',
                        style: TextStyle(
                          color: theme.colorScheme.error,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'Close all positions immediately',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.error,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('EXECUTE'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(ThemeData theme, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, left: 4),
      child: Text(
        title,
        style: TextStyle(
          color: theme.colorScheme.primary,
          fontSize: 12,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5,
        ),
      ),
    );
  }
}

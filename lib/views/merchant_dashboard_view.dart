import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class MerchantDashboardView extends StatefulWidget {
  const MerchantDashboardView({super.key});

  @override
  State<MerchantDashboardView> createState() => _MerchantDashboardViewState();
}

class _MerchantDashboardViewState extends State<MerchantDashboardView> {
  int _selectedTabIndex = 0;
  bool _isReadyForPickup = false;

  void _handleReadyForPickup() {
    setState(() {
      _isReadyForPickup = true;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Un motard ATLAS est en route pour récupérer la commande !"),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 16,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.textPrimary),
          onPressed: () {},
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('ATLAS GOMA', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: AppTheme.textSecondary, letterSpacing: 1.1)),
            Text('Gestion Boutique', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: AppTheme.textPrimary, letterSpacing: -0.5)),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: AppTheme.border),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
                ),
                const SizedBox(width: 6),
                const Text('Ouvert', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppTheme.textPrimary)),
              ],
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Container(
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: AppTheme.border)),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  _buildTab(0, 'Commandes (1)'),
                  const SizedBox(width: 24),
                  _buildTab(1, 'Catalogue & Prix'),
                  const SizedBox(width: 24),
                  _buildTab(2, 'Admin / Stats'),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // New Order Alert
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppTheme.border),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 4)],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(width: 8, height: 8, decoration: const BoxDecoration(color: AppTheme.primary, shape: BoxShape.circle)),
                          const SizedBox(width: 8),
                          const Text('NOUVELLE COMMANDE', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppTheme.primary, letterSpacing: 1.1)),
                        ],
                      ),
                      const Text('#104', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppTheme.textSecondary, fontFamily: 'monospace')),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Divider(height: 1),
                  const SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1550639525-c97d455acf70?w=100&q=80', // Fake dress image
                          width: 64,
                          height: 64,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Robe Wax (M) + Sandales (38)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                            const SizedBox(height: 4),
                            Row(
                              children: const [
                                Text('43 000 FC', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                SizedBox(width: 6),
                                Text('• Payé via M-Pesa', style: TextStyle(fontSize: 10, color: AppTheme.textSecondary)),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: const [
                                Icon(Icons.two_wheeler, size: 14, color: AppTheme.textSecondary),
                                SizedBox(width: 4),
                                Text('3 motards disponibles aux alentours', style: TextStyle(fontSize: 10, color: AppTheme.textSecondary)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: _isReadyForPickup ? null : _handleReadyForPickup,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 44,
                      decoration: BoxDecoration(
                        color: _isReadyForPickup ? Colors.green : AppTheme.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _isReadyForPickup ? 'Motard assigné !' : 'Prêt pour retrait motard',
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                          if (!_isReadyForPickup) ...[
                            const SizedBox(width: 8),
                            const Icon(Icons.arrow_forward, color: Colors.white, size: 16),
                          ] else ...[
                            const SizedBox(width: 8),
                            const Icon(Icons.check, color: Colors.white, size: 16),
                          ]
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Inventory List
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppTheme.border),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 4)],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('ARTICLES & STOCKS', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppTheme.textPrimary, letterSpacing: 1.1)),
                      Text('Taux: 1\$ = 2 750 FC', style: TextStyle(fontSize: 10, color: AppTheme.textSecondary)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Divider(),
                  _buildInventoryItem('Robe Wax Signature', 'Stock : 8 unités', '28 000 FC', false),
                  const Divider(),
                  _buildInventoryItem('Sandales Cuir Goma', 'Stock : 3 unités (Faible)', '15 000 FC', true),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Metrics
            Row(
              children: [
                Expanded(
                  child: _buildMetricCard('Chiffre d\'Affaires', '4 850 000 FC', '~\$1 760 USD aujourd\'hui', false),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildMetricCard('Livraisons Réussies', '312 / 315', '98.4% taux de succès', true),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.verified, size: 14, color: AppTheme.textSecondary),
                SizedBox(width: 6),
                Text('Console Sécurisée ATLAS • Goma', style: TextStyle(fontSize: 10, color: AppTheme.textSecondary)),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(int index, String title) {
    bool isSelected = _selectedTabIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedTabIndex = index),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: isSelected ? AppTheme.textPrimary : Colors.transparent, width: 2)),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 13,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              color: isSelected ? AppTheme.textPrimary : AppTheme.textSecondary,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInventoryItem(String title, String stock, String price, bool isLowStock) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
              const SizedBox(height: 2),
              Text(stock, style: TextStyle(fontSize: 11, fontWeight: isLowStock ? FontWeight.bold : FontWeight.normal, color: isLowStock ? Colors.orange.shade700 : AppTheme.textSecondary)),
            ],
          ),
          Row(
            children: [
              Text(price, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
              const SizedBox(width: 12),
              Container(
                width: 28,
                height: 28,
                decoration: const BoxDecoration(color: AppTheme.neutralBg, shape: BoxShape.circle),
                child: const Icon(Icons.edit, size: 14, color: AppTheme.textSecondary),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCard(String title, String value, String subtitle, bool isPositive) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppTheme.textSecondary, letterSpacing: 1.1)),
          const SizedBox(height: 6),
          Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: AppTheme.textPrimary)),
          const SizedBox(height: 2),
          Text(subtitle, style: TextStyle(fontSize: 10, fontWeight: isPositive ? FontWeight.bold : FontWeight.normal, color: isPositive ? Colors.green : AppTheme.textSecondary)),
        ],
      ),
    );
  }
}

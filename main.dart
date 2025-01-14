import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'SF Pro Display', // iOS benzeri font
      ),
      home: const ProgressOverviewScreen(),
    );
  }
}

class ProgressOverviewScreen extends StatelessWidget {
  const ProgressOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Progress Overview',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              // Üst kartlar
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: _buildStatusCard(
                      '3,869',
                      'Not Started',
                      '96.7%',
                      Colors.grey[300]!,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 1,
                    child: _buildStatusCard(
                      '4',
                      'In Progress',
                      '0.1%',
                      Colors.amber,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 1,
                    child: _buildStatusCard(
                      '127',
                      'Completed',
                      '3.2%',
                      Colors.green,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Grid
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 8,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                  ),
                  itemCount: 48, // 6x8 grid
                  itemBuilder: (context, index) {
                    // Özel durumlar için indeks kontrolü
                    if (index == 0) return _buildGridItem('1', Colors.grey[300]!);
                    if (index == 9) return _buildGridItem('10', Colors.amber);
                    if (index == 17) return _buildGridItem('18', Colors.grey[300]!);
                    if (index == 24) return _buildGridItem('25', Colors.grey[300]!);
                    if (index == 26) return _buildGridItem('27', Colors.amber);
                    if (index == 31) return _buildGridItem('32', Colors.grey[300]!);
                    if (index == 48) return _buildGridItem('49', Colors.grey[300]!);
                    
                    // Varsayılan tamamlanmış öğeler
                    return _buildGridItem('✓', Colors.green);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusCard(String number, String status, String percentage, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            number,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            status,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
          Text(
            percentage,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridItem(String content, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      alignment: Alignment.center,
      child: Text(
        content,
        style: TextStyle(
          color: content == '✓' ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

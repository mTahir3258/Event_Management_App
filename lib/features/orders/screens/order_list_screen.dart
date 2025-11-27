import 'package:flutter/material.dart';
import 'package:ui_specification/core/theme/app_colors.dart';
import 'package:ui_specification/core/theme/app_dimensions.dart';
import 'package:ui_specification/core/utils/responsive.dart';
import 'package:ui_specification/core/widgets/custom_card.dart';
import 'package:ui_specification/core/widgets/status_badge.dart';
import 'package:ui_specification/core/widgets/pagination_controls.dart';

/// Order list screen with tabs
class OrderListScreen extends StatefulWidget {
  const OrderListScreen({super.key});

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentPage = 1;
  int _rowsPerPage = 10;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Mock data
  List<Map<String, dynamic>> get mockOrders => [
    {
      'id': '001',
      'clientName': 'Rajesh & Priya',
      'eventName': 'Wedding Ceremony',
      'eventDate': '2024-12-15',
      'venue': 'Grand Palace Hotel',
      'status': 'confirmed',
      'paymentStatus': 'partial',
    },
    {
      'id': '002',
      'clientName': 'Amit & Sneha',
      'eventName': 'Reception',
      'eventDate': '2024-12-20',
      'venue': 'Royal Gardens',
      'status': 'pending',
      'paymentStatus': 'pending',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: const [
            Tab(text: 'All'),
            Tab(text: 'Upcoming'),
            Tab(text: 'Unassigned'),
            Tab(text: 'Payment Due'),
            Tab(text: 'Completed'),
          ],
        ),
        actions: [
          if (!Responsive.isDesktop(context))
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.spacing8,
                vertical: AppDimensions.spacing8,
              ),
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('New Order'),
              ),
            ),
        ],
      ),
      floatingActionButton: Responsive.isMobile(context)
          ? FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add))
          : null,
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOrdersList(),
          _buildOrdersList(),
          _buildOrdersList(),
          _buildOrdersList(),
          _buildOrdersList(),
        ],
      ),
    );
  }

  Widget _buildOrdersList() {
    return Column(
      children: [
        Expanded(
          child: Responsive.isMobile(context)
              ? _buildMobileList()
              : _buildDataTable(),
        ),
        PaginationControls(
          currentPage: _currentPage,
          totalPages: (mockOrders.length / _rowsPerPage).ceil(),
          rowsPerPage: _rowsPerPage,
          totalItems: mockOrders.length,
          onPageChanged: (page) {
            setState(() {
              _currentPage = page;
            });
          },
          onRowsPerPageChanged: (rows) {
            setState(() {
              _rowsPerPage = rows;
              _currentPage = 1;
            });
          },
        ),
      ],
    );
  }

  Widget _buildMobileList() {
    return ListView.builder(
      padding: const EdgeInsets.all(AppDimensions.spacing8),
      itemCount: mockOrders.length,
      itemBuilder: (context, index) {
        final order = mockOrders[index];
        return CustomCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      order['eventName'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  StatusBadge(
                    label: order['status'].toString().toUpperCase(),
                    type: StatusType.inProgress,
                    small: true,
                  ),
                ],
              ),
              const SizedBox(height: AppDimensions.spacing8),
              Row(
                children: [
                  const Icon(
                    Icons.people,
                    size: 16,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(width: AppDimensions.spacing4),
                  Text(
                    order['clientName'],
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: AppDimensions.spacing4),
              Row(
                children: [
                  const Icon(
                    Icons.calendar_today,
                    size: 16,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(width: AppDimensions.spacing4),
                  Text(
                    order['eventDate'],
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: AppDimensions.spacing4),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    size: 16,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(width: AppDimensions.spacing4),
                  Expanded(
                    child: Text(
                      order['venue'],
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppDimensions.spacing12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text('View Details'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDataTable() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppDimensions.spacing16),
      child: Card(
        child: SizedBox(
          width: double.infinity,
          child: DataTable(
            columns: const [
              DataColumn(label: Text('Order ID')),
              DataColumn(label: Text('Client')),
              DataColumn(label: Text('Event')),
              DataColumn(label: Text('Date')),
              DataColumn(label: Text('Venue')),
              DataColumn(label: Text('Status')),
              DataColumn(label: Text('Actions')),
            ],
            rows: mockOrders.map((order) {
              return DataRow(
                cells: [
                  DataCell(Text(order['id'])),
                  DataCell(Text(order['clientName'])),
                  DataCell(Text(order['eventName'])),
                  DataCell(Text(order['eventDate'])),
                  DataCell(Text(order['venue'])),
                  DataCell(
                    StatusBadge(
                      label: order['status'].toString().toUpperCase(),
                      type: StatusType.inProgress,
                      small: true,
                    ),
                  ),
                  DataCell(
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.visibility_outlined, size: 20),
                          onPressed: () {},
                          tooltip: 'View',
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit_outlined, size: 20),
                          onPressed: () {},
                          tooltip: 'Edit',
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

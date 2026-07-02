// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:warehouse/data/datasource/user/product_datasource.dart';
// import 'package:warehouse/data/datasource/user/warehouse_datasource.dart';
// import 'package:warehouse/data/model/response/product_response_model.dart';
// import 'package:warehouse/data/model/response/warehouse_response_model.dart';

// part 'admin_stock_event.dart';
// part 'admin_stock_state.dart';
// part 'admin_stock_bloc.freezed.dart';

// class AdminStockBloc extends Bloc<AdminStockEvent, AdminStockState> {
//   final ProductDatasource _productDs = ProductDatasource();
//   final WarehouseDatasource _warehouseDs = WarehouseDatasource();

//   AdminStockBloc() : super(const AdminStockState.initial()) {
//     on<_Load>(_onLoad);
//     on<_FilterWarehouse>(_onFilter);
//   }

//   Future<void> _onLoad(
//       _Load event, Emitter<AdminStockState> emit) async {
//     emit(const AdminStockState.loading());
//     await _fetch(null, emit);
//   }

//   Future<void> _onFilter(
//       _FilterWarehouse event, Emitter<AdminStockState> emit) async {
//     emit(const AdminStockState.loading());
//     await _fetch(event.warehouseId, emit);
//   }

//   Future<void> _fetch(
//       int? warehouseId, Emitter<AdminStockState> emit) async {
//     final results = await Future.wait([
//       _productDs.getProducts(isActive: true),
//       _warehouseDs.getWarehouses(isActive: true),
//     ]);

//     List<ProductModel> products = [];
//     List<WarehouseModel> warehouses = [];

//     (results[0] as dynamic).fold((_) {}, (r) => products = r.data);
//     (results[1] as dynamic).fold((_) {}, (r) => warehouses = r.data);

//     emit(AdminStockState.loaded(
//       products: products,
//       warehouses: warehouses,
//       selectedWarehouseId: warehouseId,
//     ));
//   }
// }






import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:warehouse/data/datasource/user/product_datasource.dart';
import 'package:warehouse/data/datasource/user/warehouse_datasource.dart';
import 'package:warehouse/data/model/response/product_response_model.dart';
import 'package:warehouse/data/model/response/warehouse_response_model.dart';

part 'admin_stock_event.dart';
part 'admin_stock_state.dart';
part 'admin_stock_bloc.freezed.dart';

class AdminStockBloc extends Bloc<AdminStockEvent, AdminStockState> {
  final ProductDatasource _productDs = ProductDatasource();
  final WarehouseDatasource _warehouseDs = WarehouseDatasource();

  AdminStockBloc() : super(const AdminStockState.initial()) {
    on<_Load>(_onLoad);
    on<_FilterWarehouse>(_onFilter);
  }

  Future<void> _onLoad(
      _Load event, Emitter<AdminStockState> emit) async {
    emit(const AdminStockState.loading());
    await _fetch(null, emit);
  }

  Future<void> _onFilter(
      _FilterWarehouse event, Emitter<AdminStockState> emit) async {
    emit(const AdminStockState.loading());
    await _fetch(event.warehouseId, emit);
  }

  Future<void> _fetch(
      int? warehouseId, Emitter<AdminStockState> emit) async {
    final results = await Future.wait([
      _productDs.getProducts(isActive: true),
      _warehouseDs.getWarehouses(isActive: true),
    ]);

    List<ProductModel> products = [];
    List<WarehouseModel> warehouses = [];

    (results[0] as dynamic).fold((_) {}, (r) => products = r.data);
    (results[1] as dynamic).fold((_) {}, (r) => warehouses = r.data);

    emit(AdminStockState.loaded(
      products: products,
      warehouses: warehouses,
      selectedWarehouseId: warehouseId,
    ));
  }
}
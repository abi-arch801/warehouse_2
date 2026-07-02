// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:warehouse/data/datasource/user/product_datasource.dart';
// import 'package:warehouse/data/datasource/user/warehouse_datasource.dart';
// import 'package:warehouse/data/model/response/product_response_model.dart';
// import 'package:warehouse/data/model/response/warehouse_response_model.dart';

// part 'stock_manual_in_event.dart';
// part 'stock_manual_in_state.dart';
// part 'stock_manual_in_bloc.freezed.dart';

// class StockManualInBloc extends Bloc<StockManualInEvent, StockManualInState> {
//   final ProductDatasource _productDs = ProductDatasource();
//   final WarehouseDatasource _warehouseDs = WarehouseDatasource();

//   StockManualInBloc() : super(const StockManualInState.initial()) {
//     on<_LoadOptions>(_onLoadOptions);
//   }

//   Future<void> _onLoadOptions(
//       _LoadOptions event, Emitter<StockManualInState> emit) async {
//     emit(const StockManualInState.loading());

//     final results = await Future.wait([
//       _productDs.getProducts(isActive: true),
//       _warehouseDs.getWarehouses(isActive: true),
//     ]);

//     List<ProductModel> products = [];
//     List<WarehouseModel> warehouses = [];
//     String? error;

//     (results[0] as dynamic).fold((e) => error = e, (r) => products = r.data);
//     (results[1] as dynamic).fold((e) => error = e, (r) => warehouses = r.data);

//     if (products.isEmpty && warehouses.isEmpty && error != null) {
//       emit(StockManualInState.error(error!));
//       return;
//     }

//     emit(StockManualInState.loaded(products: products, warehouses: warehouses));
//   }
// }
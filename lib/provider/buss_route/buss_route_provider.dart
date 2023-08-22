import 'package:buss_app/repository/firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'buss_route_provider.g.dart';

@riverpod
class BussRouteProvider extends _$BussRouteProvider {
  @override
  FutureOr<void> build() async {
    final buss = await tripsRef.doc().get();
    print(buss.data()!.startPosition);
  }
}
